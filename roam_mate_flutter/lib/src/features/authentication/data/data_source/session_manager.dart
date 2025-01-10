import 'package:flutter/material.dart';
import 'package:roam_mate_client/roam_mate_client.dart';

class SessionManager with ChangeNotifier {
  final Client client;
  User? signedInUser;

  SessionManager({required this.client});

  Future<void> initialize() async {
    await getSignedInUser();
  }

  Future<User?> getSignedInUser() async {
    try {
      final user = await client.auth.getSignedInUser();
      signedInUser = user;
      return user;
    } catch (_) {}
    return null;
  }

  Future<User> signInUser({
    required String email,
    required String password,
  }) async {
    final loginResponse = await client.auth.login(email, password);

    await client.authenticationKeyManager?.put(loginResponse.authToken);
    signedInUser = loginResponse.user;
    notifyListeners();
    return signedInUser!;
  }

  Future<bool> logout({required int userId}) async {
    final result = await client.auth.logout(userId);
    await client.authenticationKeyManager?.remove();
    signedInUser = null;
    notifyListeners();
    return result;
  }

  Future<User> verifyUser({
    required String otp,
    required String email,
  }) async {
    final LoginResponse response = await client.auth.verifyOtp(otp, email);
    await client.authenticationKeyManager?.put(response.authToken);
    signedInUser = response.user;
    notifyListeners();
    return signedInUser!;
  }
}
