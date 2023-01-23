import 'dart:convert';
import 'dart:developer';

import 'package:on_run_test/core/utils/constants.dart';
import 'package:on_run_test/features/search/data/datamodels/searchrepo/search_repo.dart';
import 'package:http/http.dart' as http;

abstract class SearchRepoDataSource {
  Future<Repos> getSearchRepos({required int pageNo, required String keyWords});
}

class SearchRepoDataSourceImpl extends SearchRepoDataSource {
  late final http.Client client;
  SearchRepoDataSourceImpl({
    required this.client,
  });

  @override
  Future<Repos> getSearchRepos(
      {required int pageNo, required String keyWords}) async {
    try {
      final response = await client.get(
          Uri.parse(
              '${Constants.aDebugBaseUrl}${Constants.searchRepoUrl}?q=$keyWords&sort,order,per_page,page,order&page=$pageNo&per_page=${Constants.perPage}'),
          headers: {
            "Content-Type": "application/json",
            "Token": Constants.token
          });
      log("URL ${response.request!.url}");
      if (response.statusCode == 200) {
        Map<String, dynamic> resp = jsonDecode(response.body);
        return Repos.fromJson(resp);
      }
    } catch (exp) {
      log(exp.toString());
      throw Exception(exp);
    }
    throw Exception();
  }
}
