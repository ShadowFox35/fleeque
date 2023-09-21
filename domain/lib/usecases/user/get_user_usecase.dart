import 'package:domain/entities/user_entity.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:domain/usecases/usecases.dart';

class GetUserUseCase extends AsyncUseCase<NoParams, UserEntity> {
  final UserRepository userRepository;

  GetUserUseCase(this.userRepository);

  @override
  Future<UserEntity> execute(NoParams input) async {
    return await userRepository.getUserInfo();
  }
}
