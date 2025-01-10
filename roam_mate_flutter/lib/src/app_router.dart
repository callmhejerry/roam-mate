import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/auth_bloc/auth_state.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/screens/sign_up_screen.dart';
import 'package:roam_mate_flutter/src/features/authentication/routes.dart';
import 'package:roam_mate_flutter/src/features/dashboard/presentation/screens/home_screen.dart';

class AppRouter {
  static final rootNavigator = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: rootNavigator,
    initialLocation: HomeScreen.path,
    redirect: (context, state) {
      final authState = context.read<AuthBloc>().state;

      if (authState.authStatus == AuthStatus.authenticated) {
        return null;
      } else {
        if (state.matchedLocation.contains("auth")) {
          return null;
        }
        return SignUpScreen.path;
      }
    },
    routes: [
      GoRoute(
        path: HomeScreen.path,
        name: HomeScreen.name,
        builder: (context, state) {
          return HomeScreen();
        },
      ),
      ...AuthRoutes.routes,
    ],
  );
}
