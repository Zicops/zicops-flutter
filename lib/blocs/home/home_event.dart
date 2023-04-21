part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

// Latest Course Events
class LatestCourseRequested extends HomeEvent {
  const LatestCourseRequested();
}

// Learning Folder Course Events
class LearningFolderCourseRequested extends HomeEvent {
  const LearningFolderCourseRequested();
}

// Learning Space Course Events
class LearningSpaceCourseRequested extends HomeEvent {
  const LearningSpaceCourseRequested();
}

// Ongoing Course Events
class OngoingCourseRequested extends HomeEvent {
  const OngoingCourseRequested();
}

// Sub Category Course Events
class SubCategoryCourseRequested extends HomeEvent {
  const SubCategoryCourseRequested();
}

// Quick Course Events
class QuickCourseRequested extends HomeEvent {
  const QuickCourseRequested();
}

// Slow Course Events
class SlowCourseRequested extends HomeEvent {
  const SlowCourseRequested();
}

class SearchRequested extends HomeEvent {
  final String searchQuery;
  final String language;
  const SearchRequested({required this.searchQuery, required this.language});
}
