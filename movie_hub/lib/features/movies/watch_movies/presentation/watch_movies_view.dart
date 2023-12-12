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
  late final Future<void> _pageLoader;

  @override
  void initState() {
    _controller = WebViewController();
    _pageLoader = _loadPage();
    super.initState();
  }

  Future<void> _loadPage() async {
    await _controller.setBackgroundColor(kcBackground);
    await _controller.loadRequest(
      Uri.parse(
        '$videoBaseUrl${widget.movieID}',
      ),
    );
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
      body: FutureBuilder(
        future: _pageLoader,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return WebViewWidget(
              controller: _controller,
            );
          } else {
            return const LoadingWidget();
          }
        },
      ),
      usePadding: false,
      useSingleScroll: false,
    );
  }
}
