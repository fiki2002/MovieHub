import 'package:flutter/material.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class NavBarNotifier extends ChangeNotifier {

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<Widget> _screens = [
    const HomeView(),
    const SearchView(),
    Container(color: Colors.blue),
    Container(color: Colors.green),
  ];
  List<Widget> get screens => _screens;

  void onNavBarTapped(int index) {
    _currentIndex = index;
    notifyListeners();
  }
  
}
