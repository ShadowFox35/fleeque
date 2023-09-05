import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class LoginButton extends StatelessWidget {
  final String buttonText;

  const LoginButton({
    super.key,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimens.padding_40),
      width: AppDimens.size_235,
      height: AppDimens.size_60,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.black,
        ),
        borderRadius: BorderRadius.circular(AppDimens.radius_100),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.pink,
            AppColors.purple,
          ],
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Center(
        child: Text(
          buttonText.toUpperCase(),
          style: AppFonts.loginButton,
        ),
      ),
    );
  }
}
