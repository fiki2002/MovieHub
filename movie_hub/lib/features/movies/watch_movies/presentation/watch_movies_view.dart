import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:movie_hub/cores/cores.dart';

class WatchMoviesView extends StatefulWidget {
  static const String route = '/watch-movies';
  final String movieID;
  const WatchMoviesView({
    super.key,
    required this.movieID,
  });

  @override
  State<WatchMoviesView> createState() => _WatchMoviesViewState();
}

class _WatchMoviesViewState extends State<WatchMoviesView> {
  late InAppWebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
            '$videoBaseUrl${widget.movieID}',
          ),
        ),
        onWebViewCreated: (InAppWebViewController inAppWebViewController) {
          controller = inAppWebViewController;
          controller.getOriginalUrl();
        },
      ),
    );
  }
}
