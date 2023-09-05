import 'package:domain/repositories/authorization_repository.dart';
import 'package:domain/usecases/usecases.dart';

class SaveUserUseCase implements AsyncUseCase<String, void> {
  final AuthorizationRepository _authorizationRepository;

  const SaveUserUseCase(
      {required AuthorizationRepository authorizationRepository})
      : _authorizationRepository = authorizationRepository;

  @override
  Future<void> execute(String input) async =>
      await _authorizationRepository.saveUser(input);
}
