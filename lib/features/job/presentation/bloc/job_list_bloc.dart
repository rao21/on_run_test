import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_run_test/core/error/failures.dart';
import 'package:on_run_test/features/job/domain/usecases/job_list_usecase.dart';
import 'package:on_run_test/features/job/presentation/bloc/job_list_events.dart';
import 'package:on_run_test/features/job/presentation/bloc/job_list_states.dart';
import 'package:on_run_test/features/job/presentation/ui/job_ui_model.dart';

class JobRepoBloc extends Bloc<JobListEvent, JobListState> {
  final JobListUseCase getRepo;
  bool hasMoreData = true;
  int pageNo = 1;
  JobRepoBloc({required this.getRepo}) : super(JobListInitialState()) {
    on<JobListEvent>((event, emit) async {
      if (event is JobListPaginatedEvent && hasMoreData) {
        emit(JobListLoadingState());
        final response =
            await getRepo.call(pageNo: pageNo, keyWords: event.keyWords!);
        response.fold(
          (failure) {
            emit(GetSearchRepoPaginatedErrorState(
                message: failure.runtimeType == SerivceFailure
                    ? 'Server Not Responding'
                    : failure.runtimeType == NoInternetException
                        ? 'No Internet connection'
                        : 'Something went wrong!!'));
            hasMoreData = true;
          },
          (searchedItems) {
            hasMoreData = searchedItems.nextLink != null;
            // repos.addAll([searchedItems]);
            // repos.sortedBy((it) => it.title!);
            List<JobUI> obj = searchedItems.data.map(JobUI.fromResponse).toList();
            emit(JobListPaginatedState(
                reposItem: obj, pageNo: pageNo));

            pageNo++;
          },
        );
      } else if (event is JobListInitialEvent) {
        hasMoreData = true;
        pageNo = 1;
      }
    });
  }
}

