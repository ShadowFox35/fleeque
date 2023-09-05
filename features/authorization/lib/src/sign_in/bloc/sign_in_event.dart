part of 'sign_in_bloc.dart';

abstract class SignInScreenEvent {}

class EmailSignInEvent extends SignInScreenEvent {
  final AuthorizationModel model;

  EmailSignInEvent({required this.model});
}

class NavigateToSingUpEvent extends SignInScreenEvent {}

class GoogleSignInEvent extends SignInScreenEvent {}
