import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/local/media_playlist_database.dart';
import '../../models/media_item_model.dart';
import '../../service/app_database_service.dart';
import '../../service/app_file_manager.dart';
import '../../service/snack_bar_service.dart';
import '../blocs/add_to_playlist/add_to_playlist_cubit.dart';
import '../blocs/app_database/app_database_cubit.dart';
import '../blocs/downloader/downloader_cubit.dart';
import '../blocs/media_player/bloomee_player_cubit.dart';
import '../route/global_str_consts.dart';
import '../theme/app_color.dart';
import 'song_tile.dart';

void showMoreBottomSheet(
  BuildContext context,
  MediaItemModel song, {
  bool showDelete = false,
  bool showSinglePlay = false,
  VoidCallback? onDelete,
}) {
  bool? isDownloaded;
  AppDatabaseService.getDownloadDB(song).then((value) {
    if (value != null) {
      isDownloaded = true;
    } else {
      isDownloaded = false;
    }
  });
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 7, 17, 50),
                Color.fromARGB(255, 5, 0, 24),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.5],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  bottom: 8,
                  left: 5,
                  right: 4,
                ),
                child: SongCardWidget(
                  song: song,
                  showOptions: false,
                  showCopyBtn: true,
                  showInfoBtn: true,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Opacity(
                  opacity: 0.5,
                  child: Divider(
                    thickness: 2,
                    color: AppColor.primaryColor1,
                  ),
                ),
              ),
              (showSinglePlay)
                  ? ListTile(
                      leading: const Icon(
                        MingCute.play_circle_fill,
                        color: AppColor.primaryColor1,
                        size: 28,
                      ),
                      title: const Text(
                        'Play Now',
                        style: TextStyle(
                            color: AppColor.primaryColor1,
                            fontFamily: "Unageo",
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        context.read<BloomeePlayerCubit>().bloomeePlayer.addQueueItem(
                              song,
                              doPlay: true,
                              single: true,
                            );
                        SnackBarService.showMessage(
                          "Playing ${song.title}",
                          duration: const Duration(seconds: 2),
                        );
                      },
                    )
                  : const SizedBox.shrink(),
              ListTile(
                leading: const Icon(
                  MingCute.square_arrow_right_line,
                  color: AppColor.primaryColor1,
                  size: 28,
                ),
                title: const Text(
                  'Play Next',
                  style: TextStyle(
                    color: AppColor.primaryColor1,
                    fontFamily: "Unageo",
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  context.read<BloomeePlayerCubit>().bloomeePlayer.addQueueItem(song, doPlay: false);
                  SnackBarService.showMessage(
                    "Added to Next in Queue",
                    duration: const Duration(seconds: 2),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  MingCute.playlist_2_line,
                  color: AppColor.primaryColor1,
                  size: 28,
                ),
                title: const Text(
                  'Add to Queue',
                  style: TextStyle(
                    color: AppColor.primaryColor1,
                    fontFamily: "Unageo",
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  context.read<BloomeePlayerCubit>().bloomeePlayer.addQueueItem(song, atLast: true, doPlay: false);
                  SnackBarService.showMessage("Added to Queue", duration: const Duration(seconds: 2));
                },
              ),
              ListTile(
                leading: const Icon(
                  MingCute.heart_fill,
                  color: AppColor.primaryColor1,
                  size: 28,
                ),
                title: const Text(
                  'Add to Favorites',
                  style: TextStyle(
                    color: AppColor.primaryColor1,
                    fontFamily: "Unageo",
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  context.read<AppDatabaseCubit>().addMediaItemToPlaylist(
                        song,
                        MediaPlaylistDatabase(playlistName: "Liked"),
                      );
                  // SnackbarService.showMessage("Added to Favorites",
                  //     duration: const Duration(seconds: 2));
                },
              ),
              ListTile(
                leading: const Icon(
                  MingCute.add_circle_fill,
                  color: AppColor.primaryColor1,
                  size: 28,
                ),
                title: const Text(
                  'Add to Playlist',
                  style: TextStyle(
                    color: AppColor.primaryColor1,
                    fontFamily: "Unageo",
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  context.read<AddToPlaylistCubit>().setMediaItemModel(song);
                  context.pushNamed(GlobalStrConsts.addToPlaylistScreen);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.share,
                  color: AppColor.primaryColor1,
                  size: 28,
                ),
                title: const Text(
                  'Share',
                  style: TextStyle(
                    color: AppColor.primaryColor1,
                    fontFamily: "Unageo",
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  SnackBarService.showMessage("Preparing ${song.title} for share.");
                  final tmpPath = await AppFileManager.exportMediaItem(
                    mediaItem2MediaItemDB(song),
                  );
                  tmpPath != null
                      ? Share.shareXFiles(
                          [
                            XFile(tmpPath),
                          ],
                        )
                      : null;
                },
              ),
              Platform.isAndroid
                  ? (isDownloaded != null && isDownloaded == true)
                      ? ListTile(
                          leading: const Icon(
                            MingCute.check_circle_line,
                            color: AppColor.primaryColor1,
                            size: 28,
                          ),
                          title: const Text(
                            'Already Downloaded',
                            style: TextStyle(
                              color: AppColor.primaryColor1,
                              fontFamily: "Unageo",
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            // context.read<DownloaderCubit>().downloadSong(song);
                          },
                        )
                      : ListTile(
                          leading: const Icon(
                            MingCute.download_2_fill,
                            color: AppColor.primaryColor1,
                            size: 28,
                          ),
                          title: const Text(
                            'Download',
                            style: TextStyle(
                                color: AppColor.primaryColor1,
                                fontFamily: "Unageo",
                                fontSize: 17,
                                fontWeight: FontWeight.w400),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            context.read<DownloaderCubit>().downloadSong(song);
                          },
                        )
                  : const SizedBox.shrink(),
              ListTile(
                leading: const Icon(
                  MingCute.external_link_line,
                  color: AppColor.primaryColor1,
                  size: 28,
                ),
                title: const Text(
                  'Open original link',
                  style: TextStyle(
                    color: AppColor.primaryColor1,
                    fontFamily: "Unageo",
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  launchUrl(Uri.parse(song.extras?['perma_url']));
                },
              ),
              Visibility(
                visible: showDelete,
                child: ListTile(
                  leading: const Icon(
                    MingCute.delete_2_fill,
                    color: AppColor.primaryColor1,
                    size: 28,
                  ),
                  title: const Text(
                    'Delete',
                    style: TextStyle(
                      color: AppColor.primaryColor1,
                      fontFamily: "Unageo",
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    if (onDelete != null) onDelete();
                  },
                ),
              ),
            ],
          ),
        );
      });
}
