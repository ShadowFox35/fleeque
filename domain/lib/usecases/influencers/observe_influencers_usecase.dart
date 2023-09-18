import 'package:domain/entities/influencer_entity.dart';
import 'package:domain/repositories/influencer_repository.dart';
import 'package:domain/usecases/usecases.dart';

class ObserveInfluencersUseCase
    extends StreamUseCase<NoParams, List<InfluencerEntity>> {
  final InfluencerRepository influencerRepository;

  ObserveInfluencersUseCase(this.influencerRepository);

  @override
  Stream<List<InfluencerEntity>> execute(NoParams input) {
    return influencerRepository.observeInfluencersList();
  }
}
