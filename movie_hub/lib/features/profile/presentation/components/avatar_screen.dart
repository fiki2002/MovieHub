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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.fetchAvatar.fetchAvatar();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: AppBar(
        backgroundColor: kcBackground,
        elevation: 0,
        title: const TextWidget(
          'Choose your Avatar🤩',
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Consumer<FetchAvatarNotifier>(
        builder: (_, viewModel, __) {
          return switch (viewModel.avatarState) {
            FetchAvatarState.isDone => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vSpace(kMinute),
                  Expanded(
                    child: GridView.builder(
                      itemCount: viewModel.listOfAvatar?.length ?? 0,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: kMinute,
                        crossAxisSpacing: kMinute,
                      ),
                      itemBuilder: (context, int index) {
                        final String? avatar = viewModel.listOfAvatar?[index];
                        return GestureDetector(
                          onTap: () => _pickAvatar(avatar ?? ''),
                          child: CachedNetworkImageWidget(
                            url: avatar ?? '',
                            fit: BoxFit.cover,
                            radius: kMinute,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            FetchAvatarState.isError => CustomErrorWidget(
                errorMessage:
                    'Something went wrong\nwe couldn\'t fetch avatars😓',
                retryCallBack: () =>
                    context.read<FetchAvatarNotifier>().fetchAvatar(),
              ),
            FetchAvatarState.isLoading => const LoadingWidget()
          };
        },
      ),
      safeAreaTop: false,
      useSingleScroll: false,
    );
  }

  void _pickAvatar(String imageUrl) {
    context.updateAvatar.updateAvatar(imageUrl);
    context.read<FetchProfileNotifier>().fetchProfileDetails();
  }
}

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errorMessage,
    required this.retryCallBack,
  });
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
