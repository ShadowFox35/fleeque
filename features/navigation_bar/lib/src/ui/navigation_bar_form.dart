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
          backgroundColor: AppColors.grey,
          selectedItemColor: AppColors.black,
          unselectedItemColor: AppColors.darkGrey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon:
                  Icon(Icons.bakery_dining_outlined, color: AppColors.black),
              icon: Icon(Icons.bakery_dining_outlined, color: Colors.grey),
              label: AppConstants.homeTitle,
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.favorite_border, color: AppColors.black),
              icon: Icon(Icons.favorite_border, color: Colors.grey),
              label: AppConstants.influencerTitle,
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.history_edu, color: AppColors.black),
              icon: Icon(Icons.history_edu, color: Colors.grey),
              label: AppConstants.aboutTitle,
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.settings, color: AppColors.black),
              icon: Icon(Icons.settings, color: Colors.grey),
              label: AppConstants.contactTitle,
            ),
          ],
        );
      },
    );
  }
}
