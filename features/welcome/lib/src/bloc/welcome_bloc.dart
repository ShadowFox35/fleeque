import 'package:core/core.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final AppRouter _appRouter;

  WelcomeBloc({
    required AuthService authService,
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(WelcomeState()) {
    on<NavigateToCarouselEvent>(_goCarouselScreen);
  }

  Future<void> _goCarouselScreen(
    NavigateToCarouselEvent event,
    Emitter<WelcomeState> emit,
  ) async {
    _appRouter.replace(const CarouselRoute());
  }
}
