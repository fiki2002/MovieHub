import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/discover/presentation/notifier/search_movies_notifier.dart';
import 'package:provider/provider.dart';

class SearchHeaderWidget extends StatefulWidget implements PreferredSizeWidget {
  const SearchHeaderWidget({super.key, required this.title});
  final String title;
  @override
  State<SearchHeaderWidget> createState() => _SearchHeaderWidgetState();

  @override
  Size get preferredSize => Size(screenWidth, screenHeight * .04);
}

class _SearchHeaderWidgetState extends State<SearchHeaderWidget> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isSearchVisible = ValueNotifier(true);
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kcBackground,
      elevation: 0,
      title: ValueListenableBuilder<bool>(
        valueListenable: isSearchVisible,
        builder: (context, val, _) {
          return Consumer<SearchNotifier>(builder: (context, search, _) {
            return Visibility(
              visible: val,
              replacement: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        isSearchVisible.value = !isSearchVisible.value;
                        search.clearSearchValue(_controller);
                      },
                      child: arrowLeftIcon.svg,
                    ),
                    Expanded(
                      child: TextField(
                        cursorColor: kcWhiteColor,
                        controller: _controller,
                        autofocus: true,
                        onChanged: (v) {
                          Provider.of<SearchNotifier>(context, listen: false)
                              .updateSearchValue(v);
                        },
                        style: const TextStyle(
                          color: kcWhiteColor,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              isSearchVisible.value = !isSearchVisible.value;
                              search.clearSearchValue(_controller);
                            },
                            icon: const Icon(
                              Icons.clear_rounded,
                              color: kcWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    widget.title,
                    fontSize: kGlobalPadding,
                    fontWeight: FontWeight.w600,
                  ),
                  GestureDetector(
                    onTap: () {
                      isSearchVisible.value = !isSearchVisible.value;
                    },
                    child: searchIcon.svg,
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
