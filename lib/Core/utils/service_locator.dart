import 'package:bookly/Core/utils/api_service.dart';
import 'package:bookly/Features/Home/data/Repository/home_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {

  getIt.registerSingleton<ApiService>(
    ApiService(Dio()),

  );

  // Register HomeRepoImplementation singleton using the already registered ApiService
  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(getIt.get<ApiService>()),
  );
}
