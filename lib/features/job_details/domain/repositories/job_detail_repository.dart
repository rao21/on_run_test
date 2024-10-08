import 'package:dartz/dartz.dart';
import 'package:on_run_test/core/error/failures.dart';
import 'package:on_run_test/features/job_details/data/datamodels/issues/job_detail_source.dart';

abstract class JobDetailRepositories {
  Future<Either<Failure, JobDetail>> getReposIssues(
      {required String fullName});
}
