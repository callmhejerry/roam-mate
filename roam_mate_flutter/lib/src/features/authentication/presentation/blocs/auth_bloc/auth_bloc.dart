import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roam_mate_flutter/src/app_router.dart';
import 'package:roam_mate_flutter/src/features/authentication/domain/entity/user_entity.dart';
import 'package:roam_mate_flutter/src/features/authentication/domain/i_auth_repository.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/screens/sign_up_screen.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  IAuthRepository authRepository;
  StreamSubscription<UserEntity?>? authSubscription;
  AuthBloc({required this.authRepository})
      : super(AuthState(authStatus: AuthStatus.unknown, user: null)) {
    authSubscription = authRepository.authStream.listen((user) {
      if (user == null) {
        add(AuthLogOutEvent());
      } else {
        add(AuthLoginEvent(loggedInUser: user));
      }
    });

    on<AuthGetUserEvent>((event, emit) {
      final user = authRepository.getSignedInUser;
      if (user == null) {
        add(AuthLogOutEvent());
      } else {
        add(AuthLoginEvent(loggedInUser: user));
      }
    });

    on<AuthLoginEvent>((event, emit) {
      emit(
        AuthState(
          authStatus: AuthStatus.authenticated,
          user: event.loggedInUser,
        ),
      );
      AppRouter.router.go("/");
    });

    on<AuthLogOutEvent>(
      (event, emit) {
        emit(AuthState(authStatus: AuthStatus.unauthenticated, user: null));
        AppRouter.router.go(SignUpScreen.path);
      },
    );
  }

  @override
  Future<void> close() async {
    super.close();
    authSubscription?.cancel();
  }
}
