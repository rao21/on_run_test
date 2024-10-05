import 'package:dartz/dartz.dart';
import 'package:on_run_test/core/error/failures.dart';
import 'package:on_run_test/features/job/data/datamodels/searchrepo/job_list_repo.dart';

abstract class JobRepositories {
  Future<Either<Failure, JobResponse>> getJobs(
      {required int pageNo, required String keyWords});
  }
