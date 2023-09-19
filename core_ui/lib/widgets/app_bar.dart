import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  final _appRouter = appLocator.get<AppRouter>();
  HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: <Widget>[
                  IconButton(
                    color: Theme.of(context).primaryColor,
                    iconSize: AppDimens.size_25,
                    icon: SvgPicture.asset(ImagePaths.accountOnlineIcon),
                    onPressed: () => _appRouter.push(const ProfileRoute()),
                  ),
                  Positioned(
                    top: AppDimens.padding_28,
                    left: AppDimens.padding_28,
                    child: Container(
                      width: AppDimens.size_6,
                      height: AppDimens.size_6,
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        border: Border.all(
                          color: AppColors.white,
                        ),
                        borderRadius:
                            BorderRadius.circular(AppDimens.radius_10),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(AppDimens.padding_5),
                width: AppDimens.size_30,
                height: AppDimens.size_20,
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(AppDimens.radius_10),
                ),
                child: Text(
                  AppConstants.percent,
                  style: AppFonts.labelTextWhite,
                ),
              ),
            ],
          ),
          SizedBox(
            width: AppDimens.size_135,
            height: AppDimens.size_30,
            child: Image.asset(
              ImagePaths.appBarTitle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                child: SvgPicture.asset(
                  ImagePaths.walletIcon,
                ),
                onTap: () => {null},
              ),
              IconButton(
                icon: SvgPicture.asset(
                  ImagePaths.informationIcon,
                ),
                onPressed: () => {null},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
