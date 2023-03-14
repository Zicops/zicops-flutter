part of 'course_bloc.dart';

@immutable
abstract class CourseState extends Equatable {}

// Initial State of course bloc
class CourseInitial extends CourseState {
  @override
  List<Object?> get props => [];
}

class CourseLoading extends CourseState {
  @override
  List<Object?> get props => [];
}

class CourseLoaded extends CourseState {
  final courseData;

  CourseLoaded({required this.courseData});

  @override
  List<Object?> get props => [courseData];
}

class CourseError extends CourseState {
  final String error;

  CourseError({required this.error});

  @override
  List<Object?> get props => [error];
}

// When course data is Loading
class TopicLoading extends CourseState {
  @override
  List<Object?> get props => [];
}

// When course data is loaded
class TopicLoaded extends CourseState {
  final List<dynamic> topicData;

  TopicLoaded({required this.topicData});

  @override
  List<Object?> get props => [topicData];
}

// When course data is not loaded due to some error
class TopicError extends CourseState {
  final String error;

  TopicError({required this.error});

  @override
  List<Object?> get props => [error];
}