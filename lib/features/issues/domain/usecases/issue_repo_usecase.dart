import 'package:dartz/dartz.dart';
import 'package:on_run_test/core/error/failures.dart';
import 'package:on_run_test/features/issues/data/datamodels/issues/issues_repo.dart';
import 'package:on_run_test/features/issues/domain/repositories/issues_repository.dart';

class IssueRepoUseCase {
  final IssuesRepositories repo;
  IssueRepoUseCase(this.repo);

  Future<Either<Failure, Issues>> call(
      {required int pageNo, required String fullName}) async {
    return await repo.getReposIssues(pageNo: pageNo, fullName: fullName);
  }
}
