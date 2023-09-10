import 'package:authorization/src/authorization_google.dart';
import 'package:authorization/src/sign_in/bloc/sign_in_bloc.dart';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignInBloc, SignInScreenState>(builder: (
        BuildContext context,
        SignInScreenState state,
      ) {
        return SafeArea(
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
                    InputField(
                      labelText: 'Email',
                      controller: _emailController,
                    ),
                    InputField(
                      labelText: 'Password',
                      controller: _passwordController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account ? ',
                          style: AppFonts.authText,
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<SignInBloc>(context).add(
                              NavigateToSingUpEvent(),
                            );
                          },
                          child: Text(
                            'Sign Up!',
                            style: AppFonts.authTextRed,
                          ),
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
                  children: [
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<SignInBloc>(context).add(
                          GoogleSignInEvent(),
                        );
                      },
                      child: const GoogleAuth(),
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<SignInBloc>(context).add(
                          EmailSignInEvent(
                            model: AuthorizationModel(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          ),
                        );
                      },
                      child: const LoginButton(
                        buttonText: AppConstants.login,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
