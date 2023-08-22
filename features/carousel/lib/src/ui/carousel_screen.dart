import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:carousel/src/ui/slides/slides.dart';

import 'package:flutter/material.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.padding_20,
          ),
          child: PageView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              const Map sliders = {
                0: SlideFirst(),
                1: SlideSecond(),
                2: SlideThird(),
              };
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    sliders[index],
                    Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for (int i = 0; i < 3; i++)
                              (i == index
                                  ? const CircleBar(isActive: true)
                                  : const CircleBar(isActive: false))
                          ],
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(top: AppDimens.padding_25),
                          child: Text(
                            index == sliders.length - 1
                                ? AppConstants.done.toUpperCase()
                                : AppConstants.skip.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              textStyle: AppFonts.normal_16,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
