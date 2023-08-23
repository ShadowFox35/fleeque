import 'package:flutter/material.dart';

import 'package:core_ui/core_ui.dart';
import 'package:core/core.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.padding_20,
              vertical: AppDimens.padding_15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      ImagePaths.accountIcon,
                    ),
                    SizedBox(
                      width: AppDimens.size_135,
                      height: AppDimens.size_30,
                      child: Image.asset(
                        ImagePaths.logoImage,
                      ),
                    ),
                    SvgPicture.asset(
                      ImagePaths.informationIcon,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(bottom: AppDimens.padding_15),
                      child: Text(
                        AppConstants.welcome,
                        style: GoogleFonts.montserrat(
                                textStyle: AppFonts.bold_25)
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    SizedBox(
                      width: AppDimens.size_305,
                      height: AppDimens.size_60,
                      child: Image.asset(
                        ImagePaths.logoImage,
                      ),
                    ),
                  ],
                ),
                Text(
                  AppConstants.rights.toUpperCase(),
                  style: GoogleFonts.roboto(textStyle: AppFonts.normal_11)
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
