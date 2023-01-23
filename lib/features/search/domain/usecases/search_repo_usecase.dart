import 'package:dartz/dartz.dart';
import 'package:on_run_test/core/error/failures.dart';
import 'package:on_run_test/features/search/data/datamodels/searchrepo/search_repo.dart';
import 'package:on_run_test/features/search/domain/repositories/search_repository.dart';

class SearchRepoUseCase {
  final SearchRepositories repo;
  SearchRepoUseCase(this.repo);

  Future<Either<Failure, Repos>> call(
      {required int pageNo, required String keyWords}) async {
    return await repo.getSearchRepos(pageNo: pageNo, keyWords: keyWords);
  }
}
