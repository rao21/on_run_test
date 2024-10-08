import 'package:equatable/equatable.dart';
import 'package:on_run_test/features/job_details/data/datamodels/issues/job_detail_source.dart';

abstract class JobDetailState extends Equatable {
  const JobDetailState();

  @override
  List<Object> get props => [];
}

class GitIssueRepoLoadingState extends JobDetailState {}

class JobDetailSuccessState extends JobDetailState {
  final JobDetail data;
  const JobDetailSuccessState({required this.data});
}

class JobDetailErrorState extends JobDetailState {
  final String message;

  const JobDetailErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
