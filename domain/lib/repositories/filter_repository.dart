import 'package:domain/entities/filter_entity.dart';
import 'package:domain/entities/influencer_entity.dart';

abstract class FilterRepository {
  Future<List<InfluencerEntity>> filterInfluencersList({
    required FilterEntity data,
  });
  Stream<List<InfluencerEntity>> observeInfluencersList();
}
