import 'dart:async';
import 'dart:io';

import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AppRouter _appRouter;
  final AuthService _authService;
  final SignOutUseCase _signOutUseCase;
  final CheckUserUseCase _checkUserUseCase;
  final GetUserUseCase _getUserUseCase;
  final UpdateUserInfoUseCase _updateUserInfoUseCase;
  final ObserveUserUseCase _observeUserInfoUseCase;
  final SaveUserInfoUseCase _saveUserInfoUseCase;
  final PickUserImageUseCase _pickUserImageUseCase;

  StreamSubscription<UserEntity>? _subscription;

  SettingsBloc({
    required AuthService authService,
    required AppRouter appRouter,
    required SignOutUseCase signOutUseCase,
    required CheckUserUseCase checkUserUseCase,
    required GetUserUseCase getUserUseCase,
    required UpdateUserInfoUseCase updateUserInfoUseCase,
    required ObserveUserUseCase observeUserInfoUseCase,
    required SaveUserInfoUseCase saveUserInfoUseCase,
    required PickUserImageUseCase pickUserImageUseCase,
  })  : _appRouter = appRouter,
        _authService = authService,
        _signOutUseCase = signOutUseCase,
        _checkUserUseCase = checkUserUseCase,
        _getUserUseCase = getUserUseCase,
        _updateUserInfoUseCase = updateUserInfoUseCase,
        _observeUserInfoUseCase = observeUserInfoUseCase,
        _saveUserInfoUseCase = saveUserInfoUseCase,
        _pickUserImageUseCase = pickUserImageUseCase,
        super(const SettingsState()) {
    _subscription ??=
        _observeUserInfoUseCase.execute(const NoParams()).listen((info) {
      add(ObserveEvent(userInfo: info));
    });
    on<InitialEvent>(_onInitialEvent);
    on<PickImageEvent>(_onPickImageEvent);
    on<AddInfoEvent>(_onAddInfoEvent);
    on<ObserveEvent>(_onObserveEvent);
    on<SignOutEvent>(_onSignOutEvent);
    add(InitialEvent());
  }

  Future<void> _onInitialEvent(
      InitialEvent event, Emitter<SettingsState> emit) async {
    try {
      emit(
        state.copyWith(
          error: null,
          isLoading: true,
        ),
      );
      final UserEntity userInfo =
          await _getUserUseCase.execute(const NoParams());
      emit(state.copyWith(
        userInfo: userInfo,
        isLoading: false,
      ));
    } catch (ex) {
      emit(
        state.copyWith(error: ex),
      );
    }
  }

  Future<void> _onPickImageEvent(
      PickImageEvent event, Emitter<SettingsState> emit) async {
    try {
      emit(
        state.copyWith(isLoading: true, error: null),
      );
      await _pickUserImageUseCase.execute(event.image);
      final UserEntity userInfo =
          await _getUserUseCase.execute(const NoParams());
      emit(state.copyWith(isLoading: false, userInfo: userInfo));
    } catch (ex) {
      emit(
        state.copyWith(isLoading: false, error: ex),
      );
    }
  }

  Future<void> _onAddInfoEvent(
      AddInfoEvent event, Emitter<SettingsState> emit) async {
    try {
      emit(
        state.copyWith(error: null),
      );
      await _updateUserInfoUseCase.execute(event.userInfo);
      emit(state.copyWith(userInfo: event.userInfo));
    } catch (ex) {
      emit(
        state.copyWith(error: ex),
      );
    }
  }

  Future<void> _onObserveEvent(
      ObserveEvent event, Emitter<SettingsState> emit) async {
    try {
      emit(
        state.copyWith(error: null),
      );
      await _saveUserInfoUseCase.execute(event.userInfo);
      emit(state.copyWith(userInfo: event.userInfo));
    } catch (ex) {
      emit(
        state.copyWith(error: ex),
      );
    }
  }

  Future<void> _onSignOutEvent(
      SignOutEvent event, Emitter<SettingsState> emit) async {
    await _signOutUseCase.execute(const NoParams());
    _authService.authenticated = _checkUserUseCase.execute(const NoParams());
    _appRouter.replace(const WelcomeRoute());
  }
}