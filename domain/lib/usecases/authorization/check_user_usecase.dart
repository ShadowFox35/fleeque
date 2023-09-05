import 'package:domain/repositories/authorization_repository.dart';
import 'package:domain/usecases/usecases.dart';

class CheckUserUseCase implements UseCase<NoParams, bool> {
  final AuthorizationRepository _authorizationRepository;

  const CheckUserUseCase({
    required AuthorizationRepository authorizationRepository,
  }) : _authorizationRepository = authorizationRepository;

  @override
  bool execute(NoParams input) => _authorizationRepository.checkUser();
}
