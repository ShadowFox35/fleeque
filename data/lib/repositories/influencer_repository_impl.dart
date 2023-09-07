import 'package:data/data.dart';
import 'package:data/mappers/influencer_mapper.dart';
import 'package:domain/domain.dart';

class InfluencerRepositoryImpl implements InfluencerRepository {
  final FirebaseProvider _firebaseProvider;

  InfluencerRepositoryImpl(this._firebaseProvider);

  @override
  Future<List<InfluencerEntity>> getInfluencersList() async {
    final List<InfluencerModel> result =
        await _firebaseProvider.fetchInfluencersList();
    return result
        .map((InfluencerModel e) => InfluencerMapper.toEntity(e))
        .toList();
  }
}
