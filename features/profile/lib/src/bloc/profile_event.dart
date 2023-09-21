part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class InitialEvent extends ProfileEvent {}

class ObserveEvent extends ProfileEvent {
  final UserEntity userInfo;
  ObserveEvent({required this.userInfo});
}

class SignOutEvent extends ProfileEvent {}

class NavigateEvent extends ProfileEvent {
  final String path;

  NavigateEvent({required this.path});
}
