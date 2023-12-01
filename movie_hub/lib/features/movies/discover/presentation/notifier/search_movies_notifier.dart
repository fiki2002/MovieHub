import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class SearchNotifier extends BaseNotifier<List<MovieResultsEntity>> {
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

  Timer? _debounce;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void updateSearchValue(String value) {
    _searchedValue = value;

    _movies.clear();
    _page = 1;
    notifyListeners();

    searchMovies();
  }

  Future<void> searchMovies({bool shouldFetch = false}) async {
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

          _isLoading = true;
          notifyListeners();

          final NotifierState<MoviesModel> searchMoviesResponse =
              await searchMovieUsecase.execute(searchParams);
          
          final searchedMovies = searchMoviesResponse.data?.results ?? [];
          notifyListeners();

          _isLoading = false;
          notifyListeners();
          _movies.addAll(searchedMovies);

          setData(_movies);
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
}
