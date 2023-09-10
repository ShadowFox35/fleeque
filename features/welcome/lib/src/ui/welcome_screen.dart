import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:welcome/src/bloc/welcome_bloc.dart';

import './welcome_form.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WelcomeBloc(
        appRouter: appLocator<AppRouter>(),
        authService: appLocator<AuthService>(),
      ),
      child: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (BuildContext context, WelcomeState state) {
          return const WelcomeForm();
        },
      ),
    );
  }
}
