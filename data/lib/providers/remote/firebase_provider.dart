import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class FirebaseProvider {
  final FbCollection = FirebaseFirestore.instance.collection('Influencers');

  Future<List<InfluencerModel>> fetchInfluencersList() async {
    return await _getInfluencersList();
  }

  Future<List<InfluencerModel>> filterInfluencersList({
    required FilterEntity data,
  }) async {
    return await _filterInfluencersList(data);
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

  Future<List<InfluencerModel>> _filterInfluencersList(
      FilterEntity data) async {
    late List<InfluencerModel> filteredList = [];
    DateFormat dateFormat = DateFormat('dd.MM.yyyy');
    final DateTime time = dateFormat.parse(data.time);

    int convertToInt(followers) {
    String modified = followers.substring(0, followers.length - 1);
    var followersInInt = int.tryParse(modified);
      return followersInInt! * 1000000;
    }

    List<InfluencerModel> filterByCountry(list) {
      if (data.country.isNotEmpty) {
        List<InfluencerModel> newlist =
            list.where((element) => element.country == data.country).toList();
        filteredList = newlist;
        return filteredList;
      } else {
        return list;
      }
    }

    List<InfluencerModel> filterByFollowers(list) {
      var newlist = list
          .where((element) => convertToInt(element.followers) >= data.followers)
          .toList();
      filteredList = newlist;
      return newlist;
    }

    List<InfluencerModel> filterByTime(list) {
      if (data.time.isNotEmpty) {
        List<InfluencerModel> newlist = list
            .where((element) => dateFormat.parse(element.time).isBefore(time))
            .toList();
        filteredList = newlist;

        return filteredList;
      } else {
        return list;
      }
    }

    final fbList =
        (await FbCollection.where("price", isLessThanOrEqualTo: data.price)
                .get())
            .docs
            .toList();

    fbList.forEach((element) {
      filteredList.add(InfluencerModel.fromJson(element.data()));
    });

    filterByCountry(filteredList);
    filterByFollowers(filteredList);
    filterByTime(filteredList);

    return filteredList;
  }
}
