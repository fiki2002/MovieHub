import 'package:flutter/widgets.dart';
import 'package:movie_hub/cores/cores.dart';

class ActionListTile extends StatelessWidget {
  const ActionListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final String icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(kfsExtraLarge),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kfsTiny),
          color: kcWhiteColor.withOpacity(.1),
        ),
        child: Row(
          children: [
            ImageWidget(
              imageTypes: ImageTypes.svg,
              imageUrl: icon,
              color: kcWhiteColor,
              useIconColor: true,
            ),
            hSpace(kMinute),
            TextWidget(title),
          ],
        ),
      ),
    );
  }
}
