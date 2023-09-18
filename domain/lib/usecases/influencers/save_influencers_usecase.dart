import 'package:domain/entities/influencer_entity.dart';
import 'package:domain/repositories/influencer_repository.dart';
import 'package:domain/usecases/usecases.dart';

class SaveInfluencersUseCase
    implements AsyncUseCase<List<InfluencerEntity>, void> {
  final InfluencerRepository _influencerRepository;

  const SaveInfluencersUseCase({
    required InfluencerRepository influencerRepository,
  }) : _influencerRepository = influencerRepository;

  @override
  Future<void> execute(List<InfluencerEntity> input) async =>
      _influencerRepository.saveInfluencersList(input);
}
