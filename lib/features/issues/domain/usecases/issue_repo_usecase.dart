import 'package:dartz/dartz.dart';
import 'package:on_run_test/core/error/failures.dart';
import 'package:on_run_test/features/issues/data/datamodels/issues/issues_repo.dart';
import 'package:on_run_test/features/issues/domain/repositories/issues_repository.dart';

class IssueRepoUseCase {
  final JobDetailRepositories repo;
  IssueRepoUseCase(this.repo);

  Future<Either<Failure, JobDetail>> call(
      {required String id}) async {
    return await repo.getReposIssues(fullName: id);
  }
}
