import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  const InputField({
    Key? key,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: AppDimens.padding_25,
      ),
      child: TextField(
        cursorColor: AppColors.pink,
        decoration: InputDecoration(
          labelText: labelText.toUpperCase(),
          labelStyle: AppFonts.labelText,
        ),
        controller: controller,
      ),
    );
  }
}
