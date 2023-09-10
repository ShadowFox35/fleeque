import 'package:authorization/src/sign_up/bloc/sign_up_bloc.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (BuildContext context, SignUpState state) {
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
                  'Create an account',
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
                        controller: _emailController,
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
                        controller: _passwordController,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account ? ',
                          style: AppFonts.authText,
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<SignUpBloc>(context).add(
                              NavigateToSingInEvent(),
                            );
                          },
                          child: Text(
                            'Sign In!',
                            style: AppFonts.authTextRed,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<SignUpBloc>(context).add(
                          SignUpEvent(
                            data: AuthorizationModel(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          ),
                        );
                      },
                      child: const LoginButton(
                        buttonText: AppConstants.signUp,
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
