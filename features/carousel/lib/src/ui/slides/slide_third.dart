import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class SlideThird extends StatelessWidget {
  const SlideThird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppConstants.carouselTitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            textStyle: AppFonts.bold_24,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: AppDimens.padding_90),
          child: Text(
            AppConstants.carouselTextThird,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(textStyle: AppFonts.normal_16),
          ),
        ),
      ],
    );
  }
}
