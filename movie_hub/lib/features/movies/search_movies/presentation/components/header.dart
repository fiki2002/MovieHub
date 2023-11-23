import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';

class SearchHeaderWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const SearchHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kcBackground,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextWidget(
            'Discover',
            fontSize: kGlobalPadding,
            fontWeight: FontWeight.w600,
          ),
          searchIcon.svg,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(screenWidth, screenHeight * .04);
}
