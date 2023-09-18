import 'package:core/core.dart';
import 'package:core_ui/widgets/carousel/carousel_slide.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class AppCarousel extends StatelessWidget {
  final List<InfluencerEntity> influencerList;
  final double carouselHeight;
  final bool isDetailsShown;

  const AppCarousel({
    Key? key,
    required this.influencerList,
    required this.carouselHeight,
    required this.isDetailsShown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: influencerList.length,
      options: CarouselOptions(
        enableInfiniteScroll: true,
        height: MediaQuery.of(context).size.height * carouselHeight,
      ),
      itemBuilder: (
        BuildContext context,
        int itemIndex,
        int pageViewIndex,
      ) =>
          InfluencersSlide(
        influencer: influencerList[itemIndex],
        isDetailsShown: isDetailsShown,
      ),
    );
  }
}
