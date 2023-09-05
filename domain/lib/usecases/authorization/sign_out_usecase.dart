import 'package:domain/repositories/authorization_repository.dart';
import 'package:domain/usecases/usecases.dart';

class SignOutUseCase implements AsyncUseCase<NoParams, void> {
  final AuthorizationRepository _authorizationRepository;

  const SignOutUseCase({
    required AuthorizationRepository authorizationRepository,
  }) : _authorizationRepository = authorizationRepository;

  @override
  Future<void> execute(NoParams input) async =>
      await _authorizationRepository.signOut();
}
