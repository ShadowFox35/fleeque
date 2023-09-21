import 'package:domain/entities/user_entity.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:domain/usecases/usecases.dart';

class SaveUserInfoUseCase implements AsyncUseCase<UserEntity, void> {
  final UserRepository _userRepository;

  const SaveUserInfoUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<void> execute(UserEntity userInfo) async =>
      _userRepository.saveUserInfo(userInfo);
}
