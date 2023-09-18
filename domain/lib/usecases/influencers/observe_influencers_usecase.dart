import 'package:domain/entities/influencer_entity.dart';
import 'package:domain/repositories/filter_repository.dart';
import 'package:domain/usecases/usecases.dart';

class ObserveInfluencersUseCase
    extends StreamUseCase<NoParams, List<InfluencerEntity>> {
  final FilterRepository filterRepository;

  ObserveInfluencersUseCase(this.filterRepository);

  @override
  Stream<List<InfluencerEntity>> execute(NoParams input) {
    return filterRepository.observeInfluencersList();
  }
}
