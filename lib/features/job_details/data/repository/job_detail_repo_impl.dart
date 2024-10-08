import 'package:on_run_test/features/datasource/job_detail_datasource.dart';
import 'package:on_run_test/features/job_details/data/datamodels/issues/job_detail_source.dart';
import 'package:on_run_test/features/job_details/domain/repositories/job_detail_repository.dart';
import 'package:on_run_test/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class JobDetailRepoImplementation extends JobDetailRepositories {
  final JobDetailRepoDataSource repositories;
  JobDetailRepoImplementation({required this.repositories});

  @override
  Future<Either<Failure, JobDetail>> getReposIssues(
      {required String fullName}) async {
    try {
      final remotePosts = await repositories.getSearchReposIssues(
           id: fullName);

      return Right(remotePosts);
    } catch (exp) {
      return Left(SerivceFailure());
    }
  }
}
