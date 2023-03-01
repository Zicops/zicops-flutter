import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zicops/models/user/user_course_model.dart';

import '../graphql_api.graphql.dart';
import '../main.dart';

class HomeRepository {
  Future<List<Course>> loadCourses({String lspId = '', String? subCat}) async {
    List<Course> courseData = [];
    final allLatestCourse = await courseQClient.client()?.execute(
          LatestCoursesQuery(
            variables: LatestCoursesArguments(
              publishTime: DateTime.now().millisecondsSinceEpoch ~/ 1000,
              pageCursor: "",
              pageSize: 1000,
              filters: CoursesFilters(lspId: lspId, subCategory: subCat),
              Direction: "",
            ),
          ),
        );

    for (int i
        in allLatestCourse?.data?.latestCourses?.courses?.asMap().keys ?? []) {
      final data = allLatestCourse?.data?.latestCourses?.courses?[i];
      courseData.add(
        Course(
            id: data?.id,
            name: data?.name,
            publisher: data?.publisher,
            description: data?.description,
            expertiseLevel: data?.expertiseLevel,
            owner: data?.owner,
            isDisplay: data?.isDisplay,
            type: data?.type,
            tileImage: data?.tileImage,
            //subCategories: data?.subCategories,
            image: data?.image),
      );
    }
    return courseData;
  }

  Future<List<Course>> loadUserCourseData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString('userId');
    String? lspId = sharedPreferences.getString('lspId');
    final userCourseMap = await userClient.client()?.execute(
        GetUserCourseMapsQuery(
            variables: GetUserCourseMapsArguments(
                user_id: userId!,
                publish_time:
                    (DateTime.now().millisecondsSinceEpoch / 1000).toInt(),
                pageCursor: '',
                pageSize: 50,
                filters: new CourseMapFilters(lspId: [lspId]))));

    List<String>? userCourseIds = [];
    List<String?> courseIds = [];

    var assignedCourses = userCourseMap?.data?.getUserCourseMaps?.userCourses;

    for (int i in assignedCourses?.asMap().keys ?? []) {
      var data = assignedCourses?[i];
      userCourseIds.add(data?.userCourseId ?? '');
      courseIds.add(data?.courseId.toString());
    }
    final courseRes = await courseQClient.client()?.execute(
        GetCourseQuery(variables: GetCourseArguments(course_id: courseIds)));
    final userCourseProgress = await userClient.client()?.execute(
          GetUserCourseProgressByMapIdQuery(
            variables: GetUserCourseProgressByMapIdArguments(
                userId: userId!, userCourseId: userCourseIds),
          ),
        );

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

    print(userCourseData.toString());
    return userCourseData;
  }

  Future loadUserPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString('userId');
    String? lspId = sharedPreferences.getString('lspId');
    String? userLspId;

    List userPreferences = [];
    Map<String, List> subCats = {};
    List subCatCourses1 = [];
    List subCatCourses2 = [];
    List subCatCourses3 = [];
    List subCatCourses4 = [];
    List subCatCourses5 = [];

    final lspData = await userClient.client()?.execute(GetUserLspByLspIdQuery(
        variables: GetUserLspByLspIdArguments(
            user_id: userId ?? '', lsp_id: lspId ?? "")));

    userLspId = lspData?.data?.getUserLspByLspId?.userLspId;

    final res = await userClient.client()?.execute(GetUserPreferencesQuery(
        variables: GetUserPreferencesArguments(userId: userId!)));

    print(res?.data?.getUserPreferences?.length);

    for (int i in res?.data?.getUserPreferences?.asMap().keys ?? []) {
      final data = res?.data?.getUserPreferences?[i];
      if (data!.userLspId == userLspId &&
          userPreferences.length < 5 &&
          data.isActive) {
        print(data.subCategory);
        userPreferences.add(data.subCategory);
      }
    }

    bool isEmpty = true;
    if (userPreferences.isNotEmpty) {
      for (var i in userPreferences.asMap().keys) {
        var index = i + 1;
        subCats['subCat$index'] =
            await loadCourses(lspId: lspId!, subCat: userPreferences[i]);

        if (subCats['subCat$index']!.isNotEmpty) {
          isEmpty = false;
        }
      }

      print(subCats);
      subCatCourses1 = subCats['subCat1']!.toList();
      subCatCourses2 = subCats['subCat2']!.toList();
      subCatCourses3 = subCats['subCat3']!.toList();
      subCatCourses4 = subCats['subCat4']!.toList();
      subCatCourses5 = subCats['subCat5']!.toList();
    }

    subCatCourses1[0].subCategory = userPreferences[0];
    subCatCourses2[0].subCategory = userPreferences[1];
    subCatCourses3[0].subCategory = userPreferences[2];
    subCatCourses4[0].subCategory = userPreferences[3];
    subCatCourses5[0].subCategory = userPreferences[4];

    return subCats;
  }

  Future getLearningFolderCourses() async {
    List<Course> learningFolderCourses = [];

    loadUserCourseData();
    return learningFolderCourses;
  }
}
