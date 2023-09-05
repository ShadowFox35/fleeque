import 'package:core/core.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  final _appRouter = appLocator<AppRouter>();

  CarouselBloc() : super(CarouselState()) {
    on<NavigateToAuthEvent>(_goAuth);
  }

  Future<void> _goAuth(
    NavigateToAuthEvent event,
    Emitter<CarouselState> emit,
  ) async {
    _appRouter.push(const AuthorizationRoute());
  }
}
