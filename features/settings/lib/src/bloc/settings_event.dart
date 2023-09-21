part of 'settings_bloc.dart';

abstract class SettingsEvent {}

class InitialEvent extends SettingsEvent {}

class AddInfoEvent extends SettingsEvent {
  final UserEntity userInfo;
  AddInfoEvent({required this.userInfo});
}

class ObserveEvent extends SettingsEvent {
  final UserEntity userInfo;
  ObserveEvent({required this.userInfo});
}

class SignOutEvent extends SettingsEvent {}
