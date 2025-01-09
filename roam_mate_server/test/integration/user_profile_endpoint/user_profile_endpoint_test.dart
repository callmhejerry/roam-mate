import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:test/test.dart';

import '../test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod(
    "Given User Endpoint",
    (sessionBuilder, endPoint) async {
      var session = sessionBuilder.build();

      setUp(() async {
        await UserInfo.db.insertRow(
          session,
          UserInfo(
            userIdentifier: "email",
            created: DateTime.now().toUtc(),
            scopeNames: ["student"],
            blocked: false,
            userName: "jerressy",
          ),
        );
      });

      test(
        "then calling `checkUsernameAvailability` should give false",
        () async {
          final actualUsernameAvailability = await endPoint.userProfile
              .checkUsernameIsAvailable(sessionBuilder, "jerressy");
          expect(actualUsernameAvailability, equals(false));
        },
      );
    },
  );
}
