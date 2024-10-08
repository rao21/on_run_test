import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:on_run_test/based_injection/di.dart' as di;
import 'package:on_run_test/features/job_details/presentation/bloc/job_detail_bloc.dart';
import 'package:on_run_test/features/job_details/presentation/bloc/job_detail_events.dart';
import 'package:on_run_test/features/job/presentation/bloc/job_list_bloc.dart';
import 'package:on_run_test/features/job/presentation/bloc/job_list_events.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      await loadAppFonts();
      await testMain();
    },
    config: GoldenToolkitConfiguration(
      skipGoldenAssertion: () => !Platform.isMacOS,
    ),
  );
}

extension TestWidgetWrapper on Widget {
  Widget wrapWithMaterialApp() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                di.sl<JobRepoBloc>()..add(const JobListInitialEvent())),
        BlocProvider(
            create: (_) => di.sl<JobDetailBloc>()
              ..add(const JobDetailEventInitialEvent())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: this,
      ),
    );
  }
}
