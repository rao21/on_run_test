# on_run_test

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.


For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# flutter_test
For Golden test update run command
fvm flutter test --update-goldens test/features/issues/presentation_test/issues_repo_test.dart
fvm flutter test --update-goldens test/features/search/presentation_test/search_repo_test.dart

Remove fvm if flutter is standalone
# For Code coverage run this command
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html