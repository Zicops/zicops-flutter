import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user/user_course_model.dart';
import '../../repositories/home_repository.dart';
import '../../utils/constants.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<OngoingCourseRequested>((event, emit) async {
      emit(OngoingCourseLoading());
      try {
        final ongoingCourses = await homeRepository
            .loadUserCourseData({'status': CourseMapStatus['started']});
        emit(OngoingCourseLoaded(ongoingCourses: ongoingCourses));
      } catch (e) {
        emit(OngoingCourseError(error: e.toString()));
      }
    });
    on<LearningFolderCourseRequested>((event, emit) async {
      emit(LearningFolderCourseLoading());
      try {
        final learningFolderCourses = await homeRepository
            .loadUserCourseData({'status': CourseMapStatus['assign']});
        emit(LearningFolderCourseLoaded(
            learningFolderCourses: learningFolderCourses));
      } catch (e) {
        emit(LearningFolderCourseError(error: e.toString()));
      }
    });
    on<LatestCourseRequested>((event, emit) async {
      emit(LatestCourseLoading());
      try {
        final latestCourses = await homeRepository.loadCourses({});

        emit(LatestCourseLoaded(latestCourses: latestCourses));
      } catch (e) {
        emit(LatestCourseError(error: e.toString()));
      }
    });
    on<LearningSpaceCourseRequested>((event, emit) async {
      emit(LearningSpaceCourseLoading());
      try {
        final prefs = await SharedPreferences.getInstance();
        String lspId = prefs.getString('lspId') ?? '';
        final learningSpaceCourses =
            await homeRepository.loadCourses({"LspId": lspId});

        emit(LearningSpaceCourseLoaded(
            learningSpaceCourses: learningSpaceCourses));
      } catch (e) {
        emit(LearningSpaceCourseError(error: e.toString()));
      }
    });
    on<SubCategoryCourseRequested>((event, emit) async {
      emit(SubCategoryCourseLoading());
      try {
        final prefs = await SharedPreferences.getInstance();
        String lspId = prefs.getString('lspId') ?? '';
        final subCategoryCourses = await homeRepository.getSubCats();
        final userPref = await homeRepository.loadUserPref();

        // print('subCategoryCourses: $subCategoryCourses');
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
          userPref,
        ));
      } catch (e) {
        emit(SubCategoryCourseError(error: e.toString()));
      }
    });
    on<QuickCourseRequested>((event, emit) async {
      emit(QuickCourseLoading());
      try {
        final prefs = await SharedPreferences.getInstance();
        String lspId = prefs.getString('lspId') ?? '';

        final quickCourses =
            await homeRepository.loadCourses({"DurationMax": 60 * 60});

        emit(QuickCourseLoaded(quickCourses: quickCourses));
      } catch (e) {
        emit(QuickCourseError(error: e.toString()));
      }
    });
    on<SlowCourseRequested>((event, emit) async {
      emit(SlowCourseLoading());
      try {
        final prefs = await SharedPreferences.getInstance();
        String lspId = prefs.getString('lspId') ?? '';

        final slowCourses =
            await homeRepository.loadCourses({"DurationMin": 360 * 60});

        emit(SlowCourseLoaded(slowCourses: slowCourses));
      } catch (e) {
        emit(SlowCourseError(error: e.toString()));
      }
    });
    on<SearchRequested>((event, emit) async {
      emit(SearchLoading());
      try {
        final prefs = await SharedPreferences.getInstance();
        String lspId = prefs.getString('lspId') ?? '';
        final searchCourses = await homeRepository.loadCourses(
            {'SearchText': event.searchQuery, 'Language': event.language});
        emit(SearchLoaded(searchCourses: searchCourses));
      } catch (e) {
        emit(SearchError(error: e.toString()));
      }
    });
  }
}
