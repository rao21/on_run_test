import 'package:equatable/equatable.dart';
import 'package:on_run_test/features/job/presentation/ui/job_ui_model.dart';

abstract class JobListState extends Equatable {
  const JobListState();

  @override
  List<Object> get props => [];
}

class JobListInitialState extends JobListState {}

class JobListLoadingState extends JobListState {}

class JobListPaginatedState extends JobListState {
  final List<JobUI> reposItem;
  final int? pageNo;
  const JobListPaginatedState(
      {required this.reposItem, required this.pageNo});
  @override
  List<Object> get props => [reposItem, pageNo!];
}

class GetSearchRepoPaginatedErrorState extends JobListState {
  final String message;

  const GetSearchRepoPaginatedErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
