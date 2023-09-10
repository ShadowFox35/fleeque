import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CheckUserUseCase _checkUserUseCase;
  final AppRouter _appRouter;

  SplashBloc({
    required CheckUserUseCase checkUserUseCase,
    required AppRouter appRouter,
  })  : _checkUserUseCase = checkUserUseCase,
        _appRouter = appRouter,
        super(SplashState()) {
    on<InitialEvent>(_checkStatus);
    add(InitialEvent());
  }

  Future<void> _checkStatus(
      InitialEvent event, Emitter<SplashState> emit) async {
    final bool isLogged = _checkUserUseCase.execute(const NoParams());
    if (isLogged) {
      _appRouter.replace(const NavigationBarRoute());
    } else {
      _appRouter.replace(const WelcomeRoute());
    }
  }


  
}
