import 'dart:developer';
import 'dart:ui';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../models/media_item_model.dart';
import '../../utils/imgage_url_formator.dart';
import '../blocs/add_to_playlist/add_to_playlist_cubit.dart';
import '../blocs/media_player/app_player_cubit.dart';
import '../blocs/mini_player/mini_player_bloc.dart';
import '../route/global_str_consts.dart';
import '../theme/app_color.dart';
import '../theme/app_text_theme.dart';
import 'load_image_cached.dart';

class MiniPlayerWidget extends StatelessWidget {
  const MiniPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MiniPlayerBloc, MiniPlayerState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) {
            const begin = Offset(0.0, 2.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            );
            final offsetAnimation = curvedAnimation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          child: switch (state) {
            MiniPlayerInitial() => const SizedBox(),
            MiniPlayerCompleted() => MiniPlayerCard(
                state: state,
                isCompleted: true,
              ),
            MiniPlayerWorking() => MiniPlayerCard(
                state: state,
                isProcessing: state.isBuffering,
              ),
            MiniPlayerError() => const SizedBox(),
            MiniPlayerProcessing() => MiniPlayerCard(
                state: state,
                isProcessing: true,
              ),
          },
        );
      },
    );
  }
}

class MiniPlayerCard extends StatelessWidget {
  final MiniPlayerState state;
  final bool isCompleted;
  final bool isProcessing;

  const MiniPlayerCard({
    super.key,
    required this.state,
    this.isCompleted = false,
    this.isProcessing = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(GlobalStrConsts.playerScreen);
      },
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < -10) {
          context.read<AppPlayerCubit>().appMusicPlayer.skipToNext();
        }
        if (details.primaryVelocity! > 10) {
          context.read<AppPlayerCubit>().appMusicPlayer.skipToPrevious();
        }
      },
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! < -10) {
          context.pushNamed(GlobalStrConsts.playerScreen);
        }
        if (details.primaryVelocity! > 10) {
          // context.read<BloomeePlayerCubit>().bloomeePlayer.stop();
        }
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: SizedBox(
          height: 70,
          child: Stack(
            children: [
              Container(
                color: AppColor.themeColor,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: LoadImageCached(
                  imageUrl: formatImgURL(
                    state.song.artUri.toString(),
                    ImageQuality.low,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaY: 18,
                    sigmaX: 18,
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0.5), // Keep the container color transparent
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      top: 4,
                      bottom: 4,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: SizedBox(
                        width: 61,
                        height: 61,
                        child: LoadImageCached(
                          imageUrl: formatImgURL(
                            state.song.artUri.toString(),
                            ImageQuality.low,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.song.title,
                          style: AppTextTheme.secondoryTextStyle.merge(
                            const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor1,
                            ),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          state.song.artist ?? 'Unknown Artist',
                          style: AppTextTheme.secondoryTextStyle.merge(
                            TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.5,
                              color: AppColor.primaryColor1.withOpacity(0.7),
                            ),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  ResponsiveBreakpoints.of(context).isDesktop
                      ? IconButton(
                          icon: const Icon(
                            FontAwesome.backward_step_solid,
                            size: 28,
                          ),
                          onPressed: () {
                            context.read<AppPlayerCubit>().appMusicPlayer.skipToPrevious();
                          },
                        )
                      : const SizedBox.shrink(),
                  (state.isBuffering || isProcessing)
                      ? const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: SizedBox.square(
                            dimension: 20,
                            child: CircularProgressIndicator(
                              color: AppColor.primaryColor1,
                            ),
                          ),
                        )
                      : (isCompleted
                          ? IconButton(
                              onPressed: () {
                                context.read<AppPlayerCubit>().appMusicPlayer.rewind();
                              },
                              icon: const Icon(FontAwesome.rotate_right_solid, size: 25))
                          : IconButton(
                              icon: Icon(
                                state.isPlaying ? FontAwesome.pause_solid : FontAwesome.play_solid,
                                size: 28,
                              ),
                              onPressed: () {
                                state.isPlaying
                                    ? context.read<AppPlayerCubit>().appMusicPlayer.pause()
                                    : context.read<AppPlayerCubit>().appMusicPlayer.play();
                              },
                            )),
                  ResponsiveBreakpoints.of(context).isDesktop
                      ? IconButton(
                          icon: const Icon(
                            FontAwesome.forward_step_solid,
                            size: 28,
                          ),
                          onPressed: () {
                            context.read<AppPlayerCubit>().appMusicPlayer.skipToNext();
                          },
                        )
                      : const SizedBox.shrink(),
                  IconButton(
                    onPressed: () {
                      context.read<AddToPlaylistCubit>().setMediaItemModel(mediaItem2MediaItemModel(state.song));
                      context.pushNamed(GlobalStrConsts.addToPlaylistScreen);
                    },
                    icon: const Icon(
                      FontAwesome.plus_solid,
                      size: 25,
                    ),
                  ),
                ],
              ),
              isCompleted
                  ? const SizedBox()
                  : Positioned.fill(
                      bottom: 2,
                      left: 8,
                      right: 8,
                      top: 68,
                      child: StreamBuilder<ProgressBarStreams>(
                          stream: context.watch<AppPlayerCubit>().progressStreams,
                          builder: (context, snapshot) {
                            try {
                              if (snapshot.hasData) {
                                return ProgressBar(
                                  thumbRadius: 0,
                                  barHeight: 4,
                                  baseBarColor: Colors.transparent,
                                  timeLabelLocation: TimeLabelLocation.none,
                                  progress: snapshot.data!.currentPos,
                                  total: snapshot.data!.currentPlaybackState.duration!,
                                );
                              }
                            } catch (e) {
                              log("$e");
                            }
                            return const SizedBox();
                          }),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
