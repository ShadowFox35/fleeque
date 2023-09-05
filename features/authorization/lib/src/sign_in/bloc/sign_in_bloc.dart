import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInScreenEvent, SignInScreenState> {
  final GoogleSignInUseCase _googleSignInUseCase;
  final FirebaseSignInUseCase _emailSignInUseCase;
  final SaveUserUseCase _saveUserUseCase;
  final CheckUserUseCase _checkUserUseCase;
  final AuthService _authService;
  final AppRouter _appRouter;

  SignInBloc({
    required GoogleSignInUseCase googleSignInUseCase,
    required FirebaseSignInUseCase emailSignInUseCase,
    required SaveUserUseCase saveUserUseCase,
    required CheckUserUseCase checkUserUseCase,
    required AuthService authService,
    required AppRouter appRouter,
  })  : _saveUserUseCase = saveUserUseCase,
        _googleSignInUseCase = googleSignInUseCase,
        _emailSignInUseCase = emailSignInUseCase,
        _checkUserUseCase = checkUserUseCase,
        _authService = authService,
        _appRouter = appRouter,
        super(const SignInScreenState()) {
    on<EmailSignInEvent>(_emailSignIn);
    on<GoogleSignInEvent>(_googleSignIn);
    on<NavigateToSingUpEvent>(_goSingUp);
  }

  Future<void> _goSingUp(
    NavigateToSingUpEvent event,
    Emitter<SignInScreenState> emit,
  ) async {
    _appRouter.push(const SignUpRoute());
  }

  Future<void> _emailSignIn(
      EmailSignInEvent event, Emitter<SignInScreenState> emit) async {
    final String userId = await _emailSignInUseCase.execute(event.model);
    await _saveUserUseCase.execute(userId);
    _authService.authenticated = _checkUserUseCase.execute(const NoParams());
    _appRouter.replace(const NavigationBarRoute());
  }

  Future<void> _googleSignIn(
      GoogleSignInEvent event, Emitter<SignInScreenState> emit) async {
    final String userId = await _googleSignInUseCase.execute(const NoParams());
    await _saveUserUseCase.execute(userId);
    _authService.authenticated = _checkUserUseCase.execute(const NoParams());
    _appRouter.replace(const NavigationBarRoute());
  }
}
