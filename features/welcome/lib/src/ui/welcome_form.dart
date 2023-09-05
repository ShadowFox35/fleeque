import 'package:flutter/material.dart';

import 'package:core_ui/core_ui.dart';
import 'package:core/core.dart';

import 'package:welcome/src/bloc/welcome_bloc.dart';

class WelcomeForm extends StatelessWidget {
  const WelcomeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (BuildContext context, WelcomeState state) {
        return SafeArea(
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagePaths.welcomeImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(0.2),
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
                          margin: const EdgeInsets.only(
                            bottom: AppDimens.padding_15,
                          ),
                          child: Text(
                            AppConstants.welcome,
                            style: AppFonts.welcome.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
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
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<WelcomeBloc>(context).add(
                              GetStartedEvent(),
                            );
                          },
                          child: AppButton(
                            buttonText: AppConstants.getStarted,
                            buttonColor: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text(
                          AppConstants.rights.toUpperCase(),
                          style: AppFonts.rights
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
