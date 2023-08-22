import 'package:core/core.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final _appRouter = appLocator<AppRouter>();

  WelcomeBloc() : super(WelcomeState()) {
    on<NavigateToHomeEvent>(_goHome);
  }

  Future<void> _goHome(
    NavigateToHomeEvent event,
    Emitter<WelcomeState> emit,
  ) async {
    _appRouter.push(const HomeRoute());
  }
}
