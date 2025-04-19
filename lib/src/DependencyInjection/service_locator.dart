import 'package:get_it/get_it.dart';
import 'package:my_app/src/blocs/auth/auth_bloc.dart';
import 'package:my_app/src/repositories/auth_repository.dart';
import 'package:my_app/src/services/dio_client.dart';
import 'package:my_app/src/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../blocs/file/file_bloc.dart';
import '../repositories/file_repository.dart';
import '../services/file_service.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  getIt.registerSingleton<DioClient>(DioClient(sharedPreferences: sharedPreferences));

  registerServices();
  registerRepositories();
  registerBlocs();
}

void registerServices() {
  getIt.registerSingleton<UserService>(UserService(dioClient: getIt<DioClient>()));
  getIt.registerSingleton<FileService>(FileService(dioClient: getIt<DioClient>()));
}

void registerRepositories() {
  getIt.registerSingleton<AuthRepository>(
    AuthRepository(
      userService: getIt<UserService>(),
      sharedPreferences: getIt<SharedPreferences>(),
    ),
  );
  getIt.registerSingleton<FileRepository>(
    FileRepository(
      fileService: getIt<FileService>(),
    ),
  );
}

void registerBlocs() {
  getIt.registerCachedFactory<FileBloc>(
    () => FileBloc(fileRepository: getIt<FileRepository>()),
  );
  getIt.registerCachedFactory<AuthBloc>(
    () => AuthBloc(
      authRepository: getIt<AuthRepository>(),
      sharedPreferences: getIt<SharedPreferences>(),
    ),
  );
}
