import 'package:core_ui/core_ui.dart';
import 'package:core/core.dart';

import 'package:flutter/material.dart';

class NavigationBarForm extends StatelessWidget {
  const NavigationBarForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const <PageRouteInfo>[
        HomeRoute(),
        InfluencerRoute(),
        AboutRoute(),
        ContactRoute(),
      ],
      animationDuration: Duration.zero,
      bottomNavigationBuilder: (BuildContext context, TabsRouter router) {
        return BottomNavigationBar(
          currentIndex: router.activeIndex,
          onTap: router.setActiveIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.black,
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(ImagePaths.homeActiveIcon),
                icon: SvgPicture.asset(ImagePaths.homeInactiveIcon),
                label: AppConstants.homeTitle),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(ImagePaths.influencerActiveIcon),
              icon: SvgPicture.asset(ImagePaths.influencerInactiveIcon),
              label: AppConstants.influencerTitle,
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(ImagePaths.aboutActiveIcon),
              icon: SvgPicture.asset(ImagePaths.aboutInactiveIcon),
              label: AppConstants.aboutTitle,
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(ImagePaths.contactInactiveIcon),
              icon: SvgPicture.asset(ImagePaths.contactInactiveIcon),
              label: AppConstants.contactTitle,
            ),
          ],
        );
      },
    );
  }
}
