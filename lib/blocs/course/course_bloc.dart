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
        var courseModules =
            await courseRepository.getCourseModule(event.courseId);
        emit(TopicLoaded(courseModules: courseModules, topicData: topicData));
      } catch (e) {
        emit(TopicError(error: e.toString()));
      }
    });
    on<CourseDataRequested>((event, emit) async {
      emit(CourseLoading());
      try {
        var courseData = await courseRepository.courseDetails(event.courseId);
        var courseModules =
            await courseRepository.getCourseModule(event.courseId);
        emit(CourseLoaded(courseData: courseData));
      } catch (e) {
        emit(CourseError(error: e.toString()));
      }
    });
    on<NotesAndBookmarkRequested>((event, emit) async {
      emit(NotesAndBookmarkLoading());
      try {
        var notesAndBookmark =
            await courseRepository.loadUserNotesAndBookmark(event.courseId);
        emit(NotesAndBookmarkLoaded(notesAndBookmarkData: notesAndBookmark));
      } catch (e) {
        emit(NotesAndBookmarkError(error: e.toString()));
      }
    });
  }
}
