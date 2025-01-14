import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../models/media_item_model.dart';
import '../../repository/mixed_api/mixed_api.dart';
import '../../service/snack_bar_service.dart';
import '../../utils/imgage_url_formator.dart';
import '../blocs/media_player/app_player_cubit.dart';
import '../route/global_str_consts.dart';
import '../theme/app_color.dart';
import '../theme/app_text_theme.dart';
import 'load_image_cached.dart';

class ChartListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imgUrl;
  final bool rectangularImage;
  final VoidCallback? onTap;

  const ChartListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imgUrl,
    this.onTap,
    this.rectangularImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        log("imgUrl: $imgUrl", name: "ChartListTile");
        if (onTap != null) {
          onTap!();
        } else {
          SnackBarService.showMessage(
            "Loading media...",
            loading: true,
          );
          MediaItemModel? mediaItem;
          try {
            mediaItem = await MixedAPI.getYtTrackByMeta("$title $subtitle".trim());
            if (mediaItem != null) {
              SnackBarService.showMessage(
                "Media loaded.",
                loading: false,
                duration: const Duration(seconds: 1),
              );
              context.read<AppPlayerCubit>().appMusicPlayer.addQueueItem(
                    mediaItem,
                    single: true,
                    doPlay: true,
                  );
              return;
            }
          } catch (e) {
            log(e.toString(), name: "ChartListTile");
          }
          context.push("/${GlobalStrConsts.searchScreen}?query=$title by $subtitle");
          SnackBarService.showMessage(
            "Can't find media. Searching...",
            loading: false,
            duration: const Duration(seconds: 1),
          );
        }
      },
      child: SizedBox(
        // width: 320,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: rectangularImage
                ? SizedBox(
                    height: 60,
                    width: 80,
                    child: LoadImageCached(
                      imageUrl: formatImgURL(imgUrl, ImageQuality.low),
                      fit: BoxFit.cover,
                    ),
                  )
                : SizedBox(
                    height: 60,
                    width: 60,
                    child: LoadImageCached(
                      imageUrl: formatImgURL(
                        imgUrl,
                        ImageQuality.low,
                      ),
                    ),
                  ),
          ),
          title: Text(
            title,
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
          subtitle: Text(
            subtitle,
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
        ),
      ),
    );
  }
}
