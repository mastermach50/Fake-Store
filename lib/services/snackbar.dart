import 'package:flutter/material.dart';

class SnackBarService {
  static final SnackBarService _instance = SnackBarService._internal();
  factory SnackBarService() => _instance;
  SnackBarService._internal();

  // Global key for the ScaffoldMessenger
  static final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void showSnackBar(String message) {
    if (messengerKey.currentState != null) {
      hideSnackBar();
      messengerKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: 'DISMISS',
            textColor: Colors.yellow,
            onPressed: () {
              messengerKey.currentState?.hideCurrentSnackBar();
            },
          ),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  void hideSnackBar() {
    if (messengerKey.currentState != null) {
      messengerKey.currentState!.hideCurrentSnackBar();
    }
  }
}
