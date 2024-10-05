import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:on_run_test/features/job/presentation/bloc/job_list_bloc.dart';
import 'package:on_run_test/features/job/presentation/bloc/job_list_events.dart';
import 'package:on_run_test/features/job/presentation/bloc/job_list_states.dart';

import '../mock_repo/mock_data.dart';
import '../mock_repo/mock_use_case.dart';

void main() {
  group('Search repo bloc test', () {
    late JobRepoBloc searchRepoBloc;
    MockSearcUseCase mockSearcRepo;
    setUpAll(() {
      mockSearcRepo = MockSearcUseCase();
      searchRepoBloc = JobRepoBloc(getRepo: mockSearcRepo);
    });
    blocTest('emit [GetSearchRepoLoadingState ,GetSearchRepoPaginatedState] ',
        build: () => searchRepoBloc,
        act: (bloc) =>
            bloc.add(const JobListPaginatedEvent(keyWords: 'rao')),
        expect: (() => [
              JobListLoadingState(),
              JobListPaginatedState(
                  pageNo: 1, reposItem: mockRepoItemsData)
            ]));

    blocTest('emit [] on clear bloc values.',
        build: () => searchRepoBloc,
        act: (bloc) => bloc.add(const JobListInitialEvent()),
        expect: (() => []));

    tearDown(() {
      searchRepoBloc.close();
    });
  });
}


/*
fvm flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
 */