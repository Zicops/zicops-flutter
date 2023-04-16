import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zicops/models/user/user_course_model.dart';

import '../graphql_api.graphql.dart';
import '../main.dart';

class HomeRepository {
  // Query for getting latest courses
  Future loadUserCourseData() async {
    List<String>? userCourseIds = [];
    List<String?> courseIds = [];

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString('userId');
    String? lspId = sharedPreferences.getString('lspId');
    //   String? lspId = ''

    // print('user id: $userId');
    // print('lsp id: $lspId');

    final userCourseMap = await userClient.client()?.execute(
        GetUserCourseMapsQuery(
            variables: GetUserCourseMapsArguments(
                user_id: userId ?? '',
                publish_time: DateTime.now().millisecondsSinceEpoch ~/ 1000,
                pageCursor: '',
                pageSize: 50,
                filters: CourseMapFilters(lspId: [lspId]))));

    // print(
    //     'userCourseMap: ${userCourseMap?.data?.getUserCourseMaps?.userCourses}');

    var assignedCourses = userCourseMap?.data?.getUserCourseMaps?.userCourses;

    // print('assignedCourses: $assignedCourses');

    for (int i in assignedCourses?.asMap().keys ?? []) {
      var data = assignedCourses?[i];
      userCourseIds.add(data?.userCourseId ?? '');
      courseIds.add(data?.courseId.toString());
    }

    // print('userCourseIds: $userCourseIds');
    // print('courseIds: $courseIds');

    final courseRes = await courseQClient.client()?.execute(
        GetCourseQuery(variables: GetCourseArguments(course_id: courseIds)));
    final userCourseProgress = await userClient.client()?.execute(
          GetUserCourseProgressByMapIdQuery(
            variables: GetUserCourseProgressByMapIdArguments(
                userId: userId!, userCourseId: userCourseIds),
          ),
        );

    // print('courseRes: ${courseRes?.data?.getCourse![0]?.name}');
    //  print('userCourseProgress: $userCourseProgress');

    List<dynamic> courseMeta = [];
    for (int i in assignedCourses?.asMap().keys ?? []) {
      var data = assignedCourses?[i];
      var courseData = courseRes?.data?.getCourse;
      var cpData = userCourseProgress?.data?.getUserCourseProgressByMapId
              ?.where((cp) => cp?.userCourseId == data?.userCourseId)
              .toList() ??
          [];

      var courseDetails = courseData
              ?.singleWhere((course) => course?.id == data?.courseId)
              ?.toJson() ??
          {};
      courseMeta.add(Course(
          id: courseDetails['id'],
          name: courseDetails['name'],
          publisher: courseDetails['publisher'],
          courseProgress: cpData,
          createdAt: data?.createdAt,
          endDate: data?.endDate,
          duration: courseDetails['duration'],
          addedBy: data?.addedBy,
          tileImage: courseDetails['tileImage'],
          image: courseDetails['image'],
          publishDate: courseDetails['publish_date'],
          owner: courseDetails['owner'],
          expertiseLevel: courseDetails['expertise_level'],
          userCourseId: courseDetails['user_course_id'],
          userLspId: courseDetails['user_lsp_id']));
    }
    //  print('courseMeta: $courseMeta');

    List<Course> userCourseData = [];
    //to calculate progress of user
    for (int i in courseMeta.asMap().keys) {
      var _courseData = courseMeta[i];
      var role = json.decode(_courseData?.addedBy);
      var topicsCompleted = 0;
      var topicsStarted = 0;
      List userProgressArr = _courseData?.courseProgress ?? [];

      for (int i in userProgressArr.asMap().keys) {
        if (userProgressArr[i]?.status != 'non-started') ++topicsStarted;

        if (userProgressArr[i]?.status == 'completed') ++topicsCompleted;
      }
      int progressLength = userProgressArr.length;
      double cProgress = ((topicsStarted * 100) / progressLength);
      double tProgress = ((topicsCompleted * 100) / progressLength);
      var courseProgress = userProgressArr.isNotEmpty ? cProgress.floor() : 0;
      var topicProgress = userProgressArr.isNotEmpty ? tProgress.floor() : 0;
      var courseDuration = _courseData?.duration;

      if (_courseData?.status == 'PUBLISHED') continue;

      // int? timeLeft =
      //     (courseDuration - (courseDuration * (topicProgress ?? 0)) / 100);

      userCourseData.add(Course(
          id: _courseData?.id,
          name: _courseData?.name,
          publisher: _courseData?.publisher,
          courseProgress: _courseData?.courseProgress,
          createdAt: _courseData?.createdAt,
          endDate: _courseData?.endDate,
          duration: _courseData?.duration,
          addedBy: role['role'],
          tileImage: _courseData?.tileImage,
          image: _courseData?.image,
          publishDate: _courseData?.publishDate,
          owner: _courseData?.owner,
          expertiseLevel: _courseData?.expertiseLevel,
          completedPercentage: topicProgress,
          topicsStartedPercentage: courseProgress,
          scheduleDate: _courseData?.endDate,
          userCourseId: _courseData?.userCourseId,
          userLspId: _courseData?.userLspId));
    }

    // print(userCourseData.toString());
    return userCourseData;
  }

