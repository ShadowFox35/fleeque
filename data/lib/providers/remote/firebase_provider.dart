import 'package:core/core.dart';
import 'package:data/data.dart';

class FirebaseProvider {
  Future<List<InfluencerModel>> fetchInfluencersList() async {
    return await _getInfluencersList();
  }

  Future<List<InfluencerModel>> _getInfluencersList() async {
    late final List<InfluencerModel> influencersList = [];

    final fbList =
        (await FirebaseFirestore.instance.collection('Influencers').get())
            .docs
            .toList();

    fbList.forEach((element) {
      influencersList.add(InfluencerModel.fromJson(element.data()));
    });

    return influencersList;
  }
}
