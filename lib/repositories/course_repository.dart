import 'package:shared_preferences/shared_preferences.dart';

import '../graphql_api.graphql.dart';
import '../main.dart';
import '../models/courseDetails/user_course_details.dart';

class CourseRepository {
  Map<String, dynamic> combineData(Map data1, Map data2) {
    Map<String, dynamic> result = {'dummy': 'test'};
    // loop over first data
    for (var i in data1.keys) {
      result['$i'] = data1[i];
    }
    for (var j in data2.keys) {
      result['$j'] = data2[j];
    }
    return result;
  }

  Future courseDetails(courseId) async {
    //print('courseId $courseId');
    final result = await courseQClient.client()?.execute(GetCourseDataQuery(
        variables: GetCourseDataArguments(course_id: courseId)));
    final courseData = result?.data?.toJson();
    List courseModules = courseData?['getCourseModules'];
    List courseTopics = courseData?['getTopics'];
    List courseResouces = courseData?['getResourcesByCourseId'];
    List courseChapters = courseData?['getCourseChapters'];
    var courseDetails = courseData?['getCourse'];
    // print('rwehwrth ${courseChapters.length}.');
    return courseData;
  }

  Future getCourseResources(courseId) async {
    final result = await courseQClient.client()?.execute(GetCourseDataQuery(
        variables: GetCourseDataArguments(course_id: courseId)));
    final courseData = result?.data?.toJson();
    //print(courseData);
    List courseResouces = courseData?['getResourcesByCourseId'];
    return courseResouces;
  }

  Future getCourseModule(courseId) async {
    final result = await courseQClient.client()?.execute(GetCourseDataQuery(
        variables: GetCourseDataArguments(course_id: courseId)));
    final courseData = result?.data?.toJson();

    List courseModules = courseData?['getCourseModules'];
    return courseModules;
  }

  Future getCourseChapters(courseId) async {
    final result = await courseQClient.client()?.execute(GetCourseDataQuery(
        variables: GetCourseDataArguments(course_id: courseId)));
    final courseData = result?.data?.toJson();

    List courseChapters = courseData?['getCourseChapters'];
    return courseChapters;
  }

  Future topicData(courseId) async {
    // steps to load a course
    // 1. getCourseModules , getCourseModules, getCourseChapter, getModulContent
    List<String> moduleIds = [];
    List<String> topicIds = [];
    List<dynamic> topicData = [];
    List<dynamic> contentData = [];

    final result = await courseQClient.client()?.execute(GetCourseDataQuery(
        variables: GetCourseDataArguments(course_id: courseId)));
    final courseData = result?.data?.toJson();

    List courseModules = courseData?['getCourseModules'];

    List courseTopics = courseData?['getTopics'];

    List courseResouces = courseData?['getResourcesByCourseId'];

    var courseDetails = courseData?['getCourse'];

    if (courseModules.isNotEmpty) {
      courseModules.sort((module1, module2) =>
          module1?['sequence'].compareTo(module2?['sequence']));
    }

    for (int i in courseModules.asMap().keys) {
      final _contentData = await courseQClient.client()?.execute(
          GetModuleContentQuery(
              variables: GetModuleContentArguments(
                  module_id: courseModules[i]['id'])));
      final moduleContent = _contentData?.data?.toJson();
      contentData.addAll(moduleContent?['getTopicContentByModuleId']);
    }

    List data = [];
    Map<String, List> finalCourseData = {'id': []};
    for (int i in courseTopics.asMap().keys) {
      for (int j in contentData.asMap().keys) {
        if (courseTopics[i]['id'] == contentData[j]['topicId']) {
          data.add(combineData(courseTopics[i], contentData[j]));
        }
      }
    }

    for (int i in courseModules.asMap().keys) {
      var topics = [];
      for (int j in data.asMap().keys) {
        if (courseModules[i]['id'] == data[j]['moduleId']) {
          topics.add(data[j]);
        }
      }
      finalCourseData.addAll({courseModules[i]['id']: topics});
    }

    // print(finalCourseData);
    topicData.addAll(data);

    topicData.sort((a, b) => a['sequence'].compareTo(b['sequence']));
    // print(topicData);
    // for topic data
    return topicData;
  }

