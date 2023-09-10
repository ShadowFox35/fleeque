import 'package:domain/domain.dart';
import 'package:core/core.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetInfluencersUseCase _getInfluencersUseCase;

  HomeBloc({
    required GetInfluencersUseCase getInfluencersUseCase,
  })  : _getInfluencersUseCase = getInfluencersUseCase,
        super(const HomeState()) {
    on<LoadInfluencersList>(_getList);
    add(LoadInfluencersList());
  }

  Future<void> _getList(
      LoadInfluencersList event, Emitter<HomeState> emit) async {
    try {
      emit(
        state.copyWith(isLoading: true, error: null),
      );
      final List<InfluencerEntity> influencers =
          await _getInfluencersUseCase.execute(const NoParams());
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
