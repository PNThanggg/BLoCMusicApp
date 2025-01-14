import 'package:flutter/material.dart';

import 'package:icons_plus/icons_plus.dart';

import '../theme/app_color.dart';

class PlayPauseButton extends StatefulWidget {
  final double size;
  final VoidCallback? onPlay;
  final VoidCallback? onPause;
  final bool isPlaying;

  const PlayPauseButton({
    super.key,
    this.size = 60,
    this.onPlay,
    this.onPause,
    this.isPlaying = false,
  });

  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  late bool _isPlaying;
  late Color _currentColor;

  @override
  void initState() {
    super.initState();

    _isPlaying = widget.isPlaying;
    _currentColor = _isPlaying ? AppColor.accentColor1 : AppColor.accentColor2;
  }

  void _togglePlayPause() {
    setState(() {
      _isPlaying ? widget.onPause!() : widget.onPlay!();
      _isPlaying = !_isPlaying;
      _currentColor = _isPlaying ? AppColor.accentColor1 : AppColor.accentColor2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: _currentColor,
                spreadRadius: 1,
                blurRadius: 20,
              ),
            ],
            shape: BoxShape.circle,
            color: _currentColor,
          ),
          width: widget.size,
          height: widget.size,
          child: _isPlaying
              ? Icon(
                  FontAwesome.pause_solid,
                  size: widget.size * 0.5,
                  color: AppColor.primaryColor1,
                )
              : Icon(
                  MingCute.play_fill,
                  size: widget.size * 0.5,
                  color: AppColor.primaryColor1,
                ),
        ),
      ),
    );
  }
}
