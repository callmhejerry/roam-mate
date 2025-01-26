import 'dart:math';

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

    // group("Sign up", () {
    //   test(
    //     "Test that account is created successfully and otp is sent",
    //     () async {
    //       final session = sessionBuilder.build();
    //       final user = await endpoints.auth.createAccount(
    //         sessionBuilder,
    //         email,
    //         password,
    //         username,
    //         scope,
    //       );
    //       final storedUser = await User.db.findFirstRow(
    //         session,
    //         where: (t) => t.email.equals(email),
    //       );

    //       expect(storedUser, isNotNull);
    //       expect(storedUser!.id, equals(user.id));
    //       expect(storedUser.email, equals(email));
    //       expect(storedUser.password, isNot(password));
    //       expect(storedUser.verified, isFalse);
    //       expect(storedUser.username, username);
    //       expect(storedUser.scope, scope);

    //       final otpVerification = await OtpVerification.db
    //           .findFirstRow(session, where: (t) => t.email.equals(email));
    //       expect(otpVerification, isNotNull);
    //     },
    //   );
    // });
  });
}
