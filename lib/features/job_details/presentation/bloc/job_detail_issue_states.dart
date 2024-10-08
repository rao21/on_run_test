import 'package:equatable/equatable.dart';
import 'package:on_run_test/features/job_details/data/datamodels/issues/job_detail_source.dart';

abstract class GitRepoIssuesState extends Equatable {
  const GitRepoIssuesState();

  @override
  List<Object> get props => [];
}

class GitIssueRepoLoadingState extends GitRepoIssuesState {}

class GitIssueRepoSuccessState extends GitRepoIssuesState {
  final JobDetail data;
  const GitIssueRepoSuccessState({required this.data});
}

class GetIssueRepoErrorState extends GitRepoIssuesState {
  final String message;

  const GetIssueRepoErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
