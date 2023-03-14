part of 'course_bloc.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();
  @override
  List<Object> get props => [];
}

class TopicDataRequested extends CourseEvent {
  final String courseId;

  const TopicDataRequested({required this.courseId});
}

class CourseDataRequested extends CourseEvent {
  final String courseId;

  const CourseDataRequested({required this.courseId});
}
