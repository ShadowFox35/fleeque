import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/src/ui/home_carousel_slide.dart';

class HomeCarousel extends StatelessWidget {
  final List<InfluencerEntity> influencerList;
  const HomeCarousel(this.influencerList, {super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: influencerList.length,
      options: CarouselOptions(
        enableInfiniteScroll: true,
        height: MediaQuery.of(context).size.height * 0.45,
      ),
      itemBuilder: (
        BuildContext context,
        int itemIndex,
        int pageViewIndex,
      ) =>
          HomeSlide(influencerList[itemIndex]),
    );
  }
}
