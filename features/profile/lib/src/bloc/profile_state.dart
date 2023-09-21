part of 'profile_bloc.dart';

class ProfileState {
  final bool isLoading;
  final UserEntity userInfo;
  final Object? error;

  const ProfileState({
    this.isLoading = true,
    this.userInfo = const UserEntity(
      name: 'Enter Your name',
      email: 'Enter Your email',
      number: 'Enter Your number',
      instagram: 'Enter Your instagram',
      bank: 'Enter Your bank details',
    ),
    this.error,
  });

  ProfileState copyWith({
    UserEntity? userInfo,
    bool? isLoading,
    Object? error,
  }) {
    return ProfileState(
      userInfo: userInfo ?? this.userInfo,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
