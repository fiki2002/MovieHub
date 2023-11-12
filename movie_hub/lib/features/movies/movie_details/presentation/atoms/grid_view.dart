import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key, required this.list});
  final List<BackdropEntity> list;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 1,
      child: GridView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, int index) {
          return MovieCardTile(
            imageUrl: list[index].filePath ?? '',
            onTap: () => goTo(
              ImagePreview.route,
              arguments: list[index].filePath,
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: kMinute,
          crossAxisSpacing: kMinute,
        ),
      ),
    );
  }
}
