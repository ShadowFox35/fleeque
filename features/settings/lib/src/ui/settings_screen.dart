import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/bloc/settings_bloc.dart';
import 'package:settings/src/ui/settings_form.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SettingsBloc(
        appRouter: appLocator<AppRouter>(),
        authService: appLocator<AuthService>(),
        checkUserUseCase: appLocator<CheckUserUseCase>(),
        signOutUseCase: appLocator<SignOutUseCase>(),
        getUserUseCase: appLocator<GetUserUseCase>(),
        updateUserInfoUseCase: appLocator.get<UpdateUserInfoUseCase>(),
        observeUserInfoUseCase: appLocator.get<ObserveUserUseCase>(),
        saveUserInfoUseCase: appLocator<SaveUserInfoUseCase>(),
        pickUserImageUseCase: appLocator<PickUserImageUseCase>(),
      ),
      child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (BuildContext context, SettingsState state) {
        return Center(
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.black,
              centerTitle: true,
              actions: const <Widget>[
                ProfileAppBar(
                  title: AppConstants.profileListSettings,
                ),
              ],
            ),
            body: SettingsForm(),
          ),
        );
      }),
    );
  }
}
