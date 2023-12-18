import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class SearchNotifier extends ChangeNotifier {
  final SearchMoviesUsecase searchMovieUsecase;
  SearchNotifier({
    required this.searchMovieUsecase,
  });

  int _page = 1;
  bool _isSearching = false;
  bool get isSearching => _isSearching;

  String? _searchedValue;
  String? get searchedValue => _searchedValue;

  final List<MovieResultsEntity> _movies = [];
  List<MovieResultsEntity> get searchedMovies => _movies;

  Timer? _debounce;

  void updateSearchValue(String value) {
    _searchedValue = value;

    _movies.clear();
    _page = 1;
    notifyListeners();

    searchMovies();
  }

  Future<void> searchMovies({bool shouldFetch = false}) async {
    _setSearchState(SearchState.isLoading);
    if (shouldFetch) {
      _page++;
      notifyListeners();
    }
    final searchParams =
        SearchParamsModel(query: _searchedValue ?? '', page: _page);
    if (_searchedValue?.isEmpty ?? true) {
      _isSearching = false;
      notifyListeners();
      _debounce?.cancel();
    } else {
      _isSearching = true;
      notifyListeners();
      if (_debounce?.isActive ?? false) _debounce?.cancel();

      _debounce = Timer(
        const Duration(milliseconds: 200),
        () async {
          final searchMoviesResponse =
              await searchMovieUsecase.call(searchParams);
          searchMoviesResponse.fold(
            (l) {
              _setSearchState(SearchState.isError);
            },
            (searchedMoviesRes) {
              final searchedMovies = searchedMoviesRes.results ?? [];
              notifyListeners();

              _setSearchState(SearchState.isDone);
              notifyListeners();
              _movies.addAll(searchedMovies);
            },
          );
        },
      );
    }
  }

  void clearSearchValue(TextEditingController controller) {
    controller.clear();
    _searchedValue = '';
    _isSearching = false;
    _movies.clear();
    _page = 1;
    notifyListeners();
  }

  SearchState _searchState = SearchState.isDone;
  SearchState get searchState => _searchState;

  void _setSearchState(SearchState state) {
    _searchState = state;
    notifyListeners();
  }
}

enum SearchState { isLoading, isError, isDone }
