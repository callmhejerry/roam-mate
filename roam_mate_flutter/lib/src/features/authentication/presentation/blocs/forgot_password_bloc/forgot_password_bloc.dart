import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roam_mate_client/roam_mate_client.dart';
import 'package:roam_mate_flutter/src/app_router.dart';
import 'package:roam_mate_flutter/src/features/authentication/domain/i_auth_repository.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:roam_mate_flutter/src/utils/app_snack_bar.dart';
import 'package:roam_mate_flutter/src/utils/delayed_result.dart';
import 'package:roam_mate_flutter/src/utils/error_message_mixin.dart';

import '../../screens/reset_password_screen.dart';
import 'forgot_password_state.dart';

class ForgotPasswordBloc extends Cubit<ForgotPasswordState>
    with ErrorMessageMixin {
  final IAuthRepository authRepository;
  ForgotPasswordBloc({required this.authRepository})
      : super(ForgotPasswordState(
          initiatePasswordResetResult: DelayedResult.idle(),
          resetPasswordResult: DelayedResult.idle(),
        ));

  Future<void> initiatePasswordReset({
    required String email,
  }) async {
    if (state.initiatePasswordResetResult.isLoading) return;
    try {
      emit(
          state.copyWith(initiatePasswordResetResult: DelayedResult.loading()));
      final result = await authRepository.initiateResetPassword(email: email);
      emit(state.copyWith(
        initiatePasswordResetResult: DelayedResult.fromValue(value: result),
      ));
      AppRouter.router.pushNamed(
        ResetPasswordScreen.name,
        queryParameters: {
          "email": email,
        },
      );
    } on AuthException catch (e) {
      emit(
        state.copyWith(
          initiatePasswordResetResult:
              DelayedResult.error(errorMessage: e.message, error: e),
        ),
      );
      AppSnackBar.showSnackBar(
        message: e.message,
        snackBarType: SnackBarType.error,
      );
    } catch (e) {
      emit(
        state.copyWith(
          initiatePasswordResetResult:
              DelayedResult.error(errorMessage: errorMessage(e), error: e),
        ),
      );
      AppSnackBar.showSnackBar(
        message: errorMessage(e),
        snackBarType: SnackBarType.error,
      );
    }
  }

  Future<void> resetPassword({
    required String email,
    required String newPassword,
    required String otp,
  }) async {
    if (state.resetPasswordResult.isLoading) return;

    try {
      emit(state.copyWith(resetPasswordResult: DelayedResult.loading()));
      final result = await authRepository.resetPassword(
        password: newPassword,
        email: email,
        verificationCode: otp,
      );
      emit(
        state.copyWith(
          resetPasswordResult: DelayedResult.fromValue(value: result),
        ),
      );

      AppSnackBar.showSnackBar(
        message: "Password reset successfully, login with your new password!",
        snackBarType: SnackBarType.success,
      );
      AppRouter.router.goNamed(LoginScreen.name);
    } on AuthException catch (e) {
      emit(
        state.copyWith(
          resetPasswordResult:
              DelayedResult.error(errorMessage: e.message, error: e),
        ),
      );
      AppSnackBar.showSnackBar(
        message: e.message,
        snackBarType: SnackBarType.error,
      );
    } catch (e) {
      emit(
        state.copyWith(
          initiatePasswordResetResult:
              DelayedResult.error(errorMessage: errorMessage(e), error: e),
        ),
      );
      AppSnackBar.showSnackBar(
        message: errorMessage(e),
        snackBarType: SnackBarType.error,
      );
    }
  }
}
