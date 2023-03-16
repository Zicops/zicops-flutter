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
        print('hi');
        final subCategoryCourses = await homeRepository.getSubCats();
        final userPref = await homeRepository.loadUserPref();

        print('subCategoryCourses: $subCategoryCourses');
        List<Course> subCatCourses1 = subCategoryCourses['subCat1']!.toList();
        List<Course> subCatCourses2 = subCategoryCourses['subCat2']!.toList();
        List<Course> subCatCourses3 = subCategoryCourses['subCat3']!.toList();
        List<Course> subCatCourses4 = subCategoryCourses['subCat4']!.toList();
        List<Course> subCatCourses5 = subCategoryCourses['subCat5']!.toList();

        // if (subCatCourses1.isNotEmpty) {
        //   subCatCourses1[0].subCategory = userPref[0].subCategory;
        // }else{
        //   subCatCourses1 = [];
        // }
        // if (subCatCourses2.isNotEmpty) {
        //   subCatCourses2[0].subCategory = userPref[1].subCategory;
        // }else{
        //   subCatCourses2 = [];
        // }
        // if (subCatCourses3.isNotEmpty) {
        //   subCatCourses3[0].subCategory = userPref[2].subCategory;
        // }else{
        //   subCatCourses3 = [];
        // }
        // if (subCatCourses4.isNotEmpty) {
        //   subCatCourses4[0].subCategory = userPref[3].subCategory;
        // }else{
        //   subCatCourses4 = [];
        // }
        // if (subCatCourses5.isNotEmpty) {
        //   subCatCourses5[0].subCategory = userPref[4].subCategory;
        // }else{
        //   subCatCourses5 = [];
        // }
        // print('subCatCourses1: $subCatCourses1');
        // print('subCatCourses2: $subCatCourses2');
        // print('subCatCourses3: $subCatCourses3');
        // print('subCatCourses4: $subCatCourses4');
        // print('subCatCourses5: $subCatCourses5');
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
  }
}
