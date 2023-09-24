part of 'profile_bloc.dart';

class ProfileState {
  final String? imageUrl;
  final bool isLoading;
  final UserEntity userInfo;
  final Object? error;

  const ProfileState({
    this.imageUrl,
    this.isLoading = true,
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

  ProfileState copyWith({
    String? imageUrl,
    UserEntity? userInfo,
    bool? isLoading,
    Object? error,
  }) {
    return ProfileState(
      imageUrl: imageUrl ?? this.imageUrl,
      userInfo: userInfo ?? this.userInfo,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
