import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_run_test/features/job_details/domain/usecases/job_detail_usecase.dart';
import 'package:on_run_test/features/job_details/presentation/bloc/job_detail_events.dart';
import 'package:on_run_test/features/job_details/presentation/bloc/job_detail_issue_states.dart';

class JobDetailBloc extends Bloc<JobDetailIssuesEvent, GitRepoIssuesState> {
  final JobDetailUseCase getRepo;
  JobDetailBloc({required this.getRepo})
      : super(GitIssueRepoLoadingState()) {
    on<JobDetailIssuesEvent>((event, emit) async {
      if (event is JobDetailIssuesPaginatedIssuesEvent) {
        emit(GitIssueRepoLoadingState());
        final response =
            await getRepo.call(id: event.fullName!);
        response.fold(
          (failure) {
            emit(const GetIssueRepoErrorState(
                message: "Unexpected Error, Please Try Again"));
           
          },
          (issues) {
            emit(GitIssueRepoSuccessState(data:issues));
          },
        );
      }
    });
  }
}
