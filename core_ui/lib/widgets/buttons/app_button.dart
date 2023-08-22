import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class AppButton extends StatelessWidget {
  final String buttonText; // Параметр для хранения текста кнопки

  const AppButton({Key? key, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimens.padding_40),
      width: AppDimens.size_250,
      height: AppDimens.size_60,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(AppDimens.radius_100),
      ),
      child: Center(
        child: Text(
          buttonText.toUpperCase(),
          style: GoogleFonts.roboto(textStyle: AppFonts.normal_12),
        ),
      ),
    );
  }
}
