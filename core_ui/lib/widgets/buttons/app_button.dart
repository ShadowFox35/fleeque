import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final double buttonWidth;
  final Color buttonColor;
  final TextStyle buttonTextColor;

  const AppButton(
      {Key? key,
      required this.buttonText,
      required this.buttonWidth,
      required this.buttonColor,
      required this.buttonTextColor})
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
      ),
      child: Center(
        child: Text(
          buttonText.toUpperCase(),
          style: buttonTextColor,
        ),
      ),
    );
  }
}
