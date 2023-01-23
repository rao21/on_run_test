import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_run_test/core/utils/sort_extention.dart';
import 'package:on_run_test/features/issues/data/datamodels/issues/issues_repo.dart';
import 'package:on_run_test/features/issues/domain/usecases/issue_repo_usecase.dart';
import 'package:on_run_test/features/issues/presentation/bloc/git_repo_issue_events.dart';
import 'package:on_run_test/features/issues/presentation/bloc/git_repo_issue_states.dart';

class GitRepoIssuesBloc extends Bloc<GitRepoIssuesEvent, GitRepoIssuesState> {
  final IssueRepoUseCase getRepo;
  bool hasMoreData = true;
  int pageNo = 1;
  final List<IssuesItems> reposIssues = [];
  GitRepoIssuesBloc({required this.getRepo})
      : super(GitIssueRepoLoadingState()) {
    on<GitRepoIssuesEvent>((event, emit) async {
      if (event is GitRepoIssuesPaginatedIssuesEvent && hasMoreData) {
        emit(GitIssueRepoLoadingState());
        if (event.fullName!.isEmpty) {
          emit(const GetIssueRepoErrorState(message: "Keyword is empty."));
          return;
        }
        final response =
            await getRepo.call(pageNo: pageNo, fullName: event.fullName!);
        response.fold(
          (failure) {
            emit(const GetIssueRepoErrorState(
                message: "Unexpected Error, Please Try Again"));
            hasMoreData = true;
          },
          (issues) {
            hasMoreData = (reposIssues.length < issues.totalCount!);
            reposIssues.addAll(issues.items!.toList());
            reposIssues.sortedBy((it) => it.title!);
            emit(GitIssueRepoSuccessState(reposItem: reposIssues));

            pageNo++;
          },
        );
      } else if (event is GitRepoIssuesEventInitialEvent) {
        hasMoreData = true;
        pageNo = 1;
        reposIssues.clear();
      }
    });
  }
}
