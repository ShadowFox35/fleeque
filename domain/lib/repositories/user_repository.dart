import 'package:domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<void> updateUserInfo({
    required UserEntity data,
  });
  Stream<UserEntity> observeUserInfo();
  Future<UserEntity> getUserInfo();
  Future<void> saveUserInfo(UserEntity userInfo);
}
