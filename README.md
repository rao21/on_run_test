# scaler

## Getting Started

Git Repository URL
Provide the Git URL: [(https://github.com/rao21/on_run_test.git)]

## Branch Name
The code is available on the following branch: [sc_al_te]. Don't use main/master branch because that contain my old repo code and test of different company. 

## How to Run the Tests
To run the test suite for this project, please use the following command in the terminal: [fvm flutter test --update-goldens] 
 
This will run all the tests and update the golden files if any test fails. If all tests pass, the output will be a screen difference screenshot


## Architecture Discussion
To get a deeper understanding of the architecture and clarify any questions, I would be happy to arrange a call. Please let me know a suitable time.

# Json build runner command
fvm flutter clean
fvm flutter packages get
fvm flutter packages pub run build_runner build --delete-conflicting-outputs

# flutter_test
For Golden test update run command
fvm flutter test --update-goldens test/features/issues/presentation_test/issues_repo_test.dart
fvm flutter test --update-goldens test/features/search/presentation_test/search_repo_test.dart

Remove fvm if flutter is standalone

# For Code coverage run this command
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html