/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

enum AuthErrorType implements _i1.SerializableModel {
  invalidEmailException,
  missingRequiredFieldException,
  userNotFoundException,
  accountNotActivatedException,
  accountSuspendedException,
  invalidCredentialsException,
  passwordMismatchException,
  invalidResetTokenException,
  resetTokenExpiredException,
  emailNotSentException,
  emailAlreadyExistsException,
  usernameAlreadyExistsException,
  failedToSendOtpException,
  emailAlreadyVerifiedException,
  otpNotSentException,
  invalidOTPException,
  otpExpiredException;

  static AuthErrorType fromJson(int index) {
    switch (index) {
      case 0:
        return invalidEmailException;
      case 1:
        return missingRequiredFieldException;
      case 2:
        return userNotFoundException;
      case 3:
        return accountNotActivatedException;
      case 4:
        return accountSuspendedException;
      case 5:
        return invalidCredentialsException;
      case 6:
        return passwordMismatchException;
      case 7:
        return invalidResetTokenException;
      case 8:
        return resetTokenExpiredException;
      case 9:
        return emailNotSentException;
      case 10:
        return emailAlreadyExistsException;
      case 11:
        return usernameAlreadyExistsException;
      case 12:
        return failedToSendOtpException;
      case 13:
        return emailAlreadyVerifiedException;
      case 14:
        return otpNotSentException;
      case 15:
        return invalidOTPException;
      case 16:
        return otpExpiredException;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "AuthErrorType"');
    }
  }

  @override
  int toJson() => index;
  @override
  String toString() => name;
}
