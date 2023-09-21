import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final double buttonWidth;
  final Color buttonColor;
  final bool isBordered;
  final TextStyle buttonFontStyle;

  const AppButton(
      {Key? key,
      required this.buttonText,
      required this.buttonWidth,
      required this.buttonColor,
      required this.buttonFontStyle,
      this.isBordered = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double marginValue = screenHeight * 0.01;

    return Container(
      margin: EdgeInsets.symmetric(vertical: marginValue),
      width: buttonWidth,
      height: AppDimens.size_60,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(AppDimens.radius_100),
        border: Border.all(
          color: isBordered ? buttonFontStyle.color! : buttonColor,
        ),
      ),
      child: Center(
        child: Text(
          buttonText.toUpperCase(),
          style: buttonFontStyle,
        ),
      ),
    );
  }
}
