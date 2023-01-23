import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_run_test/core/bloc/debug.dart';
import 'package:on_run_test/features/issues/presentation/bloc/git_repo_issue_bloc.dart';
import 'package:on_run_test/features/issues/presentation/bloc/git_repo_issue_events.dart';
import 'package:on_run_test/features/search/presentation/bloc/search_repo_bloc.dart';
import 'package:on_run_test/features/search/presentation/bloc/search_repo_events.dart';
import 'package:on_run_test/features/search/presentation/ui/search_repo.dart';
import 'based_injection/di.dart' as di;

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
                di.sl<SearchRepoBloc>()..add(const SearchRepoInitialEvent())),
        BlocProvider(
            create: (_) => di.sl<GitRepoIssuesBloc>()
              ..add(const GitRepoIssuesEventInitialEvent())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const GitReposListPage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
