import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';
import 'package:provider/provider.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});
  static const route = 'forgot-password';

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  late final FocusNode _emailNode;
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      useSingleScroll: true,
      body:
          Consumer<AuthNotifier>(builder: (context, forgotPasswordNotifier, _) {
        return Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                'Oops! Need a New Password?',
                fontSize: kfsExtraLarge,
                fontWeight: FontWeight.w600,
              ),
              vSpace(kfsVeryTiny),
              TextWidget(
                'Let\'s Get You Back On Track.',
                fontSize: sp(kfsTiny),
                fontWeight: FontWeight.w300,
              ),
              vSpace(kGlobalPadding),
              CustomTextField(
                title: 'Email',
                hintText: 'Input your email',
                onChanged: (value) => context.auth.updateAuthData(email, value),
                keyboardType: TextInputType.emailAddress,
                prefixIcon: mailIcon.svg,
                validator: (value) => value?.validateEmail(),
                textInputAction: TextInputAction.done,
                focusNode: _emailNode,
              ),
              vSpace(kXtremeLarge),
              switch (forgotPasswordNotifier.authState) {
                AuthState.isLoading => const Button.loading(),
                _ => Button(
                    circular: true,
                    text: 'Continue',
                    onTap: _submit,
                  ),
              },
              vSpace(kfsSuperLarge),
              Center(
                child: RichTextWidget(
                  'Don\'t have an account?  ',
                  'Sign up',
                  onTap: TapGestureRecognizer()
                    ..onTap = () => goTo(SignUpView.route),
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  void _submit() {
    if (_key.currentState?.validate() ?? false) {
      _key.currentState?.save();
      context.auth.forgotPassword();
    }
  }

  @override
  void initState() {
    super.initState();
    _emailNode = FocusNode();
  }

  @override
  void dispose() {
    _emailNode.dispose();
    super.dispose();
  }
}
