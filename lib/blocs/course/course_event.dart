part of 'course_bloc.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();
  @override
  List<Object> get props => [];
}

class CourseRequested extends CourseEvent {
  final String courseId;

  const CourseRequested({required this.courseId});
}
