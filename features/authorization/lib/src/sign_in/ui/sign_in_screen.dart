import 'package:authorization/src/sign_in/bloc/sign_in_bloc.dart';
import 'package:authorization/src/sign_in/ui/sign_in_form.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignInBloc(
        emailSignInUseCase: appLocator<FirebaseSignInUseCase>(),
        googleSignInUseCase: appLocator<GoogleSignInUseCase>(),
        saveUserUseCase: appLocator<SaveUserUseCase>(),
        checkUserUseCase: appLocator<CheckUserUseCase>(),
        appRouter: appLocator<AppRouter>(),
        authService: appLocator<AuthService>(),
      ),
      child: BlocBuilder<SignInBloc, SignInScreenState>(
        builder: (BuildContext context, SignInScreenState state) {
          return SignInForm();
        },
      ),
    );
  }
}
