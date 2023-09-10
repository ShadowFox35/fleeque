import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class HomeSlide extends StatelessWidget {
  final InfluencerEntity influencer;

  const HomeSlide(this.influencer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double marginValue = screenWidth * 0.05;

    return Container(
      width: screenWidth * 0.60,
      margin: EdgeInsets.symmetric(
        vertical: marginValue,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimens.radius_10),
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(influencer.image),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                influencer.name,
                textAlign: TextAlign.center,
                style: AppFonts.titleWhite,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: AppDimens.padding_15),
                child: Column(
                  children: [
                    Text(
                      '${influencer.followers} followers'.toUpperCase(),
                      style: AppFonts.homePopular,
                    ),
                    Text(
                      '${influencer.posts.toString()} posts'.toUpperCase(),
                      style: AppFonts.homePopular,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
