import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:influencer/src/bloc/influencer_bloc.dart';
import 'package:influencer/src/ui/influencer_form.dart';

class InfluencerScreen extends StatelessWidget {
  const InfluencerScreen({super.key});

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
        if (state.error != null) {}
        if (state.isLoading) {
          return Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
          );
        }
        return Center(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.black,
              centerTitle: true,
              actions: const <Widget>[
                HomeAppBar(),
              ],
            ),
            body: const InfluencerForm(),
          ),
        );
      }),
    );
  }
}
