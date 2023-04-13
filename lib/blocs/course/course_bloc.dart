import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../repositories/course_repository.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository courseRepository;
  CourseBloc({required this.courseRepository}) : super(CourseInitial()) {
    on<CourseDataRequested>((event, emit) async {
      emit(CourseLoading());
      try {
        var courseData = await courseRepository.courseDetails(event.courseId);
        var courseModules =
            await courseRepository.getCourseModule(event.courseId);
        var isCourseAssigned =
            await courseRepository.isCourseAssigned(event.courseId);
        var userCourseMap =
            await courseRepository.getUserCourseMapByCourseId(event.courseId);
        emit(CourseLoaded(
          courseData: courseData,
          isCourseAssigned: isCourseAssigned,
          userCourseMap: userCourseMap,
        ));
      } catch (e) {
        emit(CourseError(error: e.toString()));
      }
    });
    on<TopicDataRequested>((event, emit) async {
      emit(TopicLoading());
      try {
        List<dynamic> topicData = [];
        topicData = await courseRepository.topicData(event.courseId);
        var courseModules =
            await courseRepository.getCourseModule(event.courseId);
        var courseChapters =
            await courseRepository.getCourseChapters(event.courseId);
        var userCourseProgress =
            await courseRepository.getUserCourseProgress(event.courseId);
        emit(TopicLoaded(
          courseModules: courseModules,
          topicData: topicData,
          courseChapters: courseChapters,
          courseProgress: userCourseProgress,
        ));
      } catch (e) {
        emit(TopicError(error: e.toString()));
      }
    });
    on<NotesAndBookmarkRequested>((event, emit) async {
      emit(NotesAndBookmarkLoading());
      try {
        List<dynamic> topicData = [];
        topicData = await courseRepository.topicData(event.courseId);
        var notesAndBookmark =
            await courseRepository.loadUserNotesAndBookmark(event.courseId);
        var courseModules =
            await courseRepository.getCourseModule(event.courseId);
        emit(NotesAndBookmarkLoaded(
            topicData: topicData,
            courseModules: courseModules,
            notesAndBookmarkData: notesAndBookmark));
      } catch (e) {
        emit(NotesAndBookmarkError(error: e.toString()));
      }
    });
    on<ResourceDataRequested>((event, emit) async {
      emit(ResourcesLoading());
      try {
        var courseModules =
            await courseRepository.getCourseModule(event.courseId);
        var topicData = await courseRepository.topicData(event.courseId);
        var resourceData =
            await courseRepository.getCourseResources(event.courseId);
        emit(ResourcesLoaded(
          courseModules: courseModules,
          resourcesData: resourceData,
          topicData: topicData,
        ));
      } catch (e) {
        emit(ResourcesError(error: e.toString()));
      }
    });
  }
}
