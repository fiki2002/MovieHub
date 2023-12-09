import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';
import 'package:provider/provider.dart';

class AvatarView extends StatefulWidget {
  const AvatarView({super.key});

  static const route = 'avatar_view';

  @override
  State<AvatarView> createState() => _AvatarViewState();
}

class _AvatarViewState extends State<AvatarView> {
  @override
  Widget build(BuildContext context) {
    final avatarNotifier = context.watch<FetchAvatarNotifier>();
    return ScaffoldWidget(
      appBar: AppBar(
        backgroundColor: kcBackground,
        elevation: 0,
        title: const TextWidget(
          'Choose your Avatar🤩',
          fontWeight: FontWeight.w700,
        ),
      ),
      body: avatarNotifier.state.when(
        done: (avatar) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vSpace(kMinute),
              Expanded(
                child: GridView.builder(
                  itemCount: avatar.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: kMinute,
                    crossAxisSpacing: kMinute,
                  ),
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      onTap: () => _pickAvatar(avatar[index]),
                      child: CachedNetworkImageWidget(
                        url: avatar[index],
                        fit: BoxFit.cover,
                        radius: kMinute,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        error: (e) => _ErrorWidget(
          errorMessage: 'Something went wrong\nwe couldn\'t fetch avatars😓',
          retryCallBack: () => context.read<FetchAvatarNotifier>().onInit(),
        ),
        loading: () => const Center(child: CupertinoActivityIndicator()),
      ),
      safeAreaTop: false,
      useSingleScroll: false,
    );
  }

  void _pickAvatar(String imageUrl) {
    context.updateAvatar.updateAvatar(imageUrl);
    context.read<FetchProfileNotifier>().onInit();
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({required this.errorMessage, required this.retryCallBack});
  final String errorMessage;
  final VoidCallback retryCallBack;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        vSpace(kfs90),
        Lottie.asset(loadingFailed),
        TextWidget(
          errorMessage,
          textAlign: TextAlign.center,
          fontSize: kfsLarge,
        ),
        vSpace(kfsExtraLarge),
        Button(text: 'Retry', onTap: retryCallBack)
      ],
    );
  }
}
