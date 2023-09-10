part of 'welcome_bloc.dart';

abstract class WelcomeEvent {}

class InitialEvent extends WelcomeEvent {
  InitialEvent();
}

class GetStartedEvent extends WelcomeEvent {}

class NavigateToCarouselEvent extends WelcomeEvent {}
