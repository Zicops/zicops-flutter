import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/user/user_course_model.dart';
import '../../repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<LearningFolderCourseRequested>((event, emit) {
      emit(LearningFolderCourseLoading());
      try {
        homeRepository.getLearningFolderCourses().then((learningFolderCourses) {
          emit(LearningFolderCourseLoaded(
              learningFolderCourses: learningFolderCourses));
        });
      } catch (e) {
        emit(LearningFolderCourseError(error: e.toString()));
      }

      // homeRepository.getLearningFolderCourses().then((learningFolderCourses) {
      //   emit(LearningFolderCourseLoaded(
      //       learningFolderCourses: learningFolderCourses));
      // });
    });
  }
}
