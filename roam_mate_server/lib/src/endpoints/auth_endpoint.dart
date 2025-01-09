import 'package:bcrypt/bcrypt.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:email_validator/email_validator.dart';
import 'package:otp/otp.dart';
import 'package:roam_mate_server/src/generated/protocol.dart';
import 'package:roam_mate_server/src/utils/map_auth_exception_to_error_message.dart';

import 'package:serverpod/serverpod.dart';

class AuthEndpoint extends Endpoint {
  Future<User> createAccount(
    Session session,
    String email,
    String password,
    String username,
    String scope,
  ) async {
    try {
      var user = await User.db.findFirstRow(
        session,
        where: (userTable) => userTable.username.equals(username),
      );

      if (user != null && user.verified) {
        throw AuthException(
          errorType: AuthErrorType.usernameAlreadyExistsException,
          message:
              authTypeToMessage[AuthErrorType.usernameAlreadyExistsException],
        );
      }

      user = await User.db.findFirstRow(
        session,
        where: (t) => t.email.equals(email),
      );

      if (user != null && user.verified) {
        throw AuthException(
          errorType: AuthErrorType.emailAlreadyExistsException,
          message: authTypeToMessage[AuthErrorType.emailAlreadyExistsException],
        );
      }

      if (user != null && !user.verified) {
        await _sendOtpVerificationCode(session: session, email: email);
        throw AuthException(
          errorType: AuthErrorType.accountNotActivatedException,
          message:
              authTypeToMessage[AuthErrorType.accountNotActivatedException],
        );
      }

      if (!EmailValidator.validate(email)) {
        throw AuthException(
          errorType: AuthErrorType.invalidEmailException,
          message: authTypeToMessage[AuthErrorType.invalidEmailException],
        );
      }

      final String hashPassword = BCrypt.hashpw(password, BCrypt.gensalt());
      User newUser;

      if (user != null) {
        newUser = user.copyWith(password: hashPassword);
        await User.db.updateRow(session, newUser);
      } else {
        newUser = User(
          scope: scope,
          username: username,
          password: hashPassword,
          email: email,
          verified: false,
        );

        newUser = await User.db.insertRow(session, newUser);
      }

      await _sendOtpVerificationCode(email: email, session: session);
      return newUser;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> _checkIfUserIsVerified({
    required String email,
    required Session session,
  }) async {
    final user = await User.db
        .findFirstRow(session, where: (t) => t.email.equals(email));
    if (user == null) {
      throw AuthException(
        errorType: AuthErrorType.userNotFoundException,
        message: authTypeToMessage[AuthErrorType.userNotFoundException],
      );
    }

    return user.verified;
  }

  Future<User?> getSignedInUser(Session session) async {
    final signedInUser = await session.authenticated;
    print(signedInUser);
    if (signedInUser != null) {
      return await User.db.findById(session, signedInUser.userId);
    }
    return null;
  }

  Future<bool> _validateOtp({
    required Session session,
    required String email,
    required String otp,
  }) async {
    final otpVerification = await OtpVerification.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email),
    );

    if (otpVerification == null) {
      throw AuthException(
        errorType: AuthErrorType.otpNotSentException,
        message: authTypeToMessage[AuthErrorType.otpNotSentException],
      );
    }

    final otherOtp = OTP.generateTOTPCodeString(
      otpVerification.secret,
      DateTime.now().millisecondsSinceEpoch,
      interval: Duration(minutes: 30).inSeconds,
      length: 6,
    );

    print("OTP REMAINING SECONDS: ${OTP.remainingSeconds()}");
    print("OTP TIME LEFT ${OTP.lastUsedTime}");

    final isValid = OTP.constantTimeVerification(otp, otherOtp);
    return isValid;
  }

