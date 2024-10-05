import 'package:dartz/dartz.dart';
import 'package:on_run_test/core/error/failures.dart';
import 'package:on_run_test/features/job/data/datamodels/searchrepo/job_list_repo.dart';
import 'package:on_run_test/features/job/domain/repositories/job_repository.dart';

class JobListUseCase {
  final JobRepositories repo;
  JobListUseCase(this.repo);

  Future<Either<Failure, JobResponse>> call(
      {required int pageNo, required String keyWords}) async {
    return await repo.getJobs(pageNo: pageNo, keyWords: keyWords);
  }
}
