import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final AuthService _authService;
  final CheckUserUseCase _checkUserUseCase;
  final AppRouter _appRouter;

  WelcomeBloc({
    required CheckUserUseCase checkUserUseCase,
    required AuthService authService,
    required AppRouter appRouter,
  })  : _checkUserUseCase = checkUserUseCase,
        _authService = authService,
        _appRouter = appRouter,
        super(const WelcomeState()) {
    on<NavigateToHomeEvent>(_goHome);
    on<NavigateToSignInEvent>(_goSignInScreen);
    on<GetStartedEvent>(_checkStatus);
  }

  Future<void> _checkStatus(
      GetStartedEvent event, Emitter<WelcomeState> emit) async {
    final bool isLogged = _authService.authenticated =
        _checkUserUseCase.execute(const NoParams());
    if (isLogged) {
      _appRouter.replace(const NavigationBarRoute());
    } else {
      _appRouter.replace(const SignInRoute());
    }
  }

  Future<void> _goSignInScreen(
    NavigateToSignInEvent event,
    Emitter<WelcomeState> emit,
  ) async {
    _appRouter.replace(const SignInRoute());
  }

  Future<void> _goHome(
    NavigateToHomeEvent event,
    Emitter<WelcomeState> emit,
  ) async {
    _appRouter.replace(const NavigationBarRoute());
  }
}
