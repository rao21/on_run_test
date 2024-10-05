import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:on_run_test/features/job/presentation/bloc/job_list_bloc.dart';
import 'package:on_run_test/features/job/presentation/bloc/job_list_events.dart';
import 'package:on_run_test/features/job/presentation/bloc/job_list_states.dart';
import 'package:on_run_test/features/job/presentation/ui/job_list.dart';

import '../../../helper/helper.dart';
import '../mock_repo/mock_data.dart';

void main() {
  JobRepoBloc searchRepoBloc;
  MockSearchBloc? mockSearchBloc;
  group('Git repo list ', () {
    setUpAll(() async {
      loadAppFonts();
      registerFallbackValue<JobListEvent>(FakeSearchRepoEvent());
      registerFallbackValue<JobListState>(FakeIssueRepoState());
      mockSearchBloc = MockSearchBloc();
      final di = GetIt.instance;
      di.registerFactory<JobRepoBloc>(() => mockSearchBloc!);
      searchRepoBloc = di<JobRepoBloc>();
    });

    testGoldens('succes state with data', (WidgetTester tester) async {
      mockSearchBloc!.hasMoreData = false;
      when(() => mockSearchBloc!.hasMoreData).thenAnswer((invocation) => false);

      when(() => mockSearchBloc!.state).thenAnswer((invocation) =>
          JobListPaginatedState(reposItem: mockRepoItemsData, pageNo: 2));

      var customWidget = const JobListWidget(
        title: 'Git Repositories',
      ).wrapWithMaterialApp();

      await tester.pumpWidgetBuilder(customWidget,
          surfaceSize: const Size(800, 800));
      await tester.pumpAndSettle(const Duration(seconds: 4));

      await screenMatchesGolden(tester, 'repo_list_success_with_data');
    });
  });
}

class MockSearchBloc extends MockCubit<JobListState>
    implements JobRepoBloc {}

class FakeSearchRepoEvent extends Fake implements JobListEvent {}

class FakeIssueRepoState extends Fake implements JobListState {}
