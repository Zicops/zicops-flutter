part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

// Initial State of bloc when
class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class LatestCourseLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class LatestCourseLoaded extends HomeState {
  final List<Course> latestCourses;

  LatestCourseLoaded({required this.latestCourses});

  @override
  List<Object?> get props => [latestCourses];
}

class LearningFolderCourseLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class LearningFolderCourseLoaded extends HomeState {
  final List<Course> learningFolderCourses;

  LearningFolderCourseLoaded({required this.learningFolderCourses});

  @override
  List<Object?> get props => [learningFolderCourses];
}

class LearningFolderCourseError extends HomeState {
  final String error;

  LearningFolderCourseError({required this.error});

  @override
  List<Object?> get props => [error];
}
