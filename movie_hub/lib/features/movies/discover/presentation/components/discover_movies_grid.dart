import 'package:flutter/cupertino.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:provider/provider.dart';

class DiscoverMoviesSection extends StatefulWidget {
  const DiscoverMoviesSection({super.key});

  @override
  State<DiscoverMoviesSection> createState() => _DiscoverMoviesSectionState();
}

class _DiscoverMoviesSectionState extends State<DiscoverMoviesSection> {
  bool loadingTimePassed = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          setState(() {
            loadingTimePassed = true;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final discoverMoviesNotifier = context.watch<DiscoverMoviesNotifier>();

    return loadingTimePassed
        ? _buildContent(discoverMoviesNotifier)
        : Column(
          children: [
            vSpace(screenHeight*.2),
            const LoadingWidget(),
          ],
        );
  }

  Widget _buildContent(DiscoverMoviesNotifier discoverMoviesNotifier) {
    if (discoverMoviesNotifier.state.data == null) {
      return PageErrorWidget(
        onTap: () {
          context.discoverMovies.discoverMovies();
        },
      );
    } else {
      return discoverMoviesNotifier.state.when(
        done: (discoveredMovies) {
          return Expanded(
            child: NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollEndNotification &&
                    notification.metrics.extentAfter == 0) {
                  discoverMoviesNotifier.discoverMovies(
                    shouldFetch: true,
                  );
                }
                return true;
              },
              child: MoviesGrid(
                movies: discoveredMovies,
                genreTitle: 'Discover',
              ),
            ),
          );
        },
        error: (e) => Text(e.toString()),
        loading: () => const CupertinoActivityIndicator(),
      );
    }
  }
}
