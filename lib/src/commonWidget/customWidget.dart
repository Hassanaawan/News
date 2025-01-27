import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Custom text widget with additional parameters
Widget customText(
  String msg, {
  TextStyle? style,
  TextAlign textAlign = TextAlign.justify,
  TextOverflow overflow = TextOverflow.clip,
  required BuildContext context,
}) {
  if (msg.isEmpty) {
    return const SizedBox.shrink(); // Return an empty widget for empty text
  }

  // Adjust font size for smaller screens if a style is provided
  if (style != null) {
    double fontSize = style.fontSize ?? 
        Theme.of(context).textTheme.bodyMedium?.fontSize ?? 14.0;
    style = style.copyWith(
      fontSize: fontSize - (fullWidth(context) <= 375 ? 2 : 0),
    );
  }

  return Text(
    msg,
    style: style,
    textAlign: textAlign,
    overflow: overflow,
  );
}

/// Get the full width of the screen
double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// Get the full height of the screen
double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

/// Adjust dimensions based on screen width for better responsiveness
double getDimension(BuildContext context, double unit) {
  return fullWidth(context) <= 360.0 ? unit / 1.3 : unit;
}

/// Custom image widget with caching and error handling
Widget customImage(String path, {BoxFit fit = BoxFit.contain}) {
  return CachedNetworkImage(
    imageUrl: path,
    fit: fit,
    placeholder: (context, url) => Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).colorScheme.primary,
        ),
      ),
    ),
    errorWidget: (context, url, error) => const Icon(
      Icons.broken_image,
      size: 50,
      color: Colors.grey,
    ),
  );
}

/// Cached network image provider for internal image handling
dynamic customAdvanceNetworkImage(String path) {
  return CachedNetworkImageProvider(path);
}

/// Get the adjusted font size based on the text scale factor
double getFontSize(BuildContext context, double size) {
  double textScaleFactor = MediaQuery.of(context).textScaleFactor;
  return textScaleFactor < 1
      ? getDimension(context, size)
      : getDimension(context, size / textScaleFactor);
}

/// Get the image path for specific types with a default fallback
String getTypeImage(String type) {
  switch (type) {
    case 'Fighting':
      return 'assets/images/types/Fight.png';
    default:
      return 'assets/images/types/$type.png';
  }
}
