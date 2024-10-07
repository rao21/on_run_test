import 'package:dartz/dartz.dart';
import 'package:on_run_test/core/error/failures.dart';
import 'package:on_run_test/features/issues/data/datamodels/issues/issues_repo.dart';

abstract class JobDetailRepositories {
  Future<Either<Failure, JobDetail>> getReposIssues(
      {required String fullName});
}
