import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:roam_mate_server/src/generated/user.dart';
import 'package:serverpod/server.dart';

class AuthMiddleWare {
  static Future<AuthenticationInfo?> verifyToken(
    Session session,
    String token,
  ) async {
    try {
      final userJson = JWT.decode(token).payload;
      final User user = User.fromJson(userJson);

      return AuthenticationInfo(
        user.id!,
        {Scope(user.scope)},
        authId: token,
      );
    } catch (e) {
      return null;
    }
  }
}
