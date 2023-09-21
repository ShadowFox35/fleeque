import 'package:core/core.dart';
import 'package:data/data.dart';

class FirebaseProvider {
  final FbCollection = FirebaseFirestore.instance.collection('Influencers');
  final FbUsers = FirebaseFirestore.instance.collection('users');

  Future<List<InfluencerModel>> fetchInfluencersList() async {
    late final List<InfluencerModel> influencersList = [];

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> fbList =
        (await FbCollection.get()).docs.toList();

    fbList.forEach((element) {
      influencersList.add(InfluencerModel.fromJson(element.data()));
    });

    return influencersList;
  }

  Future<UserModel> getUserInfo(String uid) async {
    final DocumentSnapshot<Map<String, dynamic>> userDoc =
        await FbUsers.doc(uid).get();

    final UserModel userData =
        UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
    return userData;
  }

  Future<void> updateUserInfo(uid, data) async {
    await FbUsers.withConverter(
      fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
      toFirestore: (model, _) => model.toJson(),
    ).doc(uid).set(data).onError((e, _) => print("Error writing document: $e"));
  }
}
