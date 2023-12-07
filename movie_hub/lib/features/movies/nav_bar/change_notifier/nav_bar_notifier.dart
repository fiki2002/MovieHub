import 'package:flutter/material.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:movie_hub/features/profile/profile.dart';

class NavBarNotifier extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<Widget> _screens = [
    const HomeView(),
    const SearchView(),
    Container(color: Colors.blue),
    const ProfileView(),
  ];
  List<Widget> get screens => _screens;

  void onNavBarTapped(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
