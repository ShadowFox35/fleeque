import 'dart:async';

import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/mappers/influencer_mapper.dart';
import 'package:domain/domain.dart';

class FilterRepositoryImpl implements FilterRepository {
  final FbCollection = FirebaseFirestore.instance.collection('Influencers');
  final StreamController<List<InfluencerEntity>>
      _influencersEntitiesStreamController =
      StreamController<List<InfluencerEntity>>.broadcast();

  @override
  Future<List<InfluencerEntity>> filterInfluencersList(
      {required FilterEntity data}) async {
    final List<InfluencerModel> list = await _filterInfluencersList(data);
    final result =
        list.map((InfluencerModel e) => InfluencerMapper.toEntity(e)).toList();
    _influencersEntitiesStreamController.add(result);

    return result;
  }

  @override
  Stream<List<InfluencerEntity>> observeInfluencersList() {
    return _influencersEntitiesStreamController.stream;
  }

  void dispose() {
    _influencersEntitiesStreamController.close();
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
      var newlist = list
          .where((element) => dateFormat.parse(element.time).isAfter(time))
          .toList();
      filteredList = newlist;
      return filteredList;
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
