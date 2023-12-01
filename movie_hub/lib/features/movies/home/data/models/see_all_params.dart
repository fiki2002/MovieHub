import 'package:flutter/material.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class SeeAllParams {
  final List<MovieResultsEntity> movies;
  final String genreTitle;
  final bool Function(Notification)? onNotification;

  SeeAllParams({
    required this.movies,
    required this.genreTitle,
    this.onNotification,
  });

  void handleNotification(Notification notification) {
    if (onNotification != null) {
      onNotification!(notification);
    }
  }
}
