part of 'influencer_bloc.dart';

abstract class InfluencersEvent {}

class InitEvent extends InfluencersEvent {}

class UpdateEvent extends InfluencersEvent {
  final List<InfluencerEntity> influencerList;

  UpdateEvent({required this.influencerList});
}

class FilterEvent extends InfluencersEvent {
  final FilterEntity request;

  FilterEvent({required this.request});
}

class NavigateToFilterEvent extends InfluencersEvent {}
