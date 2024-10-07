import 'package:get_it/get_it.dart';
import 'package:on_run_test/core/error/failures.dart';
import 'package:on_run_test/features/datasource/issues_repo_datasource.dart';
import 'package:on_run_test/features/datasource/serach_repo_datasource.dart';
import 'package:on_run_test/features/issues/data/repository/issues_repo_impl.dart';
import 'package:on_run_test/features/issues/domain/repositories/issues_repository.dart';
import 'package:on_run_test/features/issues/domain/usecases/issue_repo_usecase.dart';
import 'package:on_run_test/features/issues/presentation/bloc/git_repo_issue_bloc.dart';
import 'package:on_run_test/features/job/data/repository/job_repo_impl.dart';
import 'package:on_run_test/features/job/domain/repositories/job_repository.dart';
import 'package:on_run_test/features/job/domain/usecases/job_list_usecase.dart';
import 'package:on_run_test/features/job/presentation/bloc/job_list_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  
  sl.registerLazySingleton(() => JobListUseCase(sl()));

  sl.registerLazySingleton(() => IssueRepoUseCase(sl()));
  
  sl.registerLazySingleton<JobRepositories>(
      () => JobRepoImplementation(repositories: sl()));

  sl.registerLazySingleton<JobRepoDataSource>(
      () => JobRepoDataSourceImpl(client: sl()));

  sl.registerFactory(() => JobRepoBloc(getRepo: sl()));
  
  sl.registerLazySingleton<JobDetailRepositories>(
      () => JobDetailRepoImplementation(repositories: sl()));

  sl.registerLazySingleton<JobDetailRepoDataSource>(
      () => JobDetailRepoDataSourceImpl(client: sl()));

  sl.registerFactory(() => GitRepoIssuesBloc(getRepo: sl()));

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton(() => http.Client());
}
