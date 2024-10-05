import 'dart:convert';
import 'dart:developer';

import 'package:on_run_test/core/error/failures.dart';
import 'package:on_run_test/core/utils/constants.dart';
import 'package:on_run_test/core/utils/http.dart';
import 'package:on_run_test/features/job/data/datamodels/searchrepo/job_list_repo.dart';
import 'package:http/http.dart' as http;

abstract class JobRepoDataSource {
  Future<JobResponse> getSearchRepos();
}

class JobRepoDataSourceImpl extends JobRepoDataSource {
  late final http.Client client;
  JobRepoDataSourceImpl({required this.client});

  @override
  Future<JobResponse> getSearchRepos() async {
    try {
      const url =
          "${Constants.aDebugBaseUrl}${Constants.jobs}";
      final response = await HttpCalls.getApiCall(url: url);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return JobResponse.fromJson(jsonResponse);
        }
    } on NetworkConnectFailure {
      throw NetworkConnectFailure();
    } catch (exp) {
      log(exp.toString());
      throw Exception(exp);
    }
    throw Exception();
  }
}
