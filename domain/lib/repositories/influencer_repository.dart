import 'package:domain/entities/influencer_entity.dart';

abstract class InfluencerRepository {
  Future<List<InfluencerEntity>> getInfluencersList();
}
