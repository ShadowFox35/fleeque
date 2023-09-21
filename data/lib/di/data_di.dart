import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:data/repositories/authorization_repository_impl.dart';
import 'package:data/repositories/influencer_repository_impl.dart';
import 'package:data/repositories/filter_repository_impl.dart';
import 'package:data/repositories/user_repository_impl.dart';

final DataDI dataDI = DataDI();

class DataDI {
  void initDependencies() {
    _initServices();
    _initProviders();
    _initRepositories();
    _initUseCases();
  }

  void _initServices() {
    appLocator.registerLazySingleton<AuthService>(
      () => AuthService(),
    );
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

    appLocator.registerLazySingleton<FirebaseProvider>(
      () => FirebaseProvider(),
    );
  }

  void _initRepositories() {
    appLocator.registerLazySingleton<AuthorizationRepository>(
      () => AuthorizationRepositoryImpl(
        authProvider: appLocator<FirebaseAuthProvider>(),
        hiveProvider: appLocator<HiveProvider>(),
      ),
    );

    appLocator.registerLazySingleton<InfluencerRepository>(
      () => InfluencerRepositoryImpl(
        firebaseProvider: appLocator<FirebaseProvider>(),
        hiveProvider: appLocator<HiveProvider>(),
      ),
    );

    appLocator.registerLazySingleton<FilterRepository>(
      () => FilterRepositoryImpl(),
    );

    appLocator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        firebaseProvider: appLocator<FirebaseProvider>(),
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

    appLocator.registerLazySingleton<GetUserUseCase>(
      () => GetUserUseCase(appLocator.get<UserRepository>()),
    );

    appLocator.registerLazySingleton<SaveUserInfoUseCase>(
      () => SaveUserInfoUseCase(
        userRepository: appLocator<UserRepository>(),
      ),
    );

    appLocator.registerLazySingleton<UpdateUserInfoUseCase>(
      () => UpdateUserInfoUseCase(appLocator.get<UserRepository>()),
    );
    appLocator.registerLazySingleton<ObserveUserUseCase>(
      () => ObserveUserUseCase(appLocator.get<UserRepository>()),
    );

    appLocator.registerLazySingleton<GetInfluencersUseCase>(
      () => GetInfluencersUseCase(appLocator.get<InfluencerRepository>()),
    );

    appLocator.registerLazySingleton<FilterInfluencersUseCase>(
      () => FilterInfluencersUseCase(appLocator.get<FilterRepository>()),
    );

    appLocator.registerLazySingleton<ObserveInfluencersUseCase>(
      () => ObserveInfluencersUseCase(appLocator.get<FilterRepository>()),
    );

    appLocator.registerLazySingleton<SaveInfluencersUseCase>(
      () => SaveInfluencersUseCase(
        influencerRepository: appLocator<InfluencerRepository>(),
      ),
    );
  }
}
