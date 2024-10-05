import 'package:dartz/dartz.dart';
import 'package:on_run_test/core/error/failures.dart';
import 'package:on_run_test/features/job/data/datamodels/searchrepo/job_list_repo.dart';
import 'package:on_run_test/features/job/domain/repositories/job_repository.dart';

import 'mock_data.dart';



class MockSearchRepo implements JobRepositories {
  @override
  Future<Either<Failure, Repos>> getJobs(
      {required int pageNo, required String keyWords}) {
    Future.delayed(const Duration(seconds: 2));
    return Future.value(Right(Repos(
        incompleteResults: false, totalCount: 2, items: mockRepoItemsData)));
  }
}