import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:home/src/bloc/home_bloc.dart';

class HomeForm extends StatelessWidget {
  final List<InfluencerEntity> influencerList;

  const HomeForm(this.influencerList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, HomeState state) {
        return SafeArea(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.padding_25,
              vertical: AppDimens.padding_15,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(AppDimens.padding_10),
                        width: AppDimens.size_100,
                        height: AppDimens.size_35,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius:
                              BorderRadius.circular(AppDimens.radius_100),
                        ),
                        child: Text(
                          AppConstants.popular.toUpperCase(),
                          style: AppFonts.homePopular,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        AppConstants.swipeToExplore,
                        style: AppFonts.regularText,
                      ),
                    ],
                  ),
                  AppCarousel(
                    influencerList: state.influencerList,
                    carouselHeight: 0.45,
                    isDetailsShown: true,
                  ),
                  AppList(state.influencerList),
                  AppButton(
                    buttonColor: AppColors.black,
                    buttonWidth: AppDimens.size_340,
                    buttonText: AppConstants.homeButtonText,
                    buttonTextColor: AppFonts.buttonBlack,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
