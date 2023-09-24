import 'package:data/models/influencer/influencer_model.dart';
import 'package:data/models/user/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveProvider {
  late final Box<String> _userIdBox;
  late final Box<UserModel> _userInfoBox;
  late final Box<String> _userImageBox;
  late final Box<InfluencerModel> _influencersBox;

  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(InfluencerModelAdapter());
    Hive.registerAdapter(UserModelAdapter());
    _userIdBox = await Hive.openBox(_HiveKeys.users);
    _userInfoBox = await Hive.openBox(_HiveKeys.userInfo);
    _userImageBox = await Hive.openBox(_HiveKeys.userImage);
    _influencersBox = await Hive.openBox(_HiveKeys.influencersBox);
  }

  String? fetchUserId() => _userIdBox.get(_HiveKeys.userIdKey);

  Future<void> saveUserId(String userId) async =>
      await _userIdBox.put(_HiveKeys.userIdKey, userId);

  Future<void> saveUserInfo(UserModel userInfo) async =>
      await _userInfoBox.put(_HiveKeys.userInfo, userInfo);

  Future<void> saveUserImage(String imageUrl) async =>
      await _userImageBox.put(_HiveKeys.userImage, imageUrl);

  Future<void> clearUserImage() async {
    await _userImageBox.clear();
  }

  UserModel? fetchUserInfoBox() => _userInfoBox.get(_HiveKeys.userInfo);

  String? fetchUserImage() => _userImageBox.get(_HiveKeys.userImage);

  Future<void> removeUser() async {
    await _userIdBox.clear();
    clearUserInfo();
  }

  Future<void> clearUserInfo() async {
    await _userInfoBox.clear();
  }

  List<InfluencerModel> fetchInfluencers() => _influencersBox.values.toList();

  Future<void> saveInfluencers(List<InfluencerModel> influencers) async {
    await _influencersBox.clear();
    for (int i = 0; i < influencers.length; i++) {
      await _influencersBox.put(i, influencers[i]);
    }
  }
}

class _HiveKeys {
  static const String users = 'appUserIds';
  static const String userIdKey = 'userId';
  static const String userInfo = 'userInfo';
  static const String userImage = 'userImage';
  static const String influencersBox = 'influencers';
}
