import 'package:on_run_test/features/datasource/issues_repo_datasource.dart';
import 'package:on_run_test/features/issues/data/datamodels/issues/issues_repo.dart';
import 'package:on_run_test/features/issues/domain/repositories/issues_repository.dart';
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
