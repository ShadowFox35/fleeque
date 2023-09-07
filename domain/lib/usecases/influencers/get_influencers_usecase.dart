import 'package:domain/entities/influencer_entity.dart';
import 'package:domain/repositories/influencer_repository.dart';
import 'package:domain/usecases/usecases.dart';

class GetInfluencersUseCase
    extends AsyncUseCase<NoParams, List<InfluencerEntity>> {
  final InfluencerRepository influencerRepository;

  GetInfluencersUseCase(this.influencerRepository);

  @override
  Future<List<InfluencerEntity>> execute(NoParams input) async {
    return await influencerRepository.getInfluencersList();
  }
}
