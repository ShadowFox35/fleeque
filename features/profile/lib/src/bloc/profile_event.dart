part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class InitialEvent extends ProfileEvent {}

class NavigateEvent extends ProfileEvent {
  final String path;

  NavigateEvent({required this.path});
}
