import 'package:domain/repositories/authorization_repository.dart';
import 'package:domain/usecases/usecases.dart';

class GoogleSignInUseCase implements AsyncUseCase<NoParams, String> {
  final AuthorizationRepository _authorizationRepository;

  const GoogleSignInUseCase({
    required AuthorizationRepository authorizationRepository,
  }) : _authorizationRepository = authorizationRepository;

  @override
  Future<String> execute(NoParams input) async =>
      await _authorizationRepository.googleSignIn();
}
