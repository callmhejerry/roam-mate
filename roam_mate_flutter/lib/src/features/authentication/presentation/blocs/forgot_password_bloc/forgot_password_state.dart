import 'package:roam_mate_flutter/src/utils/delayed_result.dart';

class ForgotPasswordState {
  final DelayedResult<bool> initiatePasswordResetResult;
  final DelayedResult<bool> resetPasswordResult;

  const ForgotPasswordState({
    required this.initiatePasswordResetResult,
    required this.resetPasswordResult,
  });

  ForgotPasswordState copyWith({
    DelayedResult<bool>? initiatePasswordResetResult,
    DelayedResult<bool>? resetPasswordResult,
  }) {
    return ForgotPasswordState(
      initiatePasswordResetResult:
          initiatePasswordResetResult ?? this.initiatePasswordResetResult,
      resetPasswordResult: resetPasswordResult ?? this.resetPasswordResult,
    );
  }
}
