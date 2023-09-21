import 'package:domain/entities/user_entity.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:domain/usecases/usecases.dart';

class ObserveUserUseCase extends StreamUseCase<NoParams, UserEntity> {
  final UserRepository userRepository;

  ObserveUserUseCase(this.userRepository);

  @override
  Stream<UserEntity> execute(NoParams input) {
    return userRepository.observeUserInfo();
  }
}
