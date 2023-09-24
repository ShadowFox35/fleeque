part of 'settings_bloc.dart';

class SettingsState {
  final bool isLoading;
  final String imageUrl;
  final UserEntity userInfo;
  final Object? error;

  const SettingsState({
    this.isLoading = false,
    this.imageUrl = '',
    this.userInfo = const UserEntity(
      name: 'Enter Your name',
      email: 'Enter Your email',
      number: 'Enter Your number',
      instagram: 'Enter Your instagram',
      bank: 'Enter Your bank details',
      imageUrl: '',
    ),
    this.error,
  });

  SettingsState copyWith({
    bool? isLoading,
    String? imageUrl,
    UserEntity? userInfo,
    Object? error,
  }) {
    return SettingsState(
      isLoading: isLoading ?? this.isLoading,
      imageUrl: imageUrl ?? this.imageUrl,
      userInfo: userInfo ?? this.userInfo,
      error: error ?? this.error,
    );
  }
}
