import 'package:roam_mate_server/src/generated/protocol.dart';

final authTypeToMessage = <AuthErrorType, String>{
  AuthErrorType.emailAlreadyExistsException:
      "An account with this email already exists.",
  AuthErrorType.invalidEmailException: "The email address format is invalid",
  AuthErrorType.missingRequiredFieldException: "A required field is missing.",
  AuthErrorType.userNotFoundException:
      "No account found with the provided credentials.",
  AuthErrorType.accountNotActivatedException:
      "Your account is not yet activated. Please check your email to activate it.",
  AuthErrorType.accountSuspendedException:
      "Your account has been suspended. Contact support for assitance",
  AuthErrorType.invalidCredentialsException:
      "The email or password provided is incorrect",
  AuthErrorType.passwordMismatchException: "The passwords do not match",
  AuthErrorType.invalidResetTokenException:
      "The passowrd reset token is invalid.",
  AuthErrorType.resetTokenExpiredException:
      "The password reset token has expired",
  AuthErrorType.usernameAlreadyExistsException: "The username is already taken",
  AuthErrorType.failedToSendOtpException:
      "Failed to send otp to email, please try again",
  AuthErrorType.emailAlreadyVerifiedException: "The email is already verified.",
  AuthErrorType.otpNotSentException:
      "An OTP has not been sent to the provided email. Please request a new OTP.",
  AuthErrorType.invalidOTPException: "The provided OTP is incorrect.",
};
