part of 'course_bloc.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();
  @override
  List<Object> get props => [];
}

class CourseDataRequested extends CourseEvent {
  final String courseId;

  const CourseDataRequested({required this.courseId});
}

class TopicDataRequested extends CourseEvent {
  final String courseId;

  const TopicDataRequested({required this.courseId});
}

class NotesAndBookmarkRequested extends CourseEvent {
  final String courseId;

  const NotesAndBookmarkRequested({required this.courseId});
}

class ResourceDataRequested extends CourseEvent {
  final String courseId;

  const ResourceDataRequested({required this.courseId});
}
