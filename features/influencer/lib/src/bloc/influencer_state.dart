part of 'influencer_bloc.dart';

class InfluencersState {
  final bool isLoading;
  final List<InfluencerEntity> influencerList;
  final Object? error;

  const InfluencersState({
    this.isLoading = true,
    this.influencerList = const [],
    this.error,
  });

  InfluencersState copyWith({
    List<InfluencerEntity>? influencerList,
    bool? isLoading,
    Object? error,
  }) {
    return InfluencersState(
      influencerList: influencerList ?? this.influencerList,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
