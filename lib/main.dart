import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_run_test/core/bloc/debug.dart';
import 'package:on_run_test/core/utils/theme.dart';
import 'package:on_run_test/features/issues/presentation/bloc/git_repo_issue_bloc.dart';
import 'package:on_run_test/features/issues/presentation/bloc/git_repo_issue_events.dart';
import 'package:on_run_test/features/job/presentation/ui/job_list.dart';
import 'based_injection/di.dart' as di;
import 'features/job/presentation/bloc/job_list_bloc.dart';
import 'features/job/presentation/bloc/job_list_events.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = BlocObserverDebug();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                di.sl<JobRepoBloc>()..add(const JobListInitialEvent())),
        BlocProvider(
            create: (_) =>
                di.sl<GitRepoIssuesBloc>()..add(const GitRepoIssuesEventInitialEvent())),

      ],
      child: MaterialApp(
        title: 'Git Repos',
        theme: MyAppThemes.lightTheme(),
        darkTheme: MyAppThemes.darkTheme(),
        home: const JobListWidget(title: 'Git Repositories Links'),
      ),
    );
  }
}
