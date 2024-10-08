import 'package:dartz/dartz.dart';
import 'package:on_run_test/core/error/failures.dart';
import 'package:on_run_test/features/job_details/data/datamodels/issues/job_detail_source.dart';
import 'package:on_run_test/features/job_details/domain/repositories/job_detail_repository.dart';

class JobDetailUseCase {
  final JobDetailRepositories repo;
  JobDetailUseCase(this.repo);

  Future<Either<Failure, JobDetail>> call(
      {required String id}) async {
    return await repo.getReposIssues(fullName: id);
  }
}
