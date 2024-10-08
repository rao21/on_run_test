import 'package:get_it/get_it.dart';
import 'package:on_run_test/core/error/failures.dart';
import 'package:on_run_test/features/datasource/job_detail_datasource.dart';
import 'package:on_run_test/features/datasource/job_datasource.dart';
import 'package:on_run_test/features/job_details/data/repository/job_detail_repo_impl.dart';
import 'package:on_run_test/features/job_details/domain/repositories/job_detail_repository.dart';
import 'package:on_run_test/features/job_details/domain/usecases/job_detail_usecase.dart';
import 'package:on_run_test/features/job_details/presentation/bloc/job_detail_bloc.dart';
import 'package:on_run_test/features/job/data/repository/job_repo_impl.dart';
import 'package:on_run_test/features/job/domain/repositories/job_repository.dart';
import 'package:on_run_test/features/job/domain/usecases/job_list_usecase.dart';
import 'package:on_run_test/features/job/presentation/bloc/job_list_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  
  sl.registerLazySingleton(() => JobListUseCase(sl()));

  sl.registerLazySingleton(() => JobDetailUseCase(sl()));
  
  sl.registerLazySingleton<JobRepositories>(
      () => JobRepoImplementation(repositories: sl()));

  sl.registerLazySingleton<JobRepoDataSource>(
      () => JobRepoDataSourceImpl(client: sl()));

  sl.registerFactory(() => JobRepoBloc(getRepo: sl()));
  
  sl.registerLazySingleton<JobDetailRepositories>(
      () => JobDetailRepoImplementation(repositories: sl()));

  sl.registerLazySingleton<JobDetailRepoDataSource>(
      () => JobDetailRepoDataSourceImpl(client: sl()));

  sl.registerFactory(() => JobDetailBloc(getRepo: sl()));

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton(() => http.Client());
}
