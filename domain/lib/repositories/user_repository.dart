import 'dart:io';

import 'package:domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<void> updateUserInfo({
    required UserEntity data,
  });
  Stream<UserEntity> observeUserInfo();
  Future<UserEntity> getUserInfo();
  Future<String> getUserImagefromStorage();
  Future<String> getUserImageUrl({required File image});
  Future<void> saveUserInfo(UserEntity userInfo);
}
