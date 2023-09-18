import 'package:domain/domain.dart';
import 'package:core/core.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetInfluencersUseCase _getInfluencersUseCase;
  final SaveInfluencersUseCase _saveInfluencersUseCase;

  HomeBloc({
    required GetInfluencersUseCase getInfluencersUseCase,
    required SaveInfluencersUseCase saveInfluencersUseCase,
  })  : _getInfluencersUseCase = getInfluencersUseCase,
        _saveInfluencersUseCase = saveInfluencersUseCase,
        super(const HomeState()) {
    on<InitEvent>(_getList);
    add(InitEvent());
  }

  Future<void> _getList(InitEvent event, Emitter<HomeState> emit) async {
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
