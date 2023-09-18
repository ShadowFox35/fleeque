import 'package:domain/entities/filter_entity.dart';
import 'package:domain/entities/influencer_entity.dart';
import 'package:domain/repositories/filter_repository.dart';
import 'package:domain/usecases/usecases.dart';

class FilterInfluencersUseCase
    extends AsyncUseCase<FilterEntity, List<InfluencerEntity>> {
  final FilterRepository filterRepository;

  FilterInfluencersUseCase(this.filterRepository);

  @override
  Future<List<InfluencerEntity>> execute(FilterEntity input) async {
    return await filterRepository.filterInfluencersList(data: input);
  }
}
