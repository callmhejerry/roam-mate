import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/screens/sign_up_screen.dart';

class AppRouter {
  static final rootNavigator = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: rootNavigator,
    initialLocation: LoginScreen.path,
    routes: [
      GoRoute(
        path: LoginScreen.path,
        name: LoginScreen.name,
        builder: (context, state) {
          return LoginScreen();
        },
      ),
      GoRoute(
        path: SignUpScreen.path,
        name: SignUpScreen.name,
        builder: (context, state) {
          return SignUpScreen();
        },
      ),
    ],
  );
}
