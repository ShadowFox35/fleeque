import 'package:core/core.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  final _appRouter = appLocator<AppRouter>();

  CarouselBloc() : super(CarouselState()) {
    on<NavigateToHome>(_goHome);
  }

  Future<void> _goHome(
    NavigateToHome event,
    Emitter<CarouselState> emit,
  ) async {
    _appRouter.push(const NavigationBarRoute());
  }
}
