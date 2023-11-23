import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SearchHeaderWidget(),
      body: Padding(
        padding: EdgeInsets.all(kfsExtraLarge),
        child: Column(
          children: [
            DiscoverMoviesSection(),
          ],
        ),
      ),
    );
  }
}
