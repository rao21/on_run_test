import 'dart:convert';
import 'dart:developer';

import 'package:on_run_test/core/utils/constants.dart';
import 'package:on_run_test/features/issues/data/datamodels/issues/issues_repo.dart';
import 'package:http/http.dart' as http;

abstract class IssueRepoDataSource {
  Future<Issues> getSearchReposIssues(
      {required int pageNo, required String fullName});
}

class IssuesRepoDataSourceImpl extends IssueRepoDataSource {
  late final http.Client client;
  IssuesRepoDataSourceImpl({
    required this.client,
  });

  @override
  Future<Issues> getSearchReposIssues(
      {required int pageNo, required String fullName}) async {
    try {
      final response = await client.get(
          Uri.parse(
              '${Constants.aDebugBaseUrl}${Constants.searchRepoIssuesUrl}?q=$fullName&sort,order,per_page,page,order&page=$pageNo&per_page=${Constants.perPage}'),
          headers: {
            "Content-Type": "application/json",
            "Token": Constants.token
          });
      log("URL ${response.request!.url}");
      if (response.statusCode == 200) {
        Map<String, dynamic> resp = jsonDecode(response.body);
        return Issues.fromJson(resp);
      }
    } catch (exp) {
      log(exp.toString());
      throw Exception(exp);
    }
    throw Exception();
  }
}