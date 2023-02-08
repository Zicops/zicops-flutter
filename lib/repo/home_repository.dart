import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../graphql_api.graphql.dart';
import '../main.dart';
import '../models/user/user_course_model.dart';
import '../models/user/user_model.dart';

class HomeRepository {
  Future<List<Course>> getLatestCourse(String? subCat) async {
    final result = await courseQClient.client()?.execute(
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
    List<Course> courseData = [];
    for (int i in result?.data?.latestCourses?.courses?.asMap().keys ?? []) {
      final data = result?.data?.latestCourses?.courses?[i];
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
          image: data?.image,
        ),
      );
    }
    return courseData;
  }

  Future<List<Course>> loadUserCourseData() async {
    SharedPreferences sharedPreferences =
        await SharedPreferences?.getInstance();
    Map<String, dynamic> jsonDetails =
        jsonDecode(sharedPreferences.getString('user')!);
    var user = UserModel.fromJson(jsonDetails);
    final userCourseMap = await userClient?.client()?.execute(
        GetUserCourseMapsQuery(
            variables: GetUserCourseMapsArguments(
                user_id: user.id!,
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
      courseIds?.add(data?.courseId?.toString());
    }
    final courseRes = await courseQClient.client()?.execute(
        GetCourseQuery(variables: GetCourseArguments(course_id: courseIds)));
    final userCourseProgress = await userClient.client()?.execute(
        GetUserCourseProgressByMapIdQuery(
            variables: GetUserCourseProgressByMapIdArguments(
                userId: user.id!, userCourseId: userCourseIds)));

    List<dynamic> courseMeta = [];
    for (int i in assignedCourses?.asMap().keys ?? []) {
      var data = assignedCourses?[i];
      var courseData = courseRes?.data?.getCourse;
      var cpData = userCourseProgress?.data?.getUserCourseProgressByMapId
              ?.where((cp) => cp?.userCourseId == data?.userCourseId)
              ?.toList() ??
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
    for (int i in courseMeta?.asMap()?.keys ?? []) {
      var _courseData = courseMeta[i];
      var role = json.decode(_courseData?.addedBy);
      var topicsCompleted = 0;
      var topicsStarted = 0;
      List userProgressArr = _courseData?.courseProgress ?? [];

      for (int i in userProgressArr?.asMap()?.keys ?? []) {
        if (userProgressArr[i]?.status != 'non-started') ++topicsStarted;

        if (userProgressArr[i]?.status == 'completed') ++topicsCompleted;
      }
      int progressLength = userProgressArr?.length ?? 0;
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

    //  print(userCourseData.toString());
    return userCourseData;
  }
}
