import 'package:domain/entities/user_entity.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:domain/usecases/usecases.dart';

class UpdateUserInfoUseCase extends AsyncUseCase<UserEntity, void> {
  final UserRepository userRepository;

  UpdateUserInfoUseCase(this.userRepository);

  @override
  Future<void> execute(UserEntity input) async =>
      userRepository.updateUserInfo(data: input);
}
