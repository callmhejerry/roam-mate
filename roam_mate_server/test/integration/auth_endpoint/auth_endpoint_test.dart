import 'package:roam_mate_server/src/generated/protocol.dart';
import 'package:roam_mate_server/src/utils/map_auth_exception_to_error_message.dart';
import 'package:test/test.dart';

import '../test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod("AuthEndpoint", (sessionBuilder, endpoints) async {
    final username = "jerressy";
    final email = "jerry@gmail.com";
    final password = "test123!";
    final scope = "student";
    late User user;

    group(
      "Login",
      () {
        setUp(() async {
          user = await endpoints.auth.createAccount(
            sessionBuilder,
            email,
            password,
            username,
            scope,
          );
          await User.db.updateRow(
            sessionBuilder.build(),
            user.copyWith(verified: true),
          );
        });

        tearDown(() async {
          await User.db.deleteRow(sessionBuilder.build(), user);
        });
        test(
          "Test that user logs in successfully with their email and password",
          () async {
            final user =
                await endpoints.auth.login(sessionBuilder, email, password);
            expect(user, isNotNull);
            expect(user.user.email, equals(email));
          },
        );

        test("Test with wrong email and password", () async {
          expect(
            () => endpoints.auth
                .login(sessionBuilder, "example@gmail.com", "password"),
            throwsA(
              isA<AuthException>()
                  .having(
                    (e) => e.errorType,
                    "Error type",
                    equals(AuthErrorType.userNotFoundException),
                  )
                  .having(
                    (e) => e.message,
                    "error message",
                    equals(
                      authTypeToMessage[AuthErrorType.userNotFoundException],
                    ),
                  ),
            ),
          );
        });

        test(
          "Test with right email and wrong password",
          () {
            expect(
              () => endpoints.auth.login(sessionBuilder, email, "password"),
              throwsA(
                isA<AuthException>()
                    .having(
                      (e) => e.errorType,
                      "error type",
                      equals(AuthErrorType.invalidCredentialsException),
                    )
                    .having(
                      (e) => e.message,
                      "error message",
                      equals(
                        authTypeToMessage[
                            AuthErrorType.invalidCredentialsException],
                      ),
                    ),
              ),
            );
          },
        );

        test(
          "test that an error is thrown when the user is not verified",
          () async {
            await User.db.updateRow(
              sessionBuilder.build(),
              user.copyWith(verified: false),
            );
            expect(
              () => endpoints.auth.login(sessionBuilder, email, password),
              throwsA(
                isA<AuthException>()
                    .having(
                      (e) => e.errorType,
                      "error type",
                      equals(AuthErrorType.accountNotActivatedException),
                    )
                    .having(
                      (e) => e.message,
                      "error message",
                      equals(
                        authTypeToMessage[
                            AuthErrorType.accountNotActivatedException],
                      ),
                    ),
              ),
            );
          },
        );
      },
    );

    group(
      "Sign Up",
      () {
        test(
          "test that user creates account successfully and otp is sent",
          () async {
            await endpoints.auth.createAccount(
              sessionBuilder,
              email,
              password,
              username,
              scope,
            );

            final storedUser = await User.db.findFirstRow(
              sessionBuilder.build(),
              where: (t) => t.email.equals(email),
            );

            final storedOtp = await OtpVerification.db.findFirstRow(
              sessionBuilder.build(),
              where: (t) => t.email.equals(email),
            );

            expect(storedUser, isNotNull);
            expect(storedUser!.email, equals(email));
            expect(storedUser.password, isNot(password));
            expect(storedUser.verified, isFalse);
            expect(storedUser.username, username);
            expect(storedUser.scope, scope);

            expect(storedOtp, isNotNull);
            expect(storedOtp!.expiredAt.isAfter(DateTime.now()), isTrue);
          },
        );

        test(
          "test that sign up endpoint throws an exeception when the username is in use",
          () async {
            final user = await endpoints.auth.createAccount(
              sessionBuilder,
              email,
              password,
              username,
              scope,
            );
            await User.db.updateRow(
              sessionBuilder.build(),
              user.copyWith(verified: true),
            );

            expect(
              () => endpoints.auth.createAccount(
                sessionBuilder,
                email,
                password,
                username,
                scope,
              ),
              throwsA(
                isA<AuthException>()
                    .having(
                      (e) => e.errorType,
                      "error type",
                      equals(AuthErrorType.usernameAlreadyExistsException),
                    )
                    .having(
                      (e) => e.message,
                      "error message",
                      authTypeToMessage[
                          AuthErrorType.usernameAlreadyExistsException],
                    ),
              ),
            );
          },
        );

        test(
          "test that sign up throws an exception when email already exists",
          () async {
            final user = await endpoints.auth.createAccount(
              sessionBuilder,
              email,
              password,
              username,
              scope,
            );
            await User.db.updateRow(
              sessionBuilder.build(),
              user.copyWith(verified: true),
            );

            expect(
              () => endpoints.auth.createAccount(
                sessionBuilder,
                email,
                password,
                "anotherUsername",
                scope,
              ),
              throwsA(
                isA<AuthException>()
                    .having(
                      (e) => e.errorType,
                      "error type",
                      equals(AuthErrorType.emailAlreadyExistsException),
                    )
                    .having(
                      (e) => e.message,
                      "error message",
                      authTypeToMessage[
                          AuthErrorType.emailAlreadyExistsException],
                    ),
              ),
            );
          },
        );
      },
    );

    group("reset password", () {
      setUp(() async {
        final user = await endpoints.auth.createAccount(
          sessionBuilder,
          email,
          password,
          username,
          scope,
        );
        await User.db.updateRow(
          sessionBuilder.build(),
          user.copyWith(verified: true),
        );
      });

      test("test that initiate reset password sent an otp", () async {
        final response =
            await endpoints.auth.sendResetPasswordOtp(sessionBuilder, email);
        final otpVerification = await OtpVerification.db.findFirstRow(
          sessionBuilder.build(),
          where: (t) => t.email.equals(email),
        );
        expect(response, isTrue);
        expect(otpVerification, isNotNull);
      });

      test(
        "test that initiate reset password throws an exception when the user doesn't exist",
        () async {
          await User.db.deleteWhere(sessionBuilder.build(),
              where: (t) => t.email.equals(email));
          expect(
            () => endpoints.auth.sendResetPasswordOtp(sessionBuilder, email),
            throwsA(
              isA<AuthException>(),
            ),
          );
        },
      );
    });
  });
}
