import 'package:dartz/dartz.dart';
import 'package:on_run_test/core/error/failures.dart';
import 'package:on_run_test/features/search/data/datamodels/searchrepo/search_repo.dart';
import 'package:on_run_test/features/search/domain/repositories/search_repository.dart';
import 'package:on_run_test/features/search/domain/usecases/search_repo_usecase.dart';

import 'mock_data.dart';
import 'mock_search_repo.dart';

class MockSearcUseCase implements SearchRepoUseCase {
  @override
  Future<Either<Failure, Repos>> call(
      {required int pageNo, required String keyWords}) {
    Future.delayed(const Duration(seconds: 2));
    return Future.value(Right(Repos(
        incompleteResults: false, totalCount: 2, items: mockRepoItemsData)));
  }

  @override
  SearchRepositories get repo => MockSearchRepo();
}