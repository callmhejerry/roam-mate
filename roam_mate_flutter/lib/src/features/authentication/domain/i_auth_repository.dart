import 'package:roam_mate_flutter/src/features/authentication/domain/entity/user_entity.dart';

abstract class IAuthRepository {
  Future<UserEntity?> login({required String email, required String password});
  Future<bool> createAccount({
    required String email,
    required String password,
    required String username,
  });
  Future<UserEntity?> verifiyAccount({
    required String email,
    required String verificationCode,
  });

  Future<bool> initiateResetPassword({required String email});

  Future<bool> resendOtp({required String email});

  Future<bool> resetPassword({
    required String password,
    required String email,
    required String verificationCode,
  });
  Future<bool> logout({required int userId});

  UserEntity? get getSignedInUser;

  Stream<UserEntity?> get authStream;
}
