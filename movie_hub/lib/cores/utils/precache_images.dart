import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';

class PreCacheImage {
  static final BuildContext context = navigatorKey.currentContext!;

  static Future<void> loadImages({
    required String backDrop,
    String? posterPath,
  }) async {
    try {
      if (backDrop.isEmpty || (posterPath == null || posterPath.isEmpty)) {
        return;
      }

      await Future.wait([
        _precache(backDrop),
        _precache(posterPath),
      ]);
    } catch (e) {
      e.log();
      'Failed to cache image!!'.log();
    }
  }

  static Future<void> _precache(String path) async {
    await precacheImage(
      CachedNetworkImageProvider('$baseNetworkImage$path'),
      context,
    );
  }
}
