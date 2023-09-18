import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:influencer/src/bloc/influencer_bloc.dart';
import 'package:influencer/src/ui/filter_form.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => InfluencersBloc(
        appRouter: appLocator<AppRouter>(),
        getInfluencersUseCase: appLocator.get<GetInfluencersUseCase>(),
        observeInfluencersUseCase: appLocator.get<ObserveInfluencersUseCase>(),
        filterInfluencersUseCase: appLocator.get<FilterInfluencersUseCase>(),
        saveInfluencersUseCase: appLocator<SaveInfluencersUseCase>(),
      ),
      child: BlocBuilder<InfluencersBloc, InfluencersState>(
          builder: (BuildContext context, InfluencersState state) {
        return FilterForm(state.influencerList);
      }),
    );
  }
}
