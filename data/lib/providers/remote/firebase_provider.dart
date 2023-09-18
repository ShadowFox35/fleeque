import 'package:core/core.dart';
import 'package:data/data.dart';

class FirebaseProvider {
  final FbCollection = FirebaseFirestore.instance.collection('Influencers');

  Future<List<InfluencerModel>> fetchInfluencersList() async {
    return await _getInfluencersList();
  }

  Future<List<InfluencerModel>> _getInfluencersList() async {
    late final List<InfluencerModel> influencersList = [];

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> fbList =
        (await FbCollection.get()).docs.toList();

    fbList.forEach((element) {
      influencersList.add(InfluencerModel.fromJson(element.data()));
    });

    return influencersList;
  }
}
