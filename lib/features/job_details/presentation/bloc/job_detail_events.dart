import 'package:equatable/equatable.dart';

abstract class JobDetailIssuesEvent extends Equatable {
  const JobDetailIssuesEvent();

  @override
  List<Object> get props => [];
}

class JobDetailEventInitialEvent extends JobDetailIssuesEvent {
  const JobDetailEventInitialEvent();
}

class JobDetailIssuesPaginatedIssuesEvent extends JobDetailIssuesEvent {
  final String? fullName;
  const JobDetailIssuesPaginatedIssuesEvent({this.fullName});
}
