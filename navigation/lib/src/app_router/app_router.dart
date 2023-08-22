import 'package:auto_route/auto_route.dart';

import 'package:welcome/welcome.dart';

import 'package:navigation_bar/navigation_bar.dart';
import 'package:influencer/influencer.dart';
import 'package:home/home.dart';
import 'package:contact/contact.dart';
import 'package:about/about.dart';

import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: WelcomeScreen,
      path: '/',
      initial: true,
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
