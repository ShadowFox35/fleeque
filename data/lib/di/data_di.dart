import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/repositories/authorization_repository_impl.dart';
import 'package:domain/domain.dart';

final DataDI dataDI = DataDI();

class DataDI {
  void initDependencies() {
    _initServices();
    _initProviders();
    _initRepositories();
    _initUseCases();
  }

  void _initServices() {
    // appLocator.registerLazySingleton<UrlService>(
    //   () => UrlService(),
    // );
    appLocator.registerLazySingleton<AuthService>(
      () => AuthService(),
    );
    // appLocator.registerLazySingleton<NetworkService>(
    //   () => NetworkService(
    //     connectivity: Connectivity(),
    //     internetConnectionChecker: InternetConnectionChecker(),
    //   ),
    // );
  }

  void _initProviders() {
    appLocator.registerLazySingleton<HiveProvider>(
      () => HiveProvider(),
    );

    appLocator.registerLazySingleton<FirebaseAuthProvider>(
      () => FirebaseAuthProvider(
        firebaseAuth: FirebaseAuth.instance,
        googleSignIn: GoogleSignIn(),
      ),
    );
  }

  void _initRepositories() {
    appLocator.registerLazySingleton<AuthorizationRepository>(
      () => AuthorizationRepositoryImpl(
        authProvider: appLocator<FirebaseAuthProvider>(),
        hiveProvider: appLocator<HiveProvider>(),
      ),
    );
  }

  void _initUseCases() {
    appLocator.registerLazySingleton<FirebaseSignInUseCase>(
      () => FirebaseSignInUseCase(
        authorizationRepository: appLocator<AuthorizationRepository>(),
      ),
    );

    appLocator.registerLazySingleton<FirebaseSignUpUseCase>(
      () => FirebaseSignUpUseCase(
        authorizationRepository: appLocator<AuthorizationRepository>(),
      ),
    );

    appLocator.registerLazySingleton<GoogleSignInUseCase>(
      () => GoogleSignInUseCase(
        authorizationRepository: appLocator<AuthorizationRepository>(),
      ),
    );

    appLocator.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(
        authorizationRepository: appLocator<AuthorizationRepository>(),
      ),
    );

    appLocator.registerLazySingleton<SaveUserUseCase>(
      () => SaveUserUseCase(
        authorizationRepository: appLocator<AuthorizationRepository>(),
      ),
    );

    appLocator.registerLazySingleton<CheckUserUseCase>(
      () => CheckUserUseCase(
        authorizationRepository: appLocator<AuthorizationRepository>(),
      ),
    );
  }
}
