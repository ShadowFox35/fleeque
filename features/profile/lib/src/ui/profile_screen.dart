import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:profile/src/bloc/profile_bloc.dart';
import 'package:profile/src/ui/profile_form.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProfileBloc(
        appRouter: appLocator<AppRouter>(),
        authService: appLocator<AuthService>(),
      ),
      child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (BuildContext context, ProfileState state) {
        return Center(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.black,
              automaticallyImplyLeading: false,
              actions: const <Widget>[
                ProfileAppBar(),
              ],
            ),
            body: const ProfileForm(),
          ),
        );
      }),
    );
  }
}
