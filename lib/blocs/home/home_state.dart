part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

// Initial State of bloc when
class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

// Latest Course States
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

class LatestCourseError extends HomeState {
  final String error;

  LatestCourseError({required this.error});

  @override
  List<Object?> get props => [error];
}

// Ongoing Course States
class OngoingCourseLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class OngoingCourseLoaded extends HomeState {
  final List<Course> ongoingCourses;

  OngoingCourseLoaded({required this.ongoingCourses});

  @override
  List<Object?> get props => [ongoingCourses];
}

class OngoingCourseError extends HomeState {
  final String error;

  OngoingCourseError({required this.error});

  @override
  List<Object?> get props => [error];
}

// Learning Folder Course States
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

// Learning Space Course States
class LearningSpaceCourseLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class LearningSpaceCourseLoaded extends HomeState {
  final List<Course> learningSpaceCourses;

  LearningSpaceCourseLoaded({required this.learningSpaceCourses});

  @override
  List<Object?> get props => [learningSpaceCourses];
}

class LearningSpaceCourseError extends HomeState {
  final String error;

  LearningSpaceCourseError({required this.error});

  @override
  List<Object?> get props => [error];
}

//Sub Category Course States
class SubCategoryCourseLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class SubCategoryCourseLoaded extends HomeState {
  final List<Course> subCategoryCourses1;
  final List<Course> subCategoryCourses2;
  final List<Course> subCategoryCourses3;
  final List<Course> subCategoryCourses4;
  final List<Course> subCategoryCourses5;
  final userPref;
  SubCategoryCourseLoaded(
    this.subCategoryCourses1,
    this.subCategoryCourses2,
    this.subCategoryCourses3,
    this.subCategoryCourses4,
    this.subCategoryCourses5,
    this.userPref,
  );

  @override
  List<Object?> get props => [
        subCategoryCourses1,
        subCategoryCourses2,
        subCategoryCourses3,
        subCategoryCourses4,
        subCategoryCourses5
      ];
}

class SubCategoryCourseError extends HomeState {
  final String error;

  SubCategoryCourseError({required this.error});

  @override
  List<Object?> get props => [error];
}

// Quick Course states
class QuickCourseLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class QuickCourseLoaded extends HomeState {
  final List<Course> quickCourses;

  QuickCourseLoaded({required this.quickCourses});

  @override
  List<Object?> get props => [quickCourses];
}

class QuickCourseError extends HomeState {
  final String error;

  QuickCourseError({required this.error});

  @override
  List<Object?> get props => [error];
}

// Slow Course states
class SlowCourseLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class SlowCourseLoaded extends HomeState {
  final List<Course> slowCourses;

  SlowCourseLoaded({required this.slowCourses});

  @override
  List<Object?> get props => [slowCourses];
}

class SlowCourseError extends HomeState {
  final String error;

  SlowCourseError({required this.error});

  @override
  List<Object?> get props => [error];
}

// For search
class SearchLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class SearchLoaded extends HomeState {
  final List<Course> searchCourses;
  SearchLoaded({required this.searchCourses});
  @override
  List<Object?> get props => [searchCourses];
}

class SearchError extends HomeState {
  final String error;
  SearchError({required this.error});
  @override
  List<Object?> get props => [error];
}
