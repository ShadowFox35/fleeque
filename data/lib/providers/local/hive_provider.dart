import 'package:hive_flutter/hive_flutter.dart';

class HiveProvider {
  late final Box<String> _userIdBox;

  Future<void> initHive() async {
    await Hive.initFlutter();
    _userIdBox = await Hive.openBox(_HiveKeys.users);
  }

  Future<void> saveUserId(String userId) async =>
      await _userIdBox.put(_HiveKeys.userIdKey, userId);

  String? fetchUserId() => _userIdBox.get(_HiveKeys.userIdKey);

  Future<void> removeUser() async => await _userIdBox.clear();
}

class _HiveKeys {
  static const String users = 'appUserIds';
  static const String userIdKey = 'userId';
}
