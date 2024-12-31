import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/app_image.dart';

class LoadImageCached extends StatelessWidget {
  final String imageUrl;
  final String? fallbackUrl;
  final String placeholderUrl;
  final BoxFit fit;

  const LoadImageCached({
    super.key,
    required this.imageUrl,
    this.placeholderUrl = AppImage.newAppLogo,
    this.fit = BoxFit.cover,
    this.fallbackUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Image(
        image: const AssetImage(AppImage.lazyLoading),
        fit: fit,
      ),
      errorWidget: (context, url, error) => fallbackUrl == null
          ? Image(
              image: AssetImage(placeholderUrl),
              fit: fit,
            )
          : CachedNetworkImage(
              // now using fallback url
              imageUrl: fallbackUrl!,
              memCacheWidth: 500,
              placeholder: (context, url) => Image(
                image: const AssetImage(AppImage.lazyLoading),
                fit: fit,
              ),
              errorWidget: (context, url, error) => Image(
                image: AssetImage(placeholderUrl),
                fit: fit,
              ),
              fadeInDuration: const Duration(milliseconds: 300),
              fit: fit,
            ),
      fadeInDuration: const Duration(milliseconds: 300),
      fit: fit,
    );
  }
}
