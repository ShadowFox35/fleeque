import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpScreenEvent, SignUpState> {
  final FirebaseSignUpUseCase _emailSignUpUseCase;
  final SaveUserUseCase _saveUserUseCase;
  final CheckUserUseCase _checkUserUseCase;
  final AppRouter _appRouter;
  final AuthService _authService;

  SignUpBloc({
    required FirebaseSignUpUseCase emailSignUpUseCase,
    required SaveUserUseCase saveUserUseCase,
    required CheckUserUseCase checkUserUseCase,
    required AppRouter appRouter,
    required AuthService authService,
  })  : _emailSignUpUseCase = emailSignUpUseCase,
        _saveUserUseCase = saveUserUseCase,
        _checkUserUseCase = checkUserUseCase,
        _appRouter = appRouter,
        _authService = authService,
        super(const SignUpState()) {
    on<SignUpEvent>(_emailSignUp);
    on<NavigateToSingInEvent>(_goSingIn);
  }

  Future<void> _emailSignUp(
      SignUpEvent event, Emitter<SignUpState> emit) async {
    final String userId = await _emailSignUpUseCase.execute(event.data);
    await _saveUserUseCase.execute(userId);
    _authService.authenticated = _checkUserUseCase.execute(const NoParams());
    _appRouter.replace(const NavigationBarRoute());
  }

  Future<void> _goSingIn(
    NavigateToSingInEvent event,
    Emitter<SignUpState> emit,
  ) async {
    _appRouter.push(const SignInRoute());
  }
}
