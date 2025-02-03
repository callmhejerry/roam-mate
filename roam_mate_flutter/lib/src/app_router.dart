import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/auth_bloc/auth_state.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/screens/sign_up_screen.dart';
import 'package:roam_mate_flutter/src/features/authentication/routes.dart';
import 'package:roam_mate_flutter/src/features/dashboard/presentation/screens/home_screen.dart';
import 'package:roam_mate_flutter/src/features/dashboard/presentation/screens/property_details_screen.dart';
import 'package:roam_mate_flutter/src/features/dashboard/presentation/screens/property_listing_screen.dart';
import 'package:roam_mate_flutter/src/features/dashboard/presentation/screens/room_details_screen.dart';
import 'package:roam_mate_flutter/src/features/dashboard/presentation/screens/search_screen.dart';
import 'package:roam_mate_flutter/src/features/room/presentation/screen/add_room_screen.dart';

class AppRouter {
  static final rootNavigator = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: rootNavigator,
    initialLocation: PropertyListingScreen.path,
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
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) =>
            NoTransitionPage(child: HomeScreen(child: child)),
        routes: [
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: PropertyListingScreen.path,
            name: PropertyListingScreen.name,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: PropertyListingScreen(),
              );
            },
            routes: [
              GoRoute(
                path: PropertyDetailsScreen.path,
                name: PropertyDetailsScreen.name,
                parentNavigatorKey: rootNavigator,
                builder: (context, state) => PropertyDetailsScreen(),
              ),
              GoRoute(
                path: RoomDetailsScreen.path,
                name: RoomDetailsScreen.name,
                parentNavigatorKey: rootNavigator,
                builder: (context, state) => RoomDetailsScreen(),
              ),
            ],
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: SearchScreen.path,
            name: SearchScreen.name,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: SearchScreen(),
              );
            },
          ),
        ],
      ),
      ...AuthRoutes.routes,
      GoRoute(
        path: AddRoomScreen.path,
        name: AddRoomScreen.name,
        builder: (context, state) => AddRoomScreen(),
      ),
    ],
  );
}
