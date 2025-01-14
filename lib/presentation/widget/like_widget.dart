import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../theme/app_color.dart';

class LikeBtnWidget extends StatefulWidget {
  final bool isLiked;
  final bool isPlaying;
  final double iconSize;
  final VoidCallback? onLiked;
  final VoidCallback? onDisliked;

  const LikeBtnWidget({
    super.key,
    this.isLiked = false,
    this.isPlaying = false,
    this.iconSize = 50,
    this.onLiked,
    this.onDisliked,
  });

  @override
  State<LikeBtnWidget> createState() => _LikeBtnWidgetState();
}

class _LikeBtnWidgetState extends State<LikeBtnWidget> {
  bool _isLiked = false;

  Icon _heartIcon({isLiked = false, color = AppColor.accentColor2, size = 50}) {
    return isLiked
        ? Icon(
            AntDesign.heart_fill,
            color: color,
            size: size,
          )
        : Icon(
            AntDesign.heart_outline,
            color: color,
            size: size,
          );
  }

  @override
  void initState() {
    super.initState();

    _isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isLiked = !_isLiked;

          if (_isLiked) {
            widget.onLiked?.call();
            log("Liked");
          } else {
            widget.onDisliked?.call();
            log("DisLiked");
          }
        });
      },
      icon: widget.isPlaying
          ? _heartIcon(
              color: AppColor.accentColor1,
              size: widget.iconSize,
              isLiked: widget.isLiked,
            )
          : _heartIcon(
              isLiked: widget.isLiked,
              size: widget.iconSize,
            ),
    );
  }
}
