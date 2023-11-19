import 'package:flutter/cupertino.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WatchMoviesView extends StatefulWidget {
  static const String route = '/watch-movies';
  final String movieID;
  const WatchMoviesView({super.key, required this.movieID});

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
    return ScaffoldWidget(
      body: ChangeNotifierProvider(
        create: (context) {
          final s = getIt<WatchMoviesUsecase>();

          return WatchMovieNotifier(
            watchMoviesUsecase: s,
            movieId: widget.movieID,
          );
        },
        child: Consumer<WatchMovieNotifier>(
          builder: (context, watchMoviesNotifier, _) {
            return watchMoviesNotifier.state.when(
              done: (movies) {
                _controller.setBackgroundColor(kcBackground);

                _controller.loadHtmlString(movies);
                _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
                return WebViewWidget(controller: _controller);
              },
              error: (e) => Text(e ?? ''),
              loading: () => const Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          },
        ),
      ),
      usePadding: false,
      useSingleScroll: false,
    );
  }
}
