import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:roam_mate_flutter/src/api/api_client.dart';
import 'package:roam_mate_flutter/src/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:roam_mate_flutter/src/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:roam_mate_flutter/src/features/authentication/domain/i_auth_repository.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';

final getIt = GetIt.instance;

Future<void> setUp() async {
  debugPrint("Setting up client");
  await registerServices();
  registerRemoteDataSource();
  registerLocalDataSource();
  registerRepository();
  registerBloc();

  await getIt.allReady();
}

registerServices() async {
  debugPrint("Setting up client");
  final client = await ApiClient().initialize();
  getIt.registerLazySingleton(() => client);
}

void registerRepository() {
  getIt.registerLazySingleton<IAuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: getIt()));
}

void registerRemoteDataSource() {
  getIt.registerLazySingleton(
    () => AuthRemoteDataSource(
      client: getIt(),
    ),
  );
}

void registerLocalDataSource() {}

void registerBloc() {
  getIt.registerLazySingleton(() => AuthBloc(authRepository: getIt()));
  getIt.registerFactory(() => LoginBloc(authRepository: getIt()));
  getIt.registerFactory(() => SignUpBloc(authRepository: getIt()));
}
