import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:music/presentation/blocs/media_player/app_player_cubit.dart';

import '../../models/media_item_model.dart';
import '../../service/app_database_service.dart';
import '../../service/snack_bar_service.dart';
import '../../utils/imgage_url_formator.dart';
import '../theme/app_color.dart';
import '../theme/app_text_theme.dart';
import 'load_image_cached.dart';

class SongCardWidget extends StatelessWidget {
  final MediaItemModel song;
  final bool? showOptions;
  final bool? showInfoBtn;
  final bool? showPlayBtn;
  final bool? showCopyBtn;
  final bool? delDownBtn;
  final bool? isWide;
  final VoidCallback? onOptionsTap;
  final VoidCallback? onInfoTap;
  final VoidCallback? onPlayTap;
  final VoidCallback? onDelDownTap;
  final VoidCallback? onTap;
  final Widget? trailing;

  const SongCardWidget({
    super.key,
    required this.song,
    this.showOptions,
    this.showInfoBtn,
    this.showPlayBtn,
    this.delDownBtn,
    this.onOptionsTap,
    this.onInfoTap,
    this.onPlayTap,
    this.onTap,
    this.onDelDownTap,
    this.showCopyBtn,
    this.isWide = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashColor: AppColor.accentColor1.withOpacity(0.2),
        hoverColor: AppColor.primaryColor2.withOpacity(0.1),
        highlightColor: AppColor.primaryColor2.withOpacity(0.1),
        onTap: () {
          if (onTap != null) onTap!();
        },
        onSecondaryTap: () {
          if (onOptionsTap != null) onOptionsTap!();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 2, top: 4, bottom: 4),
          child: Row(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: StreamBuilder<MediaItem?>(
                    stream: context.read<AppPlayerCubit>().appMusicPlayer.mediaItem,
                    builder: (context, snapshot) {
                      return (snapshot.data != null && snapshot.data?.id == song.id)
                          ? const Icon(
                              FontAwesome.caret_right_solid,
                              color: AppColor.accentColor1,
                              size: 25,
                            )
                          : const SizedBox();
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: isWide ?? false
                      ? SizedBox(
                          width: 80,
                          height: 55,
                          child: LoadImageCached(
                            imageUrl: formatImgURL(
                              song.artUri.toString(),
                              ImageQuality.low,
                            ),
                            fit: BoxFit.cover,
                          ),
                        )
                      : SizedBox(
                          width: 55,
                          height: 55,
                          child: LoadImageCached(
                            imageUrl: formatImgURL(
                              song.artUri.toString(),
                              ImageQuality.low,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1),
                      child: Text(
                        song.title,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextTheme.tertiaryTextStyle.merge(
                          const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColor.primaryColor1,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      song.artist ?? 'Unknown',
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTextTheme.tertiaryTextStyle.merge(
                        TextStyle(
                          color: AppColor.primaryColor1.withOpacity(0.8),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              (showPlayBtn ?? false)
                  ? Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2),
                      child: IconButton(
                        icon: const Icon(
                          FontAwesome.play_solid,
                          size: 30,
                          color: AppColor.primaryColor1,
                        ),
                        onPressed: () {
                          if (onPlayTap != null) onPlayTap!();
                        },
                      ),
                    )
                  : const SizedBox(),
              (showCopyBtn ?? false)
                  ? Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2),
                      child: Tooltip(
                        message: "Copy to clipboard",
                        child: IconButton(
                          icon: const Icon(
                            MingCute.copy_2_fill,
                            size: 30,
                            color: AppColor.primaryColor1,
                          ),
                          onPressed: () {
                            try {
                              Clipboard.setData(ClipboardData(text: "${song.title} by ${song.artist}"));

                              SnackBarService.showMessage("Copied to clipboard", duration: const Duration(seconds: 2));
                            } catch (e) {
                              SnackBarService.showMessage("Failed to copy ${song.title}");
                            }
                          },
                        ),
                      ),
                    )
                  : const SizedBox(),
              (showInfoBtn ?? false)
                  ? Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2),
                      child: Tooltip(
                        message: "About this song",
                        child: IconButton(
                          icon: const Icon(
                            MingCute.information_line,
                            size: 30,
                            color: AppColor.primaryColor1,
                          ),
                          onPressed: () {
                            if (onInfoTap != null) {
                              onInfoTap!();
                            } else {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => SongInfoScreen(song: song),
                              //   ),
                              // );
                            }
                          },
                        ),
                      ),
                    )
                  : const SizedBox(),
              (delDownBtn ?? false)
                  ? Padding(
                      padding: const EdgeInsets.only(left: 2, right: 0),
                      child: IconButton(
                        icon: const Icon(
                          MingCute.delete_2_line,
                          size: 28,
                          color: AppColor.primaryColor1,
                        ),
                        onPressed: () {
                          try {
                            if (context.read<AppPlayerCubit>().appMusicPlayer.currentMedia.id != song.id) {
                              AppDatabaseService.removeDownloadDB(song);
                              SnackBarService.showMessage("Removed ${song.title}");
                            } else {
                              SnackBarService.showMessage("Cannot delete currently playing song");
                            }
                          } catch (e) {
                            AppDatabaseService.removeDownloadDB(song);
                            SnackBarService.showMessage("Removed ${song.title}");
                          }
                        },
                      ),
                    )
                  : const SizedBox(),
              !(showOptions ?? true)
                  ? const SizedBox()
                  : IconButton(
                      icon: const Icon(
                        MingCute.more_2_fill,
                        color: AppColor.primaryColor1,
                      ),
                      onPressed: () {
                        if (onOptionsTap != null) onOptionsTap!();
                      },
                    ),
              trailing ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class SongCardDummyWidget extends StatelessWidget {
  const SongCardDummyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white.withOpacity(0.15),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Container(
                      width: 300,
                      height: 17,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withOpacity(0.15),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.15),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
