import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user/user_course_model.dart';
import '../../repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<LearningFolderCourseRequested>((event, emit) async {
      emit(LearningFolderCourseLoading());
      try {
        final learningFolderCourses = await homeRepository.loadUserCourseData();
        emit(LearningFolderCourseLoaded(
            learningFolderCourses: learningFolderCourses));
      } catch (e) {
        emit(LearningFolderCourseError(error: e.toString()));
      }
    });
    on<LatestCourseRequested>((event, emit) async {
      emit(LatestCourseLoading());
      try {
        final prefs = await SharedPreferences.getInstance();
        String lspId = prefs.getString('lspId') ?? '';
        final latestCourses = await homeRepository.loadCourses(lspId);
        emit(LatestCourseLoaded(latestCourses: latestCourses));
      } catch (e) {
        emit(LatestCourseError(error: e.toString()));
      }
    });
    on<SubCategoryCourseRequested>((event, emit) async {
      emit(SubCategoryCourseLoading());
      try {
        final prefs = await SharedPreferences.getInstance();
        String lspId = prefs.getString('lspId') ?? '';
        final subCategoryCourses = await homeRepository.loadUserPreferences();
        List<Course> subCatCourses1 = subCategoryCourses['subCat1']!.toList();
        List<Course> subCatCourses2 = subCategoryCourses['subCat2']!.toList();
        List<Course> subCatCourses3 = subCategoryCourses['subCat3']!.toList();
        List<Course> subCatCourses4 = subCategoryCourses['subCat4']!.toList();
        List<Course> subCatCourses5 = subCategoryCourses['subCat5']!.toList();
        emit(SubCategoryCourseLoaded(
          subCatCourses1,
          subCatCourses2,
          subCatCourses3,
          subCatCourses4,
          subCatCourses5,
        ));
      } catch (e) {
        emit(SubCategoryCourseError(error: e.toString()));
      }
    });
  }
}
