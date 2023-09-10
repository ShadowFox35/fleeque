import 'package:domain/entities/authorization_entity.dart';
import 'package:domain/repositories/authorization_repository.dart';
import 'package:domain/usecases/usecases.dart';

class FirebaseSignUpUseCase
    implements AsyncUseCase<AuthorizationModel, String> {
  final AuthorizationRepository _authorizationRepository;

  const FirebaseSignUpUseCase({
    required AuthorizationRepository authorizationRepository,
  }) : _authorizationRepository = authorizationRepository;

  @override
  Future<String> execute(AuthorizationModel input) async =>
      await _authorizationRepository.firebaseSignUp(data: input);
}
