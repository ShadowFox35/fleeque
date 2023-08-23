import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CircleBar extends StatelessWidget {
  final bool isActive;

  const CircleBar({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.padding_5),
      height: AppDimens.size_6,
      width: AppDimens.size_6,
      decoration: BoxDecoration(
        color: isActive ? AppColors.black : AppColors.grey,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimens.radius_10),
        ),
      ),
    );
  }
}
