import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  static const route = 'profile_view';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FetchProfileNotifier>().onInit();
    });
  }

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
                    false => _Image(
                        details.avatarUrl!,
                      ),
                  },
                ),
              ),
              vSpace(screenHeight * .03),
              ActionListTile(
                title: 'Choose Avatar',
                icon: addAvatarIcon,
                onTap: _navigateToAvatarScreen,
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
        error: (e) => Text(e ?? ''),
        loading: () => Column(
          children: [
            vSpace(screenHeight * .3),
            LoadingWidget(
              radius: sr(15),
            ),
          ],
        ),
      ),
      safeAreaTop: false,
      useSingleScroll: true,
    );
  }

  Future<void> _navigateToAvatarScreen() async {
    goTo(AvatarView.route);
  }
}

class _Image extends StatelessWidget {
  const _Image(this.image);
  final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: CachedNetworkImageWidget(
        url: image,
        radius: 110,
        fit: BoxFit.fill,
      ),
    );
  }
}
