import '../graphql_api.graphql.dart';
import '../main.dart';

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

  Future loadCourse(courseId) async {
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

    print(finalCourseData);
    topicData.addAll(data);
    // for topic data
    return topicData;
  }
}
