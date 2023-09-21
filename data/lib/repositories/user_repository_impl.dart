import 'dart:async';
import 'dart:io';
import 'package:domain/domain.dart';
import 'package:data/data.dart';
import 'package:data/mappers/user_mapper.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseProvider _firebaseProvider;
  final HiveProvider _hiveProvider;

  final StreamController<UserEntity> _userEntitiesStreamController =
      StreamController<UserEntity>.broadcast();

  UserRepositoryImpl({
    required FirebaseProvider firebaseProvider,
    required HiveProvider hiveProvider,
  })  : _firebaseProvider = firebaseProvider,
        _hiveProvider = hiveProvider;

  @override
  Future<String> pickUserImage({required File image}) async {
    final String uid = _hiveProvider.fetchUserId()!;
    final url = await _firebaseProvider.pickUserImage(uid, image);
    return url;
  }

  @override
  Future<UserEntity> getUserInfo() async {
    late final UserEntity result;
    late final UserModel userInfo;
    if (_hiveProvider.fetchUserInfoBox() != null) {
      userInfo = _hiveProvider.fetchUserInfoBox()!;
    } else {
      final String? uid = _hiveProvider.fetchUserId();
      userInfo = await _firebaseProvider.getUserInfo(uid!);
    }
    result = UserMapper.toEntity(userInfo);
    return result;
  }

  @override
  Future<void> updateUserInfo({required UserEntity data}) async {
    final UserModel infoToUpdate = UserMapper.toModel(data);
    _updateUserInfo(data: infoToUpdate);
  }

  Future<void> _updateUserInfo({required UserModel data}) async {
    final String? uid = _hiveProvider.fetchUserId();
    await _firebaseProvider.updateUserInfo(uid, data);
    _hiveProvider.clearUserInfo();
  }

  @override
  Stream<UserEntity> observeUserInfo() {
    return _userEntitiesStreamController.stream;
  }

  void dispose() {
    _userEntitiesStreamController.close();
  }

  @override
  Future<void> saveUserInfo(UserEntity userInfo) async {
    _hiveProvider.saveUserInfo(
      UserMapper.toModel(userInfo),
    );
  }
}
