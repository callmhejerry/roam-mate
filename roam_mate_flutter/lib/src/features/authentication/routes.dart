import 'package:go_router/go_router.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/screens/email_verification_screen.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/screens/reset_password_screen.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/screens/sign_up_screen.dart';

class AuthRoutes {
  static final routes = [
    GoRoute(
      path: LoginScreen.path,
      name: LoginScreen.name,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: SignUpScreen.path,
      name: SignUpScreen.name,
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: ForgotPasswordScreen.path,
      name: ForgotPasswordScreen.name,
      builder: (context, state) => ForgotPasswordScreen(),
    ),
    GoRoute(
      path: EmailVerificationScreen.path,
      name: EmailVerificationScreen.name,
      builder: (context, state) {
        final email = state.pathParameters["email"]!;
        return EmailVerificationScreen(email: email);
      },
    ),
    GoRoute(
      path: ResetPasswordScreen.path,
      name: ResetPasswordScreen.name,
      builder: (context, state) {
        final email = state.uri.queryParameters["email"]!;
        return ResetPasswordScreen(email: email);
      },
    ),
  ];
}