  Future<LoginResponse> verifyOtp(
    Session session,
    String otp,
    String email,
  ) async {
    if (await _checkIfUserIsVerified(email: email, session: session)) {
      throw AuthException(
        errorType: AuthErrorType.emailAlreadyVerifiedException,
        message: authTypeToMessage[AuthErrorType.emailAlreadyVerifiedException],
      );
    } else {
      if (await _validateOtp(session: session, email: email, otp: otp)) {
        var user = await User.db.findFirstRow(
          session,
          where: (t) => t.email.equals(email),
        );

        user = user!.copyWith(verified: true);
        user = await User.db.updateRow(session, user);

        final jwt = JWT(user.toJson());
        final token = jwt.sign(
          SecretKey(
              session.passwords["auth_secret"] ?? "roam_mate_auth_secret"),
        );

        session.updateAuthenticated(
          AuthenticationInfo(
            user.id!,
            {
              Scope(user.scope),
            },
            authId: token,
          ),
        );
        return LoginResponse(authToken: token, user: user);
      } else {
        throw AuthException(
          errorType: AuthErrorType.invalidOTPException,
          message: authTypeToMessage[AuthErrorType.invalidOTPException],
        );
      }
    }
  }

  Future<void> resendOtp(Session session, String email) async {
    await OtpVerification.db.deleteWhere(
      session,
      where: (t) => t.email.equals(email),
    );
    await _sendOtpVerificationCode(session: session, email: email);
  }

  Future<bool> sendResetPasswordOtp(
    Session session,
    String email,
  ) async {
    await _checkIfUserIsVerified(email: email, session: session);
    await _sendOtpVerificationCode(session: session, email: email);
    return true;
  }

  Future<bool> resetPassword(
    Session session,
    String email,
    String otp,
    String newPassword,
  ) async {
    if (await _validateOtp(
      session: session,
      email: email,
      otp: otp,
    )) {
      final user = await User.db
          .findFirstRow(session, where: (t) => t.email.equals(email));

      if (user == null) {
        throw AuthException(
          errorType: AuthErrorType.userNotFoundException,
          message: authTypeToMessage[AuthErrorType.userNotFoundException],
        );
      }

      final String hashPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
      final newUser = user.copyWith(password: hashPassword);
      await User.db.updateRow(session, newUser);
      return true;
    } else {
      return false;
    }
  }

  Future<LoginResponse> login(
    Session session,
    String email,
    String password,
  ) async {
    final user = await User.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email),
    );

    if (user == null) {
      throw AuthException(
        errorType: AuthErrorType.userNotFoundException,
        message: authTypeToMessage[AuthErrorType.userNotFoundException],
      );
    }

    if (!user.verified) {
      await _sendOtpVerificationCode(session: session, email: email);
      throw AuthException(
        errorType: AuthErrorType.accountNotActivatedException,
        message: authTypeToMessage[AuthErrorType.accountNotActivatedException],
      );
    }

    final bool checkPassword = BCrypt.checkpw(password, user.password!);
    if (!checkPassword) {
      throw AuthException(
        errorType: AuthErrorType.invalidCredentialsException,
        message: authTypeToMessage[AuthErrorType.invalidCredentialsException],
      );
    } else {
      final jwt = JWT(user.toJson());
      final token = jwt.sign(
        SecretKey(session.passwords["auth_secret"] ?? "roam_mate_auth_secret"),
      );

      session.updateAuthenticated(AuthenticationInfo(user.id!, {
        Scope(user.scope),
      }));
      return LoginResponse(authToken: token, user: user);
    }
  }

  Future<void> _sendOtpVerificationCode({
    required Session session,
    required String email,
  }) async {
    try {
      if (!EmailValidator.validate(email)) {
        throw AuthException(
          errorType: AuthErrorType.invalidEmailException,
          message: authTypeToMessage[AuthErrorType.invalidEmailException],
        );
      }

      await OtpVerification.db.deleteWhere(
        session,
        where: (t) => t.email.equals(email),
      );

      final secret = OTP.randomSecret();

      final otp = OTP.generateTOTPCodeString(
        secret,
        DateTime.now().millisecondsSinceEpoch,
        length: 6,
        interval: Duration(minutes: 30).inSeconds,
      );

      await OtpVerification.db.insertRow(
        session,
        OtpVerification(secret: secret, email: email),
      );

      print("SENT OTP CODE: $otp");
    } catch (e) {
      if (e is AuthException) {
        rethrow;
      }
      throw AuthException(
        errorType: AuthErrorType.failedToSendOtpException,
        message: authTypeToMessage[AuthErrorType.failedToSendOtpException],
      );
    }
  }

  Future<bool> logout(Session session, int userId) async {
    final authenticated = await session.authenticated;
    if (authenticated != null && authenticated.userId == userId) {
      session.updateAuthenticated(null);
    }
    return true;
  }
}
