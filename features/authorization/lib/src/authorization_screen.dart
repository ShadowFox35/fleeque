import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AuthorizationScreen extends StatelessWidget {
  final String messageText;

  const AuthorizationScreen({Key? key, required this.messageText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                messageText,
                style: AppFonts.title,
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: const EdgeInsets.only(top: AppDimens.padding_20),
                  child: Text(
                    'Go back',
                    style: AppFonts.authTextRed,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
