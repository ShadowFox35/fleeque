import 'package:core/core.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final _appRouter = appLocator<AppRouter>();

  WelcomeBloc() : super(WelcomeState()) {
    on<NavigateToCarouselEvent>(_goCarousel);
  }

  Future<void> _goCarousel(
    NavigateToCarouselEvent event,
    Emitter<WelcomeState> emit,
  ) async {
    _appRouter.push(const CarouselRoute());
  }
}
