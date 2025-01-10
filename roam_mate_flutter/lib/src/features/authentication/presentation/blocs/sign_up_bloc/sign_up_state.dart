import 'package:roam_mate_flutter/src/features/authentication/domain/entity/user_entity.dart';
import 'package:roam_mate_flutter/src/utils/delayed_result.dart';

class SignUpState {
  final DelayedResult<bool> signUpResult;
  final DelayedResult<bool> resendOtpResult;
  final DelayedResult<UserEntity?> verifyOtp;

  const SignUpState({
    required this.signUpResult,
    required this.resendOtpResult,
    required this.verifyOtp,
  });

  SignUpState copyWith({
    DelayedResult<bool>? signUpResult,
    DelayedResult<bool>? resendOtpResult,
    DelayedResult<UserEntity?>? verifyOtp,
  }) {
    return SignUpState(
      signUpResult: signUpResult ?? this.signUpResult,
      resendOtpResult: resendOtpResult ?? this.resendOtpResult,
      verifyOtp: verifyOtp ?? this.verifyOtp,
    );
  }
}
