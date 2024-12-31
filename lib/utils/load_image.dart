import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../presentation/theme/app_color.dart';
import 'app_image.dart';

Image loadImage(
  coverImageUrl, {
  placeholderPath = AppImage.newAppLogo,
}) {
  ImageProvider<Object> placeHolder = AssetImage(placeholderPath);
  return Image.network(
    coverImageUrl,
    fit: BoxFit.cover,
    loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) {
        return child;
      } else {
        return Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxHeight > constraints.maxWidth) {
                return SizedBox(
                  height: constraints.maxWidth,
                  width: constraints.maxWidth,
                  child: const CircularProgressIndicator(
                    color: AppColor.accentColor2,
                  ),
                );
              } else {
                return SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxHeight,
                  child: const CircularProgressIndicator(
                    color: AppColor.accentColor2,
                  ),
                );
              }
            },
          ),
        );
      }
    },
    errorBuilder: (context, error, stackTrace) {
      return Image(
        image: placeHolder,
        fit: BoxFit.cover,
      );
    },
  );
}

CachedNetworkImage loadImageCached(
  coverImageURL, {
  placeholderPath = AppImage.newAppLogo,
  fit = BoxFit.cover,
}) {
  ImageProvider<Object> placeHolder = AssetImage(placeholderPath);

  return CachedNetworkImage(
    imageUrl: coverImageURL,
    memCacheWidth: 500,
    placeholder: (context, url) => Image(
      image: const AssetImage(AppImage.lazyLoading),
      fit: fit,
    ),
    errorWidget: (context, url, error) => Image(
      image: placeHolder,
      fit: fit,
    ),
    fadeInDuration: const Duration(milliseconds: 700),
    fit: fit,
  );
}

Future<ImageProvider> getImageProvider(
  String imageUrl, {
  String placeholderUrl = AppImage.newAppLogo,
}) async {
  if (imageUrl != "") {
    final response = await http.head(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      CachedNetworkImageProvider cachedImageProvider = CachedNetworkImageProvider(imageUrl);
      return cachedImageProvider;
    } else {
      return AssetImage(placeholderUrl);
    }
  }

  return AssetImage(placeholderUrl);
}
