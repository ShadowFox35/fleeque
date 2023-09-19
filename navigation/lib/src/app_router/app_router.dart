import 'package:authorization/authorization.dart';
import 'package:auto_route/auto_route.dart';
import 'package:profile/profile.dart';
import 'package:settings/settings.dart';

import 'package:welcome/welcome.dart';
import 'package:carousel/carousel.dart';
import 'package:navigation_bar/navigation_bar.dart';
import 'package:influencer/influencer.dart';
import 'package:home/home.dart';
import 'package:contact/contact.dart';
import 'package:about/about.dart';
import 'package:splash/splash.dart';

import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreen,
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: WelcomeScreen,
      path: 'welcome',
      initial: true,
    ),
    AutoRoute(
      page: CarouselScreen,
      path: 'carousel',
    ),
    AutoRoute(
      page: SignInScreen,
      path: 'sign_in',
    ),
    AutoRoute(
      page: SignUpScreen,
      path: 'sign_up',
    ),
    AutoRoute(
      page: AuthorizationScreen,
      path: 'sign_up',
    ),
    AutoRoute(
      page: FilterScreen,
      path: 'filter',
    ),
    AutoRoute(
      page: SettingsScreen,
      path: 'settings',
    ),
    AutoRoute(
      page: ProfileScreen,
      path: 'profile',
    ),
    AutoRoute(
      page: NavigationBarScreen,
      path: 'navigation_bar',
      children: [
        AutoRoute(
          page: HomeScreen,
          path: 'home',
          initial: true,
        ),
        AutoRoute(
          page: InfluencerScreen,
          path: 'influencer',
        ),
        AutoRoute(
          page: AboutScreen,
          path: 'about',
        ),
        AutoRoute(
          page: ContactScreen,
          path: 'contact',
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
