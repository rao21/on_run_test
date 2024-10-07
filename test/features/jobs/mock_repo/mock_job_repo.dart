import 'package:dartz/dartz.dart';
import 'package:on_run_test/core/error/failures.dart';
import 'package:on_run_test/features/job/data/datamodels/searchrepo/job_list_repo.dart';
import 'package:on_run_test/features/job/domain/repositories/job_repository.dart';
import 'mock_data.dart';

class MockSearchRepo implements JobRepositories {
  @override
  Future<Either<Failure, JobResponse>> getJobs() {
    Future.delayed(const Duration(seconds: 2));
    return Future.value(Right(JobResponse(count: 2,nextLink: null,prevLink: null,data: mockTestData)));
  }
}