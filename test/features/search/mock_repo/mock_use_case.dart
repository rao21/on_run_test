import 'package:dartz/dartz.dart';
import 'package:on_run_test/core/error/failures.dart';
import 'package:on_run_test/features/job/data/datamodels/searchrepo/job_list_repo.dart';
import 'package:on_run_test/features/job/domain/repositories/job_repository.dart';
import 'package:on_run_test/features/job/domain/usecases/job_list_usecase.dart';

import 'mock_data.dart';
import 'mock_search_repo.dart';

class MockSearcUseCase implements JobListUseCase {
  @override
  Future<Either<Failure, Repos>> call(
      {required int pageNo, required String keyWords}) {
    Future.delayed(const Duration(seconds: 2));
    return Future.value(Right(Repos(
        incompleteResults: false, totalCount: 2, items: mockRepoItemsData)));
  }

  @override
  JobRepositories get repo => MockSearchRepo();
}