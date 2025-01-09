import 'package:roam_mate_server/src/generated/protocol.dart';
import 'package:test/test.dart';

import '../test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod("test account creation", (sessionBuilder, endpoints) async {
    final username = "jerressy";
    final email = "jerry@gmail.com";
    final password = "test123!";
    final scope = "student";

    test(
      "test that account is created successfully and otp is sent",
      () async {
        final session = sessionBuilder.build();
        final user = await endpoints.auth.createAccount(
          sessionBuilder,
          email,
          password,
          username,
          scope,
        );
        final storedUser = await User.db.findFirstRow(
          session,
          where: (t) => t.email.equals(email),
        );

        expect(storedUser, isNotNull);
        expect(storedUser!.id, equals(user.id));
        expect(storedUser.email, equals(email));
        expect(storedUser.password, isNot(password));
        expect(storedUser.verified, isFalse);
        expect(storedUser.username, username);
        expect(storedUser.scope, scope);

        final otpVerification = await OtpVerification.db
            .findFirstRow(session, where: (t) => t.email.equals(email));
        expect(otpVerification, isNotNull);
      },
    );
  });
}
