import 'package:equatable/equatable.dart';

abstract class JobListEvent extends Equatable {
  const JobListEvent();

  @override
  List<Object> get props => [];
}

class JobListInitialEvent extends JobListEvent {

  const JobListInitialEvent();
}

class JobListPaginatedEvent extends JobListEvent {
  final String? keyWords;
  const JobListPaginatedEvent({this.keyWords});
}


