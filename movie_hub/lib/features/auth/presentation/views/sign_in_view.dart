import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';
import 'package:provider/provider.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});
  static const route = 'sign_in';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  late final FocusNode _emailNode;
  late final FocusNode _passwordNode;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      usePadding: true,
      body: Consumer<AuthNotifier>(
        builder: (context, sigInNotifier, _) {
          return Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  'Lights, Camera, Sign In!',
                  fontSize: sp(kfsExtraLarge),
                  fontWeight: FontWeight.w600,
                ),
                vSpace(kfsVeryTiny),
                TextWidget(
                  'Your Movie Journey Continues.',
                  fontSize: sp(kfsTiny),
                  fontWeight: FontWeight.w300,
                ),
                vSpace(kGlobalPadding),
              
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  title: 'Email',
                  hintText: 'johndoe@gmail.com',
                  focusNode: _emailNode,
                  onChanged: (value) =>
                      context.auth.updateAuthData(email, value),
                  onFieldSubmitted: (_) => _passwordNode.requestFocus(),
                  validator: (value) => value?.validateEmail(),
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: mailIcon.svg,
                ),
                vSpace(kGlobalPadding),
                CustomTextField(
                  textInputAction: TextInputAction.done,
                  title: 'Password',
                  focusNode: _passwordNode,
                  onChanged: (value) =>
                      context.auth.updateAuthData(password, value),
                  hintText: '..........',
                  onFieldSubmitted: (_) => _submit(),
                  validator: (value) => value?.validatePassword(value),
                  isPassword: true,
                  prefixIcon: lockIcon.svg,
                ),
                vSpace(kMinute),
                Align(
                  alignment: Alignment.topRight,
                  child: TextWidget(
                    'Forgot your Password?',
                    fontSize: sp(kfsVeryTiny),
                    onTap: () => goTo(ForgotPasswordView.route),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                vSpace(kfs70),
                switch (sigInNotifier.authState) {
                  AuthState.isLoading => const Button.loading(),
                  _ => Button(
                      text: 'Let\'s Continue!',
                      circular: true,
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
                ),
              ],
            ),
          );
        },
      ),
      useSingleScroll: true,
    );
  }

  @override
  void initState() {
    _emailNode = FocusNode();
    _passwordNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  void _submit() {
    if (_key.currentState?.validate() ?? false) {
      _key.currentState?.save();
      context.auth.signIn();
    }
  }
}
