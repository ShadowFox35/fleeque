import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:influencer/src/bloc/influencer_bloc.dart';

class InfluencerForm extends StatelessWidget {
  final List<InfluencerEntity> influencerList;

  const InfluencerForm(this.influencerList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InfluencersBloc, InfluencersState>(
          builder: (BuildContext context, InfluencersState state) {
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
                      Text(
                        AppConstants.influencerTitle,
                        style: AppFonts.title,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            ImagePaths.filterIcon,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: AppDimens.padding_20),
                            child: Text(
                              AppConstants.filter,
                              style: AppFonts.regularText,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  AppCarousel(
                    influencerList: state.influencerList,
                    carouselHeight: 0.30,
                    isDetailsShown: false,
                  ),
                  AppList(state.influencerList),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.padding_25),
                    alignment: Alignment.center,
                    width: AppDimens.size_340,
                    height: AppDimens.size_120,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(AppDimens.radius_10),
                    ),
                    child: Text(
                      AppConstants.influencerButtonText.toUpperCase(),
                      style: AppFonts.buttonBlack,
                      textAlign: TextAlign.center,
                    ),
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
