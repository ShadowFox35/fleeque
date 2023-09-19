import 'package:core/core.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AppRouter _appRouter;

  ProfileBloc({
    required AuthService authService,
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(ProfileState()) {
    on<NavigateEvent>(_onNavigateEvent);
    _initializeRouteMappings();
  }

  Future<void> _onNavigateEvent(
    NavigateEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final route = "${event.path}Route";
    final navigateFunction = routeMappings[route];

    if (navigateFunction != null) {
      navigateFunction();
    }
  }

  final Map<String, Function> routeMappings = {};

  void _initializeRouteMappings() {
    routeMappings["SettingsRoute"] =
        () => _appRouter.push(const SettingsRoute());
  }
}
