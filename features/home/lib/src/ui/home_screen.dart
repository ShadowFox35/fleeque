import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.black,
          centerTitle: true,
          actions: const <Widget>[
            HomeAppBar(),
          ],
        ),
        body: const SafeArea(child: Text('Home')),
      ),
    );
  }
}
