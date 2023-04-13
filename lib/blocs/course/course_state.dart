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
  final isCourseAssigned;
  final userCourseMap;

  CourseLoaded({
    required this.courseData,
    required this.isCourseAssigned,
    required this.userCourseMap,
  });

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
  final courseModules;
  final courseChapters;
  final courseProgress;

  TopicLoaded({
    required this.courseModules,
    required this.topicData,
    required this.courseChapters,
    required this.courseProgress,
  });

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

class NotesAndBookmarkLoading extends CourseState {
  @override
  List<Object?> get props => [];
}

class NotesAndBookmarkLoaded extends CourseState {
  final List<dynamic> topicData;
  final notesAndBookmarkData;
  final courseModules;

  NotesAndBookmarkLoaded(
      {required this.topicData,
      required this.courseModules,
      required this.notesAndBookmarkData});

  @override
  List<Object?> get props => [notesAndBookmarkData];
}

class NotesAndBookmarkError extends CourseState {
  final String error;

  NotesAndBookmarkError({required this.error});

  @override
  List<Object?> get props => [error];
}

class ResourcesLoading extends CourseState {
  @override
  List<Object?> get props => [];
}

class ResourcesLoaded extends CourseState {
  final List<dynamic> topicData;
  final resourcesData;
  final courseModules;

  ResourcesLoaded(
      {required this.topicData,
      required this.courseModules,
      required this.resourcesData});

  @override
  List<Object?> get props => [resourcesData];
}

class ResourcesError extends CourseState {
  final String error;

  ResourcesError({required this.error});

  @override
  List<Object?> get props => [error];
}
