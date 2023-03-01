part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class LatestCourseRequested extends HomeEvent {
  const LatestCourseRequested();
}

class LearningFolderCourseRequested extends HomeEvent {
  const LearningFolderCourseRequested();
}
