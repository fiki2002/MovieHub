import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchHeaderWidget(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          kfsExtraLarge,
          kfsExtraLarge,
          kfsExtraLarge,
          0,
        ),
        child: Consumer<SearchNotifier>(
          builder: (context, search, _) {
            return Column(
              children: [
                search.isSearching
                    ? const SearchMoviesGrid()
                    : const DiscoverMoviesSection(),
              ],
            );
          },
        ),
      ),
    );
  }
}
