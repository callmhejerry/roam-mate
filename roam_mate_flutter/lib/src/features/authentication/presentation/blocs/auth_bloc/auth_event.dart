import 'package:roam_mate_flutter/src/features/authentication/domain/entity/user_entity.dart';

sealed class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final UserEntity loggedInUser;
  AuthLoginEvent({required this.loggedInUser});
}

class AuthLogOutEvent extends AuthEvent {}

class AuthGetUserEvent extends AuthEvent {}
