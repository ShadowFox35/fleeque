part of 'settings_bloc.dart';

class SettingsState {
  final UserEntity userInfo;
  final Object? error;

  const SettingsState({
    this.userInfo = const UserEntity(
      name: 'Enter Your name',
      email: 'Enter Your email',
      number: 'Enter Your number',
      instagram: 'Enter Your instagram',
      bank: 'Enter Your bank details',
    ),
    this.error,
  });

  SettingsState copyWith({
    UserEntity? userInfo,
    Object? error,
  }) {
    return SettingsState(
      userInfo: userInfo ?? this.userInfo,
      error: error ?? this.error,
    );
  }
}
