import 'dart:io';

import 'package:app/constants/theme.dart';
import 'package:app/modules/home/home_page.dart';
import 'package:app/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/route_manager.dart';
import 'package:get_it/get_it.dart';

/// [LoginScreen] is a [StatelessWidget] that displays the login screen.
class LoginScreen extends StatelessWidget {
  /// [LoginScreen] constructor.
  LoginScreen({super.key});

  /// The name of the route.
  static const String routeName = '/login';
  final AuthRepository _authRepository = GetIt.I<AuthRepository>();
  static final RegExp _emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  /// [loginTime] is the duration of the login process.
  Duration get loginTime => const Duration(milliseconds: 1250);

  /// [route] returns a [MaterialPageRoute] that displays the [LoginScreen].
  static MaterialPageRoute<void> route() => MaterialPageRoute<void>(builder: (_) => LoginScreen());

  /// [emailValidatorRegister] validates the email during the registration process.
  String? emailValidatorRegister({required String value}) => (value.isEmpty)
      ? 'enter an email address'
      : !_emailRegExp.hasMatch(value)
          ? 'enter a valid email address'
          : null;

  /// [emailValidator] validates the email during the login process.
  String? emailValidator({required String value}) => (value.isEmpty) ? 'email empty' : null;

  /// [passwordValidator] validates the password.
  String? passwordValidator({required String value}) => value.isEmpty
      ? 'enter your password'
      : value.length < 6
          ? 'password too short'
          : null;

  Future<String?> _authUser(LoginData data) async {
    try {
      await _authRepository.login(username: data.name, password: data.password);
      return null;
    } catch (e) {
      return 'email/password invalid';
    }
  }

  Future<String?> _registerUser({required SignupData data}) async {
    if (data.name != null && emailValidatorRegister(value: data.name ?? '') != null) return emailValidatorRegister(value: data.name ?? '');
    try {
      await _authRepository.register(username: data.name ?? '', password: data.password ?? '', email: data.name ?? '');
      // sleep(const Duration(seconds: 2));
      return null;
    } catch (e) {
      return 'An error occured';
    }
  }

  Future<String?> _recoverPassword(String email) => AuthRepository.recoverPassword(login: email).then((void value) => null).catchError((dynamic e) => null);

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          FlutterLogin(
            onLogin: _authUser,
            onRecoverPassword: _recoverPassword,
            navigateBackAfterRecovery: true,
            disableCustomPageTransformer: true,
            onSignup: (SignupData signupData) async => _registerUser(data: signupData),
            onSubmitAnimationCompleted: () async => Get.offAll(() => const HomePage()),
            userValidator: (String? value) => emailValidator(value: value ?? ''),
            passwordValidator: (String? value) => passwordValidator(value: value ?? ''),
            theme: loginTheme,
            footer: 'Epitech project',
            messages: LoginMessages(
              userHint: 'email',
              passwordHint: 'password',
              confirmPasswordHint: 'confirm password',
              forgotPasswordButton: 'Forgot your password?',
              loginButton: 'Login',
              signupButton: 'Signup',
              recoverPasswordButton: 'Confirm',
              recoverPasswordIntro: 'Resetting your password',
              recoverPasswordDescription: 'We will send you an email to reset your password',
              goBackButton: 'Back',
              confirmPasswordError: 'The passwords do not match',
              recoverPasswordSuccess: 'Go to your email!',
            ),
          ),
          Positioned(
            top: 60,
            left: 15,
            child: FloatingActionButton(
              mini: true,
              elevation: 0,
              backgroundColor: const Color.fromRGBO(33, 150, 243, 0.3),
              child: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      );
}
