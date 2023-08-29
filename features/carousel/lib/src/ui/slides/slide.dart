import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  final String description;

  const Slide({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppConstants.title,
          textAlign: TextAlign.center,
          style: AppFonts.title,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: AppFonts.regularText,
        ),
      ],
    );
  }
}
