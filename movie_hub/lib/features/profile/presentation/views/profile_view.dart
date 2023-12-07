import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const route = 'profile_view';
  @override
  Widget build(BuildContext context) {
    final profileDetailsNotifier = context.watch<FetchProfileNotifier>();

    return ScaffoldWidget(
      body: profileDetailsNotifier.state.when(
        done: (details) => Padding(
          padding: EdgeInsets.only(top: h(kfsExtraLarge)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichTextWidget(
                'Hello ',
                '${details.userName ?? ''} 👋,',
                fontSize: kfsLarge,
                fontSize2: kfsLarge,
                fontWeight: FontWeight.w500,
                fontWeight2: FontWeight.w700,
              ),
              vSpace(kfs30),
              Center(
                child: CircleAvatar(
                  radius: sr(kfs90),
                  backgroundColor: kcPrimaryColor.withOpacity(.8),
                  child: switch (details.avatarUrl?.isEmpty ?? true) {
                    true => ImageWidget(
                        imageTypes: ImageTypes.asset,
                        imageUrl: profileImg,
                        height: h(kfs90),
                      ),
                    false => ImageWidget(
                        imageTypes: ImageTypes.network,
                        imageUrl: details.avatarUrl,
                      ),
                  },
                ),
              ),
              vSpace(screenHeight * .03),
              ActionListTile(
                title: 'Choose Avatar',
                icon: addAvatarIcon,
                onTap: () {},
              ),
              vSpace(kfsMedium),
              ActionListTile(
                title: 'Sign Out',
                icon: signOutIcon,
                onTap: () => context.auth.logOut(),
              ),
            ],
          ),
        ),
        error: (_) => const Text(''),
        loading: () => const CupertinoActivityIndicator(),
      ),
      safeAreaTop: false,
      useSingleScroll: true,
    );
  }
}
