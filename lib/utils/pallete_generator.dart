import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import 'app_image.dart';

/// Generates a [PaletteGenerator] from an image fetched from the provided URL.
///
/// This function attempts to fetch an image from the given [url] and generate
/// a color palette using the [PaletteGenerator.fromImageProvider] method.
/// If the image cannot be fetched or processed (e.g., due to a network error
/// or invalid URL), a fallback palette is generated using a placeholder image
/// defined by [AppImage.newAppLogo].
///
/// ### Parameters:
/// - [url]: The URL of the image from which to generate the palette.
///
/// ### Returns:
/// A [Future<PaletteGenerator>] that resolves to a palette generated from the
/// image. If an error occurs, the palette is generated from the placeholder image.
///
/// ### Example:
/// ```dart
/// final palette = await getPaletteFromImage('https://example.com/image.jpg');
/// final dominantColor = palette.dominantColor?.color;
/// ```
///
/// ### Throws:
/// This function does not throw exceptions directly. Instead, it catches any
/// errors that occur during the image fetching or palette generation process
/// and falls back to the placeholder image.
Future<PaletteGenerator> getPaletteFromImage(String url) async {
  ImageProvider<Object> placeHolder = const AssetImage(AppImage.newAppLogo);

  try {
    return await PaletteGenerator.fromImageProvider(
      CachedNetworkImageProvider(url),
    );
  } catch (e) {
    return await PaletteGenerator.fromImageProvider(placeHolder);
  }
}
