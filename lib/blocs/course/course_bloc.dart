import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../repositories/course_repository.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository courseRepository;
  CourseBloc({required this.courseRepository}) : super(CourseInitial()) {
    on<TopicDataRequested>((event, emit) async {
      emit(TopicLoading());
      try {
        List<dynamic> topicData = [];
        topicData = await courseRepository.topicData(event.courseId);
        emit(TopicLoaded(topicData: topicData));
      } catch (e) {
        emit(TopicError(error: e.toString()));
      }
    });
    on<CourseDataRequested>((event, emit) async {
      emit(CourseLoading());
      try {
        var courseData = await courseRepository.courseDetails(event.courseId);
        emit(CourseLoaded(courseData: courseData));
      } catch (e) {
        emit(CourseError(error: e.toString()));
      }
    });
  }
}
