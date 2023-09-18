import 'dart:async';

import 'package:domain/domain.dart';
import 'package:core/core.dart';

part 'influencer_state.dart';
part 'influencer_event.dart';

class InfluencersBloc extends Bloc<InfluencersEvent, InfluencersState> {
  final AppRouter _appRouter;
  final GetInfluencersUseCase _getInfluencersUseCase;
  final ObserveInfluencersUseCase _observeInfluencersUseCase;
  final FilterInfluencersUseCase _filterInfluencersUseCase;
  final SaveInfluencersUseCase _saveInfluencersUseCase;

  StreamSubscription<List<InfluencerEntity>>? _subscription;

  InfluencersBloc({
    required GetInfluencersUseCase getInfluencersUseCase,
    required ObserveInfluencersUseCase observeInfluencersUseCase,
    required FilterInfluencersUseCase filterInfluencersUseCase,
    required SaveInfluencersUseCase saveInfluencersUseCase,
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        _getInfluencersUseCase = getInfluencersUseCase,
        _observeInfluencersUseCase = observeInfluencersUseCase,
        _filterInfluencersUseCase = filterInfluencersUseCase,
        _saveInfluencersUseCase = saveInfluencersUseCase,
        super(const InfluencersState()) {
    _subscription ??=
        _observeInfluencersUseCase.execute(const NoParams()).listen((list) {
      add(UpdateEvent(influencerList: list));
    });

    on<InitEvent>(_onInitEvent);
    on<FilterEvent>(_onFilterEvent);
    on<NavigateToFilterEvent>(_onNavigateToFilterEvent);
    on<UpdateEvent>(_onUpdateEvent);
    add(InitEvent());
  }

  Future<void> _onInitEvent(
      InitEvent event, Emitter<InfluencersState> emit) async {
    try {
      emit(
        state.copyWith(isLoading: true, error: null),
      );
      final List<InfluencerEntity> influencers =
          await _getInfluencersUseCase.execute(const NoParams());
      await _saveInfluencersUseCase.execute(influencers);
      emit(state.copyWith(influencerList: influencers, isLoading: false,));
    } catch (ex) {
      emit(
        state.copyWith(error: ex, isLoading: false),
      );
    }
  }

  Future<void> _onUpdateEvent(
      UpdateEvent event, Emitter<InfluencersState> emit) async {
    try {
      emit(
        state.copyWith(isLoading: true, error: null),
      );
      emit(state.copyWith(
          influencerList: event.influencerList, isLoading: false,));
    } catch (ex) {
      emit(
        state.copyWith(error: ex, isLoading: false),
      );
    }
  }

  Future<void> _onFilterEvent(
      FilterEvent event, Emitter<InfluencersState> emit) async {
    try {
      emit(
        state.copyWith(isLoading: true, error: null),
      );
      final List<InfluencerEntity> influencers =
          await _filterInfluencersUseCase.execute(event.request);
      emit(state.copyWith(influencerList: influencers, isLoading: false));
    } catch (ex) {
      emit(
        state.copyWith(error: ex, isLoading: false),
      );
    }
  }

  Future<void> _onNavigateToFilterEvent(
    NavigateToFilterEvent event,
    Emitter<InfluencersState> emit,
  ) async {
    _appRouter.push(const FilterRoute());
  }
}
