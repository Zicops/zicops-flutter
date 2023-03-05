part of 'course_bloc.dart';

@immutable
abstract class CourseState extends Equatable {}

// Initial State of course bloc
class CourseInitial extends CourseState {
  @override
  List<Object?> get props => [];
}

// When course data is Loading
class CourseLoading extends CourseState {
  @override
  List<Object?> get props => [];
}

// When course data is loaded
class CourseLoaded extends CourseState {
  final List<dynamic> topicData;

  CourseLoaded({required this.topicData});

  @override
  List<Object?> get props => [topicData];
}

// When course data is not loaded due to some error
class CourseError extends CourseState {
  final String error;

  CourseError({required this.error});

  @override
  List<Object?> get props => [error];
}
