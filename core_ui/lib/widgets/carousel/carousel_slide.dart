import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class InfluencersSlide extends StatelessWidget {
  final InfluencerEntity influencer;
  final bool isDetailsShown;

  const InfluencersSlide({
    Key? key,
    required this.influencer,
    required this.isDetailsShown,
  }) : super(key: key);

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
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: AppDimens.padding_15),
                child: Text(
                  influencer.name,
                  textAlign: TextAlign.center,
                  style: AppFonts.titleWhite,
                ),
              ),
              Visibility(
                  visible: isDetailsShown,
                  child: Column(
                    children: [
                      Text(
                        '${influencer.followers} followers'.toUpperCase(),
                        style: AppFonts.homePopular,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: AppDimens.padding_15),
                        child: Text(
                          '${influencer.posts.toString()} posts'.toUpperCase(),
                          style: AppFonts.homePopular,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
