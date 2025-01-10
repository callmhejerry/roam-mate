import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roam_mate_client/roam_mate_client.dart';
import 'package:roam_mate_flutter/src/app_router.dart';
import 'package:roam_mate_flutter/src/features/authentication/domain/i_auth_repository.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/screens/email_verification_screen.dart';
import 'package:roam_mate_flutter/src/utils/app_snack_bar.dart';
import 'package:roam_mate_flutter/src/utils/delayed_result.dart';
import 'package:roam_mate_flutter/src/utils/error_message_mixin.dart';

import 'sign_up_state.dart';

class SignUpBloc extends Cubit<SignUpState> with ErrorMessageMixin {
  IAuthRepository authRepository;
  SignUpBloc({required this.authRepository})
      : super(SignUpState(
          signUpResult: DelayedResult.idle(),
          resendOtpResult: DelayedResult.idle(),
          verifyOtp: DelayedResult.idle(),
        ));

  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    if (state.signUpResult.isLoading) return;
    try {
      emit(state.copyWith(signUpResult: DelayedResult.loading()));
      final result = await authRepository.createAccount(
        email: email,
        password: password,
        username: username,
      );
      emit(
        state.copyWith(
          signUpResult: DelayedResult.fromValue(value: result),
        ),
      );
      AppRouter.router.goNamed(EmailVerificationScreen.name, pathParameters: {
        "email": email,
      });
    } on AuthException catch (e) {
      emit(
        state.copyWith(
          signUpResult: DelayedResult.error(
            errorMessage: e.message,
            error: e,
          ),
        ),
      );
      if (e.errorType != AuthErrorType.accountNotActivatedException) {
        AppSnackBar.showSnackBar(
          message: e.message,
          snackBarType: SnackBarType.error,
        );
      } else {
        AppRouter.router.goNamed(EmailVerificationScreen.name, pathParameters: {
          "email": email,
        });
      }
    } catch (e) {
      AppSnackBar.showSnackBar(
        message: errorMessage(e),
        snackBarType: SnackBarType.error,
      );
      emit(state.copyWith(
        signUpResult:
            DelayedResult.error(errorMessage: errorMessage(e), error: e),
      ));
    }
  }

  Future<void> verifyEmail({
    required String email,
    required String otp,
  }) async {
    if (state.verifyOtp.isLoading) return;
    try {
      emit(state.copyWith(verifyOtp: DelayedResult.loading()));
      final result = await authRepository.verifiyAccount(
        email: email,
        verificationCode: otp,
      );
      emit(state.copyWith(
        verifyOtp: DelayedResult.fromValue(value: result),
      ));
    } on AuthException catch (e) {
      AppSnackBar.showSnackBar(
        message: e.message,
        snackBarType: SnackBarType.error,
      );
      emit(
        state.copyWith(
          verifyOtp: DelayedResult.error(
            errorMessage: e.message,
            error: e,
          ),
        ),
      );
    } catch (e) {
      AppSnackBar.showSnackBar(
        message: errorMessage(e),
        snackBarType: SnackBarType.error,
      );

      emit(
        state.copyWith(
          verifyOtp: DelayedResult.error(
            errorMessage: errorMessage(e),
            error: e,
          ),
        ),
      );
    }
  }
}
