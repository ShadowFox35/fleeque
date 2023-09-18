import 'package:domain/entities/filter_entity.dart';
import 'package:domain/entities/influencer_entity.dart';

abstract class InfluencerRepository {
  Future<List<InfluencerEntity>> getInfluencersList();
  Future<List<InfluencerEntity>> filterInfluencersList({
    required FilterEntity data,
  });
  Stream<List<InfluencerEntity>> observeInfluencersList();

  Future<void> saveInfluencersList(List<InfluencerEntity> influencers);
}
