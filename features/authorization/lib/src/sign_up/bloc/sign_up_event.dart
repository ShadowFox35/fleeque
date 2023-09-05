part of 'sign_up_bloc.dart';

abstract class SignUpScreenEvent {}

class SignUpEvent extends SignUpScreenEvent {
  final AuthorizationModel data;

  SignUpEvent({required this.data});
}

class NavigateToSingInEvent extends SignUpScreenEvent {}
