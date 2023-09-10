import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class GoogleAuth extends StatelessWidget {
  const GoogleAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.padding_20,
      ),
      width: AppDimens.size_340,
      height: AppDimens.size_60,
      margin: const EdgeInsets.only(bottom: AppDimens.padding_25),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey,
        ),
        borderRadius: BorderRadius.circular(AppDimens.radius_10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Sign in with Google',
            style: AppFonts.singGoogleText,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: AppDimens.padding_20,
                ),
                height: AppDimens.size_35,
                width: 1,
                color: AppColors.grey,
              ),
              SvgPicture.asset(
                ImagePaths.googleIcon,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