  // Query for getting latest courses
  Future<List<Course>> loadCourses(Map<String, dynamic> obj) async {
    List<Course> courseData = [];

    /*  filterObj = {
      'LspId': '',
      'Category': '',
      'SubCategory': '',
      'Language': '',
      'DurationMin': '',
      'DurationMax': '',
      'Type': '',
      'SearchText': '',
    }*/

    String zicopsLspId = "8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1";

    // Filter options are : LspId String; Category String; SubCategory String; Language String; DurationMin Int; DurationMax Int; DurationMin Int; Type String;

    CoursesFilters courseFilters =
        CoursesFilters.fromJson({"LspId": zicopsLspId, ...obj});

    print(courseFilters.toJson());

    final allLatestCourse = await courseQClient.client()?.execute(
          LatestCoursesQuery(
            variables: LatestCoursesArguments(
              publishTime: DateTime.now().millisecondsSinceEpoch ~/ 1000,
              pageCursor: "",
              pageSize: 1000,
              filters: courseFilters,
              Direction: "",
            ),
          ),
        );

    for (int i
        in allLatestCourse?.data?.latestCourses?.courses?.asMap().keys ?? []) {
      final data = allLatestCourse?.data?.latestCourses?.courses?[i];

      if (data!.isActive! && data.isDisplay!) {
        courseData.add(Course.fromJson(data.toJson()));
      }
    }

    return courseData;
  }

  // Future<List<Course>> loadCoursesNew(String lspId, {String? subCat}) async {
  //   List<Course> courseData = [];

  //   final allLatestCourse = await courseQClient.client()?.execute(
  //         LatestCoursesQuery(
  //           variables: LatestCoursesArguments(
  //             publishTime: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  //             pageCursor: "",
  //             pageSize: 1000,
  //             filters: CoursesFilters(lspId: lspId, subCategory: subCat),
  //             Direction: "",
  //           ),
  //         ),
  //       );

  //   for (int i
  //       in allLatestCourse?.data?.latestCourses?.courses?.asMap().keys ?? []) {
  //     final data = allLatestCourse?.data?.latestCourses?.courses?[i];
  //     if (data!.isActive! && data.isDisplay!) {
  //       courseData.add(Course.fromJson(data.toJson()));
  //     }
  //   }

  //   return courseData;
  // }

  Future loadUserPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString('userId');
    String? lspId = sharedPreferences.getString('lspId');
    String? userLspId;

    List userPreferences = [];
    final lspData = await userClient.client()?.execute(GetUserLspByLspIdQuery(
        variables: GetUserLspByLspIdArguments(
            user_id: userId ?? '', lsp_id: lspId ?? "")));

    userLspId = lspData?.data?.getUserLspByLspId?.userLspId;

    final res = await userClient.client()?.execute(GetUserPreferencesQuery(
        variables: GetUserPreferencesArguments(userId: userId!)));

    for (int i in res?.data?.getUserPreferences?.asMap().keys ?? []) {
      final data = res?.data?.getUserPreferences?[i];
      if (data!.userLspId == userLspId &&
          userPreferences.length < 5 &&
          data.isActive) {
        userPreferences.add(data.subCategory);
      }
    }
    return userPreferences;
  }

  Future getSubCats() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString('userId');
    String? lspId = sharedPreferences.getString('lspId');
    String? userLspId;

    List userPreferences = [];
    userPreferences = await loadUserPref();
    Map<String, List<Course>> subCats = {};

    bool isEmpty = true;
    if (userPreferences.isNotEmpty) {
      for (var i in userPreferences.asMap().keys) {
        var index = i + 1;
        subCats['subCat$index'] = await loadCourses(
            { "SubCategory": userPreferences[i]});

        if (subCats['subCat$index']!.isNotEmpty) {
          isEmpty = false;
        }
      }
    }

    return subCats;
  }
}
