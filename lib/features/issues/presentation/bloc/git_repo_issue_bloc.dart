import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_run_test/features/issues/domain/usecases/issue_repo_usecase.dart';
import 'package:on_run_test/features/issues/presentation/bloc/git_repo_issue_events.dart';
import 'package:on_run_test/features/issues/presentation/bloc/git_repo_issue_states.dart';

class GitRepoIssuesBloc extends Bloc<GitRepoIssuesEvent, GitRepoIssuesState> {
  final IssueRepoUseCase getRepo;
  GitRepoIssuesBloc({required this.getRepo})
      : super(GitIssueRepoLoadingState()) {
    on<GitRepoIssuesEvent>((event, emit) async {
      if (event is GitRepoIssuesPaginatedIssuesEvent) {
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
