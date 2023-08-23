// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const WelcomeScreen(),
      );
    },
    CarouselRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CarouselScreen(),
      );
    },
    NavigationBarRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const NavigationBarScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    InfluencerRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const InfluencerScreen(),
      );
    },
    AboutRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AboutScreen(),
      );
    },
    ContactRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ContactScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          WelcomeRoute.name,
          path: '/',
        ),
        RouteConfig(
          CarouselRoute.name,
          path: 'carousel',
        ),
        RouteConfig(
          NavigationBarRoute.name,
          path: 'navigation_bar',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: NavigationBarRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: NavigationBarRoute.name,
            ),
            RouteConfig(
              InfluencerRoute.name,
              path: 'influencer',
              parent: NavigationBarRoute.name,
            ),
            RouteConfig(
              AboutRoute.name,
              path: 'about',
              parent: NavigationBarRoute.name,
            ),
            RouteConfig(
              ContactRoute.name,
              path: 'contact',
              parent: NavigationBarRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '/',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [CarouselScreen]
class CarouselRoute extends PageRouteInfo<void> {
  const CarouselRoute()
      : super(
          CarouselRoute.name,
          path: 'carousel',
        );

  static const String name = 'CarouselRoute';
}

/// generated route for
/// [NavigationBarScreen]
class NavigationBarRoute extends PageRouteInfo<void> {
  const NavigationBarRoute({List<PageRouteInfo>? children})
      : super(
          NavigationBarRoute.name,
          path: 'navigation_bar',
          initialChildren: children,
        );

  static const String name = 'NavigationBarRoute';
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [InfluencerScreen]
class InfluencerRoute extends PageRouteInfo<void> {
  const InfluencerRoute()
      : super(
          InfluencerRoute.name,
          path: 'influencer',
        );

  static const String name = 'InfluencerRoute';
}

/// generated route for
/// [AboutScreen]
class AboutRoute extends PageRouteInfo<void> {
  const AboutRoute()
      : super(
          AboutRoute.name,
          path: 'about',
        );

  static const String name = 'AboutRoute';
}

/// generated route for
/// [ContactScreen]
class ContactRoute extends PageRouteInfo<void> {
  const ContactRoute()
      : super(
          ContactRoute.name,
          path: 'contact',
        );

  static const String name = 'ContactRoute';
}
