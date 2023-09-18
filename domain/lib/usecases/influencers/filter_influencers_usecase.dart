import 'package:domain/entities/filter_entity.dart';
import 'package:domain/entities/influencer_entity.dart';
import 'package:domain/repositories/influencer_repository.dart';
import 'package:domain/usecases/usecases.dart';

class FilterInfluencersUseCase
    extends AsyncUseCase<FilterEntity, List<InfluencerEntity>> {
  final InfluencerRepository influencerRepository;

  FilterInfluencersUseCase(this.influencerRepository);

  @override
  Future<List<InfluencerEntity>> execute(FilterEntity input) async {
    return await influencerRepository.filterInfluencersList(data: input);
  }
}
