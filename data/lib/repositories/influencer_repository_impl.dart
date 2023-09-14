import 'dart:async';

import 'package:data/data.dart';
import 'package:data/mappers/influencer_mapper.dart';
import 'package:domain/domain.dart';

class InfluencerRepositoryImpl implements InfluencerRepository {
  final FirebaseProvider _firebaseProvider;
  final HiveProvider _hiveProvider;
  final StreamController<List<InfluencerEntity>>
      _influencersEntitiesStreamController =
      StreamController<List<InfluencerEntity>>.broadcast();

  InfluencerRepositoryImpl({
    required FirebaseProvider firebaseProvider,
    required HiveProvider hiveProvider,
  })  : _firebaseProvider = firebaseProvider,
        _hiveProvider = hiveProvider;

  @override
  Future<List<InfluencerEntity>> getInfluencersList() async {
    final List<InfluencerModel> list =
        await _firebaseProvider.fetchInfluencersList();
    final result =
        list.map((InfluencerModel e) => InfluencerMapper.toEntity(e)).toList();

    //  _influencersEntitiesStreamController.add(result);
   
    return result;
  }

  @override
  Future<List<InfluencerEntity>> filterInfluencersList(
      {required FilterEntity data}) async {
    final List<InfluencerModel> list =
        await _firebaseProvider.filterInfluencersList(data: data);
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

  @override
  Future<void> saveInfluencersList(List<InfluencerEntity> influencers) async {
    _hiveProvider.saveInfluencers(
      influencers
          .map(
            (InfluencerEntity e) => InfluencerMapper.toModel(e),
          )
          .toList(),
    );
  }
}
