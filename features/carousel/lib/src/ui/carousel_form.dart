import 'package:carousel/src/bloc/carousel_bloc.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core/core.dart';

class CarouselForm extends StatefulWidget {
  const CarouselForm({super.key});

  static List<SlideContent> slides = [
    SlideContent(description: AppConstants.carouselTextFirst),
    SlideContent(description: AppConstants.carouselTextSecond),
    SlideContent(description: AppConstants.carouselTextThird),
  ];

  @override
  State<CarouselForm> createState() => _CarouselFormState();
}

class SlideContent {
  final String description;

  SlideContent({
    required this.description,
  });
}

class _CarouselFormState extends State<CarouselForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CarouselBloc, CarouselState>(
          builder: (BuildContext context, CarouselState state) {
        return SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                height: 500.0,
              ),
              items: CarouselForm.slides.map((SlideContent elem) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppConstants.title,
                          textAlign: TextAlign.center,
                          style: AppFonts.title,
                        ),
                        Text(
                          elem.description,
                          textAlign: TextAlign.center,
                          style: AppFonts.regularText,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for (int i = 0; i < CarouselForm.slides.length; i++)
                              (i == CarouselForm.slides.indexOf(elem)
                                  ? const CircleBar(isActive: true)
                                  : const CircleBar(isActive: false))
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<CarouselBloc>(context).add(
                              NavigateToSignInEvent(),
                            );
                          },
                          child: Text(
                            CarouselForm.slides.indexOf(elem) ==
                                    CarouselForm.slides.length - 1
                                ? AppConstants.done.toUpperCase()
                                : AppConstants.skip.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: AppFonts.skipText,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
          ),
        );
      }),
    );
  }
}
