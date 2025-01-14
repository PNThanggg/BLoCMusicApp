import 'package:flutter/material.dart';

import 'load_image_cached.dart';
import 'play_pause_widget.dart';

class CarouselCardView extends StatelessWidget {
  final String coverImageUrl;

  const CarouselCardView({
    super.key,
    required this.coverImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 1.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: LoadImageCached(imageUrl: coverImageUrl),
          ),
        ),
        const Positioned(
          bottom: 15,
          right: 20,
          child: PlayPauseButton(),
        ),
      ],
    );
  }
}
