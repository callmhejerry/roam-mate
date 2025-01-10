import 'dart:async';

import 'package:roam_mate_flutter/src/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:roam_mate_flutter/src/features/authentication/domain/entity/user_entity.dart';
import 'package:roam_mate_flutter/src/features/authentication/domain/i_auth_repository.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  UserEntity? user;

  AuthRepositoryImpl({required this.remoteDataSource});

  final StreamController<UserEntity?> _authStreamController =
      StreamController();

  @override
  Future<bool> createAccount({
    required String email,
    required String password,
    required String username,
  }) async {
    return await remoteDataSource.createAccount(
      email: email,
      password: password,
      username: username,
    );
  }

  @override
  Future<UserEntity?> login({
    required String email,
    required String password,
  }) async {
    final user = await remoteDataSource.login(email: email, password: password);
    _authStreamController.add(user);
    this.user = user;
    return user;
  }

  @override
  Future<UserEntity?> verifiyAccount({
    required String email,
    required String verificationCode,
  }) async {
    final user = await remoteDataSource.verifyEmail(
      email: email,
      verificationCode: verificationCode,
    );
    if (user != null) {
      this.user = user;
      _authStreamController.add(user);
    }
    return user;
  }

  @override
  Future<bool> initiateResetPassword({required String email}) async {
    return await remoteDataSource.initiateResetPassword(email: email);
  }

  @override
  Future<bool> resetPassword({
    required String password,
    required String email,
    required String verificationCode,
  }) async {
    return remoteDataSource.resetPassword(
      email: email,
      verificationCode: verificationCode,
      password: password,
    );
  }

  @override
  Stream<UserEntity?> get authStream => _authStreamController.stream;

  @override
  Future<bool> logout({required userId}) async {
    await remoteDataSource.logout(userId: userId);
    _authStreamController.add(null);
    user = null;
    return true;
  }

  @override
  UserEntity? get getSignedInUser {
    user = remoteDataSource.getSignedInUser();
    _authStreamController.add(user);
    return user;
  }

  @override
  Future<bool> resendOtp({required String email}) {
    return remoteDataSource.resendOtp(email: email);
  }
}
