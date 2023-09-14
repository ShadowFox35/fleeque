import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isWhite;

  const InputField(
      {Key? key,
      required this.labelText,
      required this.controller,
      this.isWhite = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: isWhite ? AppColors.white : AppColors.black,
      ),
      cursorColor: isWhite ? AppColors.white : AppColors.pink,
      decoration: InputDecoration(
        labelText: labelText.toUpperCase(),
        labelStyle: isWhite ? AppFonts.labelTextWhite : AppFonts.labelText,
        enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: isWhite ? AppColors.white : AppColors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: isWhite ? AppColors.white : AppColors.pink),
        ),
      ),
      controller: controller,
    );
  }
}
