import 'package:domain/domain.dart';
import 'package:core/core.dart';

part 'influencer_state.dart';
part 'influencer_event.dart';

class InfluencersBloc extends Bloc<InfluencersEvent, InfluencersState> {
  final GetInfluencersUseCase _getInfluencersUseCase;
  final SaveInfluencersUseCase _saveInfluencersUseCase;

  InfluencersBloc({
    required GetInfluencersUseCase getInfluencersUseCase,
    required SaveInfluencersUseCase saveInfluencersUseCase,
  })  : _getInfluencersUseCase = getInfluencersUseCase,
        _saveInfluencersUseCase = saveInfluencersUseCase,
        super(const InfluencersState()) {
    on<InitEvent>(_getList);
    add(InitEvent());
  }

  Future<void> _getList(InitEvent event, Emitter<InfluencersState> emit) async {
    try {
      emit(
        state.copyWith(isLoading: true, error: null),
      );
      final List<InfluencerEntity> influencers =
          await _getInfluencersUseCase.execute(const NoParams());
      await _saveInfluencersUseCase.execute(influencers);
      emit(state.copyWith(
          influencerList: [...state.influencerList, ...influencers],
          isLoading: false));
    } catch (ex) {
      emit(
        state.copyWith(error: ex, isLoading: false),
      );
    }
  }
}
