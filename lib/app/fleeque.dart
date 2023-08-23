import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class Fleeque extends StatefulWidget {
  const Fleeque({super.key});

  @override
  State<Fleeque> createState() => _FleequeState();
}

class _FleequeState extends State<Fleeque> {
  final _appRouter = appLocator.get<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: AppTheme.light);
  }
}
