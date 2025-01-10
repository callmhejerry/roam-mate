import 'package:roam_mate_client/roam_mate_client.dart';
import 'package:roam_mate_flutter/src/api/api_client.dart';
import 'package:roam_mate_flutter/src/features/authentication/domain/entity/user_entity.dart';

class AuthRemoteDataSource {
  final ApiClient client;

  AuthRemoteDataSource({required this.client});
  UserEntity? getSignedInUser() {
    final userInfo = client.sessionManager.signedInUser;
    if (userInfo != null) {
      return UserEntity(
        email: userInfo.email,
        username: userInfo.username,
        id: userInfo.id!,
      );
    }
    return null;
  }

  Future<bool> resendOtp({required String email}) async {
    await client.client.auth.resendOtp(email);
    return true;
  }

  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    final user = await client.sessionManager.signInUser(
      email: email,
      password: password,
    );

    return UserEntity(
      email: user.email,
      id: user.id!,
      username: user.username,
    );
  }

  Future<bool> logout({
    required int userId,
  }) async {
    return client.sessionManager.logout(userId: userId);
  }

  Future<bool> createAccount({
    required String email,
    required String password,
    required String username,
  }) async {
    await client.client.auth.createAccount(
      email,
      password,
      username,
      "student",
    );
    return true;
  }

  Future<UserEntity?> verifyEmail({
    required String email,
    required String verificationCode,
  }) async {
    final user = await client.sessionManager.verifyUser(
      otp: verificationCode,
      email: email,
    );

    return UserEntity(
      email: user.email,
      id: user.id!,
      username: user.username,
    );
  }

  Future<bool> initiateResetPassword({required String email}) async {
    final response = await client.client.auth.sendResetPasswordOtp(email);
    return response;
  }

  Future<bool> resetPassword({
    required String email,
    required String verificationCode,
    required String password,
  }) async {
    final response = await client.client.auth.resetPassword(
      email,
      verificationCode,
      password,
    );
    return response;
  }
}
