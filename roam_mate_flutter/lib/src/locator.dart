import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roam_mate_flutter/src/api/api_client.dart';
import 'package:roam_mate_flutter/src/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:roam_mate_flutter/src/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:roam_mate_flutter/src/features/authentication/domain/i_auth_repository.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:roam_mate_flutter/src/features/authentication/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:roam_mate_flutter/src/features/room/data/data_sources/room_remote_data_source.dart';
import 'package:roam_mate_flutter/src/features/room/data/repository/i_room_repository.dart';
import 'package:roam_mate_flutter/src/features/room/data/repository/room_remote_repository.dart';
import 'package:roam_mate_flutter/src/services/file_uploader.dart';
import 'package:roam_mate_flutter/src/services/image_service.dart';

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
  getIt.registerLazySingleton(() => ImageService(imagePicker: ImagePicker()));
  getIt.registerLazySingleton(() => FileUploadService(client: client));
}

void registerRepository() {
  getIt.registerLazySingleton<IAuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: getIt()));
  getIt.registerLazySingleton<IRoomRepository>(() => RoomRemoteRepository(
        roomRemoteDataSource: getIt(),
        fileUploadService: getIt(),
        imageService: getIt(),
      ));
}

void registerRemoteDataSource() {
  getIt.registerLazySingleton(
    () => AuthRemoteDataSource(
      client: getIt(),
    ),
  );

  getIt.registerLazySingleton(() => RoomRemoteDataSource(client: getIt()));
}

void registerLocalDataSource() {}

void registerBloc() {
  getIt.registerLazySingleton(() => AuthBloc(authRepository: getIt()));
  getIt.registerFactory(() => LoginBloc(authRepository: getIt()));
  getIt.registerFactory(() => SignUpBloc(authRepository: getIt()));
}
