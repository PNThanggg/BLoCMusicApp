import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../models/artist_model.dart';
import '../../utils/imgage_url_formator.dart';
import '../theme/app_color.dart';
import '../theme/app_text_theme.dart';
import 'load_image_cached.dart';

class ArtistCard extends StatelessWidget {
  final ArtistModel artist;

  ArtistCard({
    super.key,
    required this.artist,
  });

  final ValueNotifier<bool> hovering = ValueNotifier(false);

  void setHovering(bool isHovering) {
    hovering.value = isHovering;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: 180,
        child: GestureDetector(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ArtistView(
            //       artist: artist,
            //     ),
            //   ),
            // );
          },
          child: Card(
            color: Colors.transparent,
            shadowColor: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MouseRegion(
                  onEnter: (event) {
                    setHovering(true);
                  },
                  onExit: (event) {
                    setHovering(false);
                  },
                  child: Hero(
                    tag: artist.sourceId,
                    child: ClipOval(
                      child: SizedBox.square(
                        dimension: 160,
                        child: Stack(
                          children: [
                            LoadImageCached(
                              imageUrl: formatImgURL(
                                artist.imageUrl,
                                ImageQuality.medium,
                              ),
                            ),
                            ValueListenableBuilder(
                              valueListenable: hovering,
                              builder: (context, child, value) {
                                return Positioned.fill(
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    color: hovering.value ? Colors.black.withOpacity(0.5) : Colors.transparent,
                                    child: Center(
                                      child: AnimatedOpacity(
                                        duration: const Duration(milliseconds: 200),
                                        opacity: hovering.value ? 1 : 0,
                                        child: const Icon(
                                          MingCute.play_circle_line,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text(
                      artist.name,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: AppTextTheme.secondoryTextStyleMedium.merge(
                        TextStyle(
                          fontSize: 14,
                          color: AppColor.primaryColor1.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
