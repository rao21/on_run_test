import 'dart:convert';
import 'dart:developer';

import 'package:on_run_test/core/error/failures.dart';
import 'package:on_run_test/core/utils/constants.dart';
import 'package:on_run_test/core/utils/http.dart';
import 'package:http/http.dart' as http;
import 'package:on_run_test/features/job_details/data/datamodels/issues/job_detail_source.dart';

abstract class JobDetailRepoDataSource {
  Future<JobDetail> getSearchReposIssues(
      {required String id});
}

class JobDetailRepoDataSourceImpl extends JobDetailRepoDataSource {
  late final http.Client client;
  JobDetailRepoDataSourceImpl({
    required this.client,
  });

  @override
  Future<JobDetail> getSearchReposIssues(
      {required String id}) async {
    try {
      var url =
          "${Constants.aDebugBaseUrl}${Constants.jobs}/$id";
      final response = await HttpCalls.getApiCall(url: url);
      if (response.statusCode == 200) {
        Map<String, dynamic> resp = jsonDecode(response.body);
        return JobDetail.fromJson(resp['data']);
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
