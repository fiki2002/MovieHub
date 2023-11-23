import 'package:flutter/cupertino.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  late final WebViewController _controller;

  @override
  void initState() {
    _controller = WebViewController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    _controller.setBackgroundColor(kcBackground);

    _controller.loadRequest(
      Uri.parse(
        '$videoBaseUrl${widget.movieID}',
      ),
    );
    
    return ScaffoldWidget(
      body: WebViewWidget(controller: _controller),
      usePadding: false,
      useSingleScroll: false,
    );
  }
}
