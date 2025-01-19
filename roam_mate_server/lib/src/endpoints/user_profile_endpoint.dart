import 'package:roam_mate_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';

class UserProfileEndpoint extends Endpoint {
  Future<bool> checkUsernameIsAvailable(
    Session session,
    String username,
  ) async {
    final user = await User.db.findFirstRow(
      session,
      where: (userTable) {
        return userTable.username.equals(username);
      },
    );

    return user == null;
  }

  Future<UserProfile> updateUserProfile(
    Session session,
    String? firstName,
    String? lastName,
    int? userId,
    int? age,
    Gender? gender,
    String? courseOfStudy,
    int? yearInSchool,
  ) async {
    final userProfile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    if (userProfile != null) {
      var newUserProfile = userProfile.copyWith(
        courseOfStudy: courseOfStudy,
        firstName: firstName,
        gender: gender,
        lastName: lastName,
        yearEntered: yearInSchool,
      );
      newUserProfile = await UserProfile.db.updateRow(session, newUserProfile);
      return newUserProfile;
    }

    throw AuthException(errorType: AuthErrorType.userNotFoundException);
  }
}
