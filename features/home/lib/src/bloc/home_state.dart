part of 'home_bloc.dart';

class HomeState {
  final bool isLoading;
  final List<InfluencerEntity> influencerList;
  final Object? error;

  const HomeState({
    this.isLoading = true,
    this.influencerList = const [],
    this.error,
  });

  HomeState copyWith({
    List<InfluencerEntity>? influencerList,
    bool? isLoading,
    Object? error,
  }) {
    return HomeState(
      influencerList: influencerList ?? this.influencerList,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
