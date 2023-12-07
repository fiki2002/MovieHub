import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static const route = 'sign_up';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  late final FocusNode _userNameNode;
  late final FocusNode _emailNode;
  late final FocusNode _passwordNode;
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      usePadding: true,
      body: Consumer<AuthNotifier>(
        builder: (context, signUpNotifier, _) {
          return Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  'Lights, Camera, Sign Up!',
                  fontSize: sp(kfsExtraLarge),
                  fontWeight: FontWeight.w600,
                ),
                vSpace(kfsVeryTiny),
                TextWidget(
                  'Your Movie Journey Begins Here.',
                  fontSize: sp(kfsTiny),
                  fontWeight: FontWeight.w300,
                ),
                vSpace(kGlobalPadding),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  title: 'User Name',
                  hintText: 'John Doe',
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (_) => _emailNode.requestFocus(),
                  prefixIcon: personIcon.svg,
                  focusNode: _userNameNode,
                  onChanged: (value) =>
                      context.auth.updateAuthData(userName, value),
                  validator: (value) =>
                      value?.validateAnyField(field: 'User name'),
                ),
                vSpace(kGlobalPadding),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  title: 'Email',
                  hintText: 'johndoe@gmail.com',
                  onFieldSubmitted: (_) => _passwordNode.requestFocus(),
                  focusNode: _emailNode,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) =>
                      context.auth.updateAuthData(email, value),
                  prefixIcon: mailIcon.svg,
                  validator: (value) => value?.validateEmail(),
                ),
                vSpace(kGlobalPadding),
                CustomTextField(
                  textInputAction: TextInputAction.done,
                  title: 'Password',
                  hintText: '..........',
                  onFieldSubmitted: (_) => _submit(),
                  focusNode: _passwordNode,
                  isPassword: true,
                  onChanged: (value) =>
                      context.auth.updateAuthData(password, value),
                  validator: (value) => value?.validatePassword(value),
                  prefixIcon: lockIcon.svg,
                ),
                vSpace(kfs70),
                switch (signUpNotifier.authState) {
                  AuthState.isLoading => const Button.loading(),
                  _ => Button(
                      text: 'Let\'s Go!',
                      circular: true,
                      onTap: _submit,
                    ),
                },
                vSpace(kfsSuperLarge),
                Center(
                  child: RichTextWidget(
                    'Already have an account?  ',
                    'Sign in',
                    onTap: TapGestureRecognizer()
                      ..onTap = () => goTo(SignInView.route),
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          );
        },
      ),
      useSingleScroll: true,
    );
  }

  void _submit() {
    if (_key.currentState?.validate() ?? false) {
      _key.currentState?.save();
      context.auth.signUp();
    }
  }

  @override
  void initState() {
    _userNameNode = FocusNode();
    _emailNode = FocusNode();
    _passwordNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _userNameNode.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }
}
