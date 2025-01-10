import 'package:roam_mate_flutter/src/features/authentication/domain/entity/user_entity.dart';
import 'package:roam_mate_flutter/src/utils/delayed_result.dart';

class LoginState {
  final DelayedResult<UserEntity> loginResult;
  const LoginState({required this.loginResult});

  LoginState copyWith({
    DelayedResult<UserEntity>? loginResult,
  }) {
    return LoginState(loginResult: loginResult ?? this.loginResult);
  }
}
