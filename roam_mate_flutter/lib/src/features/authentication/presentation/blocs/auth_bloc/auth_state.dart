import 'package:roam_mate_flutter/src/features/authentication/domain/entity/user_entity.dart';

enum AuthStatus { authenticated, unauthenticated, unknown }

class AuthState {
  final AuthStatus authStatus;
  final UserEntity? user;
  const AuthState({
    required this.authStatus,
    required this.user,
  });
}
