import 'package:flutter/material.dart';
import 'package:roam_mate_flutter/src/app_router.dart';

enum SnackBarType { error, success, warning, info }

class AppSnackBar {
  static showSnackBar(
      {required String message, required SnackBarType snackBarType}) {
    if (AppRouter.rootNavigator.currentContext != null) {
      final bgColor = switch (snackBarType) {
        SnackBarType.error => Colors.red,
        SnackBarType.success => Colors.green,
        SnackBarType.warning => Colors.amber,
        _ => Colors.black
      };

      ScaffoldMessenger.of(AppRouter.rootNavigator.currentContext!)
          .showSnackBar(
        SnackBar(
          content: Text(message),
          showCloseIcon: true,
          backgroundColor: bgColor,
        ),
      );
    }
  }
}
