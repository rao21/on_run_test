import 'package:on_run_test/features/datasource/serach_repo_datasource.dart';
import 'package:on_run_test/features/job/data/datamodels/searchrepo/job_list_repo.dart';
import 'package:on_run_test/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:on_run_test/features/job/domain/repositories/job_repository.dart';

class JobRepoImplementation extends JobRepositories {
  final JobRepoDataSource repositories;
  JobRepoImplementation({required this.repositories});

  @override
  Future<Either<Failure, JobResponse>> getJobs(
      {required int pageNo, required String keyWords}) async {
    try {
      final remotePosts =
          await repositories.getSearchRepos();

      return Right(remotePosts);
    } catch (exp) {
      return Left(SerivceFailure());
    }
  }

}
