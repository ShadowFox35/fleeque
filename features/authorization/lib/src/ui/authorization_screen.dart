import 'package:authorization/src/ui/authorization_google.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.padding_25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Login with your credentials',
                style: AppFonts.title,
                textAlign: TextAlign.center,
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.padding_25,
                    ),
                    child: TextField(
                      cursorColor: AppColors.pink,
                      decoration: InputDecoration(
                        labelText: 'Email'.toUpperCase(),
                        labelStyle: AppFonts.labelText,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimens.padding_25,
                      horizontal: AppDimens.padding_25,
                    ),
                    child: TextField(
                      cursorColor: AppColors.pink,
                      decoration: InputDecoration(
                        labelText: 'Password'.toUpperCase(),
                        labelStyle: AppFonts.labelText,
                      ),
                      // controller: _passwordController,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account ? ',
                        style: AppFonts.authText,
                      ),
                      Text(
                        'Sign Up!',
                        style: AppFonts.authTextRed,
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimens.padding_25,
                    ),
                    child: Text(
                      'Forgot password?',
                      style: AppFonts.authTexGray,
                    ),
                  ),
                ],
              ),
              Column(
                children: const [
                  GoogleAuth(),
                  LoginButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
