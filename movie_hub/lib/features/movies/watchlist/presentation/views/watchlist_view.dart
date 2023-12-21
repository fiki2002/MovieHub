import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/watchlist/presentation/notifier/watchlist_movie_details_notifier.dart';
import 'package:movie_hub/features/movies/watchlist/watchlist.dart';
import 'package:movie_hub/features/profile/profile.dart';
import 'package:provider/provider.dart';

class WatchListView extends StatefulWidget {
  const WatchListView({super.key});

  @override
  State<WatchListView> createState() => _WatchListViewState();
}

class _WatchListViewState extends State<WatchListView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<GetWatchListMovieIdsNotifier>().init().then(
          (_) {
            context.watchList.getWatchListMovieDetail();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kcBackground,
        elevation: 0,
        centerTitle: false,
        title: const TextWidget(
          'WatchList',
          fontSize: kGlobalPadding,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Consumer<WatchListDetailsNotifier>(
        builder: (context, val, _) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(
              kfsExtraLarge,
              kfsExtraLarge,
              kfsExtraLarge,
              0,
            ),
            child: switch (val.watchListState) {
              WatchListState.loading => const LoadingWidget(),
              WatchListState.error => CustomErrorWidget(
                  errorMessage: 'Failed to fetch watchlist😓',
                  retryCallBack: () {
                    context.read<GetWatchListMovieIdsNotifier>().init();
                  },
                ),
              WatchListState.isDone => WatchListBodyWidget(
                  movies: val.allWatchList,
                ),
            },
          );
        },
      ),
      usePadding: false,
      useSingleScroll: false,
    );
  }
}
