import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/di/data_di.dart';
import 'package:fleeque/app/fleeque.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  dataDI.initDependencies();
  await appLocator<HiveProvider>().initHive();
  initNavigationDependencies();
  runApp(const Fleeque());
}
