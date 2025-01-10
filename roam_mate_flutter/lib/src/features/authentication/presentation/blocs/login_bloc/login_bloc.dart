import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roam_mate_client/roam_mate_client.dart';
import 'package:roam_mate_flutter/src/app_router.dart';
import 'package:roam_mate_flutter/src/features/authentication/domain/i_auth_repository.dart';
import 'package:roam_mate_flutter/src/utils/app_snack_bar.dart';
import 'package:roam_mate_flutter/src/utils/delayed_result.dart';
import 'package:roam_mate_flutter/src/utils/error_message_mixin.dart';

import '../../screens/email_verification_screen.dart';
import 'login_state.dart';

class LoginBloc extends Cubit<LoginState> with ErrorMessageMixin {
  final IAuthRepository authRepository;

  LoginBloc({required this.authRepository})
      : super(LoginState(loginResult: DelayedResult.idle()));

  Future<void> login({required String email, required String password}) async {
    if (state.loginResult.isLoading) return;
    try {
      emit(state.copyWith(loginResult: DelayedResult.loading()));
      final user = await authRepository.login(email: email, password: password);
      emit(state.copyWith(loginResult: DelayedResult.fromValue(value: user)));
    } on AuthException catch (e) {
      emit(
        state.copyWith(
          loginResult: DelayedResult.error(
            errorMessage: errorMessage(e),
            error: e,
          ),
        ),
      );
      if (e.errorType == AuthErrorType.accountNotActivatedException) {
        AppRouter.router.goNamed(EmailVerificationScreen.name, pathParameters: {
          "email": email,
        });
        return;
      }
      AppSnackBar.showSnackBar(
        message: e.message,
        snackBarType: SnackBarType.error,
      );
    } catch (e) {
      AppSnackBar.showSnackBar(
        message: errorMessage(e),
        snackBarType: SnackBarType.error,
      );
      emit(
        state.copyWith(
          loginResult: DelayedResult.error(
            errorMessage: errorMessage(e),
            error: e,
          ),
        ),
      );
    }
  }
}
