import 'package:dartz/dartz.dart';
import 'package:on_run_test/core/error/failures.dart';
import 'package:on_run_test/features/search/data/datamodels/searchrepo/search_repo.dart';

abstract class SearchRepositories {
  Future<Either<Failure, Repos>> getSearchRepos(
      {required int pageNo, required String keyWords});
  }
