import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/app/app.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:provider/provider.dart';

class NavBarView extends StatefulWidget {
  static const String route = '/nav_bar';

  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  @override
  Widget build(BuildContext context) {
    SetUpLocators.getIt<NavBarNotifier>();
    return Consumer<NavBarNotifier>(
      builder: (context, navBar, _) {
        return Scaffold(
          body: IndexedStack(
            index: navBar.currentIndex,
            children: navBar.screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: kcBackground,
            currentIndex: navBar.currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: kcWhiteColor,
            unselectedItemColor: kcWhiteColor.withOpacity(0.3),
            onTap: navBar.onNavBarTapped,
            items: _pages,
          ),
        );
      },
    );
  }

  late final List<BottomNavigationBarItem> _pages = [
    _bottomNavItem(icon: CupertinoIcons.home),
    _bottomNavItem(icon: CupertinoIcons.search),
    _bottomNavItem(icon: Icons.subject),
    _bottomNavItem(icon: CupertinoIcons.person),
  ];

  BottomNavigationBarItem _bottomNavItem({required IconData icon}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: '',
    );
  }
}
