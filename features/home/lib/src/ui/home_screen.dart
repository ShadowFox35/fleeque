import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:home/src/bloc/home_bloc.dart';
import 'package:home/src/ui/home_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBloc(
        getInfluencersUseCase: appLocator.get<GetInfluencersUseCase>(),
        saveInfluencersUseCase: appLocator<SaveInfluencersUseCase>(),
      ),
      child: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, HomeState state) {
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
              actions: <Widget>[
                HomeAppBar(),
              ],
            ),
            body: HomeForm(state.influencerList),
          ),
        );
      }),
    );
  }
}
