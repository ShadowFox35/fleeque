import 'package:flutter/widgets.dart';

class AuthService extends ChangeNotifier {
  bool _authenticated = false;
  bool get authenticated => _authenticated;
  set authenticated(bool value) {
    _authenticated = value;
    notifyListeners();
  }
}
