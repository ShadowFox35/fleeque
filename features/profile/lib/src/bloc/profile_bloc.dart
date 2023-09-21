import 'dart:async';

import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AppRouter _appRouter;
  final AuthService _authService;
  final SignOutUseCase _signOutUseCase;
  final CheckUserUseCase _checkUserUseCase;
  final GetUserUseCase _getUserUseCase;
  final SaveUserInfoUseCase _saveUserInfoUseCase;
  final ObserveUserUseCase _observeUserInfoUseCase;

  StreamSubscription<UserEntity>? _subscription;

  ProfileBloc({
    required AuthService authService,
    required AppRouter appRouter,
    required SignOutUseCase signOutUseCase,
    required CheckUserUseCase checkUserUseCase,
    required GetUserUseCase getUserUseCase,
    required SaveUserInfoUseCase saveUserInfoUseCase,
    required ObserveUserUseCase observeUserInfoUseCase,
  })  : _appRouter = appRouter,
        _authService = authService,
        _signOutUseCase = signOutUseCase,
        _checkUserUseCase = checkUserUseCase,
        _getUserUseCase = getUserUseCase,
        _saveUserInfoUseCase = saveUserInfoUseCase,
        _observeUserInfoUseCase = observeUserInfoUseCase,
        super(const ProfileState()) {
    _subscription ??=
        _observeUserInfoUseCase.execute(const NoParams()).listen((info) {
      add(ObserveEvent(userInfo: info));
    });
    on<InitialEvent>(_onInitialEvent);
    on<ObserveEvent>(_onObserveEvent);
    on<NavigateEvent>(_onNavigateEvent);
    on<SignOutEvent>(_onSignOutEvent);
    add(InitialEvent());
    _initializeRouteMappings();
  }

  Future<void> _onInitialEvent(
      InitialEvent event, Emitter<ProfileState> emit) async {
    try {
      emit(
        state.copyWith(isLoading: true, error: null),
      );
      final UserEntity userInfo =
          await _getUserUseCase.execute(const NoParams());
      await _saveUserInfoUseCase.execute(userInfo);
      emit(state.copyWith(userInfo: userInfo, isLoading: false));
    } catch (ex) {
      emit(
        state.copyWith(error: ex, isLoading: false),
      );
    }
  }

  Future<void> _onObserveEvent(
      ObserveEvent event, Emitter<ProfileState> emit) async {
    try {
      emit(
        state.copyWith(error: null),
      );
      emit(state.copyWith(userInfo: event.userInfo));
    } catch (ex) {
      emit(
        state.copyWith(error: ex),
      );
    }
  }

  Future<void> _onSignOutEvent(
      SignOutEvent event, Emitter<ProfileState> emit) async {
    await _signOutUseCase.execute(const NoParams());
    _authService.authenticated = _checkUserUseCase.execute(const NoParams());
    _appRouter.replace(const WelcomeRoute());
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
