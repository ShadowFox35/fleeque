import 'package:data/models/influencer_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveProvider {
  late final Box<String> _userIdBox;
  late final Box<InfluencerModel> _influencersBox;

  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(InfluencerModelAdapter());
    _userIdBox = await Hive.openBox(_HiveKeys.users);
    _influencersBox = await Hive.openBox(_HiveKeys.influencersBox);
  }

  String? fetchUserId() => _userIdBox.get(_HiveKeys.userIdKey);

  Future<void> saveUserId(String userId) async =>
      await _userIdBox.put(_HiveKeys.userIdKey, userId);

  Future<void> removeUser() async => await _userIdBox.clear();

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
  static const String influencersBox = 'influencers';
}
