import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../repositories/course_repository.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository courseRepository;
  CourseBloc({required this.courseRepository}) : super(CourseInitial()) {
    on<CourseRequested>((event, emit) async {
      emit(CourseLoading());
      try {
        List<dynamic> topicData = [];
        topicData = await courseRepository.loadCourse(event.courseId);
        emit(CourseLoaded(topicData: topicData));
      } catch (e) {
        emit(CourseError(error: e.toString()));
      }
    });
  }
}
