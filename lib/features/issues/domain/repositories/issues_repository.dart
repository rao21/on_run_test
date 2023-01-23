import 'package:dartz/dartz.dart';
import 'package:on_run_test/core/error/failures.dart';
import 'package:on_run_test/features/issues/data/datamodels/issues/issues_repo.dart';

abstract class IssuesRepositories {
  Future<Either<Failure, Issues>> getReposIssues(
      {required int pageNo, required String fullName});
}