  Future loadUserNotesAndBookmark(String courseId) async {
    final prefs = await SharedPreferences.getInstance();
    // this is the function to get user notes and bookmarks. Notes that this will only be called when course is assigned to the user.
    // this query need user id, user_lsp_id, current epoch time in unix,pagecursor etc and returns there notes and bookmarks if any present.
    String? userId = prefs.getString('userId');
    String? userLspId = prefs.getString('userLspId');
    int publishTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    // this is the course id which we have clicked on
    //String courseId = "da5c2348-62ef-4725-838a-c1c23170b1bc";
    final res = await userClient.client()?.execute(GetUserNotesBookmarksQuery(
        variables: GetUserNotesBookmarksArguments(
            user_id: userId!,
            user_lsp_id: '96a30957-3bd8-41cc-87ad-9c863d423c3e',
            publish_time: publishTime,
            pageCursor: '',
            pageSize: 100,
            course_id: courseId)));

    //  print(res?.data?.toJson());
    // this is basically map containing getUserNotes and getUserBookmarks keys from which you will get users notes and book marks.
    return res?.data?.toJson();
  }

  Future getUserCourseMaps() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString('userId');
    String? lspId = sharedPreferences.getString('lspId');
    final userCourseMap = await userClient.client()?.execute(
        GetUserCourseMapsQuery(
            variables: GetUserCourseMapsArguments(
                user_id: userId ?? '',
                publish_time: DateTime.now().millisecondsSinceEpoch ~/ 1000,
                pageCursor: '',
                pageSize: 50,
                filters: CourseMapFilters(lspId: [lspId]))));

    List<UserCourseMap> assignedCourses = [];
    var courses = userCourseMap?.data?.getUserCourseMaps?.userCourses;
    if (courses != null) {
      courses.forEach((course) {
        if (course?.courseStatus.toLowerCase() != 'disable') {
          assignedCourses.add(UserCourseMap(
            userCourseId: course?.userCourseId,
            userId: course?.userId,
            courseId: course?.courseId,
            courseStatus: course?.courseStatus,
            courseType: course?.courseType,
            isMandatory: course?.isMandatory,
            userLspId: course?.userLspId,
            addedBy: course?.addedBy,
            createdAt: course?.createdAt,
            createdBy: course?.createdBy,
            endDate: course?.endDate,
            updatedAt: course?.updatedAt,
            updatedBy: course?.updatedBy,
          ));
        }
      });
    }
    return assignedCourses;
  }

  Future isCourseAssigned(String courseId) async {
    var assignedCourses = await getUserCourseMaps();
    var isCourseAssigned = false;
    for (int i in assignedCourses!.asMap().keys) {
      if (assignedCourses[i]?.courseId == courseId) {
        isCourseAssigned = true;
      }
    }
    return isCourseAssigned;
  }

  Future getUserCourseMapByCourseId(String courseId) async {
    var assignedCourses = await getUserCourseMaps();
    UserCourseMap courseMap = UserCourseMap();
    for (int i in assignedCourses!.asMap().keys) {
      if (assignedCourses[i]?.courseId == courseId) {
        courseMap = assignedCourses[i];
      }
    }
    return courseMap;
  }

  Future getUserCourseProgress(String courseId) async {
    final UserCourseMap courseMap = await getUserCourseMapByCourseId(courseId);
    String userCourseId = courseMap.userCourseId!;
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    final res =
        await userClient.client()?.execute(GetUserCourseProgressByMapIdQuery(
                variables: GetUserCourseProgressByMapIdArguments(
              userId: userId!,
              userCourseId: [userCourseId],
            )));
    // print(res);
    return res;
  }
}
