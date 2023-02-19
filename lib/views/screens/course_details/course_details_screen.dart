import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zicops/controllers/controller.dart';
import 'package:zicops/graphql_api.graphql.dart';
import 'package:zicops/main.dart';
import 'package:zicops/views/screens/course_details/resources/resources_screen.dart';
import 'package:zicops/views/screens/course_details/topic/topic_screen.dart';

import '../../../utils/colors.dart';
import '../../widgets/main_tab.dart';
import '../search/search_screen.dart';
import 'about/about_screen.dart';
import 'notes/notes_screen.dart';

class CourseDetailsScreen extends StatefulWidget {
  String courseId;
  CourseDetailsScreen(this.courseId, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CourseDetailsScreen();
  }
}

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

// Future loadCourse(courseId) async {
// // steps to load a course
// // 1. getCourseModules , getCourseModules, getCourseChapter, getModulContent
//   List<String> moduleIds = [];
//   List<String> topicIds = [];
//   List<dynamic> contentData = [];
//   final result = await courseQClient.client()?.execute(GetCourseDataQuery(
//       variables: GetCourseDataArguments(course_id: courseId)));
//   final courseData = result?.data?.toJson();
//   List courseModules = courseData?['getCourseModules'];
//   List courseTopics = courseData?['getTopics'];
//   for (int i in courseModules.asMap().keys) {
//     final _contentData = await courseQClient.client()?.execute(
//         GetModuleContentQuery(
//             variables:
//                 GetModuleContentArguments(module_id: courseModules[i]['id'])));

//     final moduleContent = _contentData?.data?.toJson();
//     contentData.addAll(moduleContent?['getTopicContentByModuleId']);
//   }

//   List data = [];
//   for (int i in courseTopics.asMap().keys) {
//     for (int j in contentData.asMap().keys) {
//       if (courseTopics[i]['id'] == contentData[j]['topicId']) {
//         data.add(combineData(courseTopics[i], contentData[j]));
//       }
//     }
//   }

// }

class _CourseDetailsScreen extends State<CourseDetailsScreen> {
  int _selectedTab = 0;
  final _controller = Get.find<Controller>();

  Future loadCourse(courseId) async {
    List<String> moduleIds = [];
    List<String> topicIds = [];
    List<dynamic> contentData = [];
    final result = await courseQClient.client()?.execute(GetCourseDataQuery(
        variables: GetCourseDataArguments(course_id: courseId)));
    final courseData = result?.data?.toJson();
    List courseModules = courseData?['getCourseModules'];
    List courseTopics = courseData?['getTopics'];
    for (int i in courseModules.asMap().keys) {
      final _contentData = await courseQClient.client()?.execute(
          GetModuleContentQuery(
              variables: GetModuleContentArguments(
                  module_id: courseModules[i]['id'])));

      final moduleContent = _contentData?.data?.toJson();
      contentData.addAll(moduleContent?['getTopicContentByModuleId']);
    }

    List data = [];
    for (int i in courseTopics.asMap().keys) {
      for (int j in contentData.asMap().keys) {
        if (courseTopics[i]['id'] == contentData[j]['topicId']) {
          data.add(combineData(courseTopics[i], contentData[j]));
        }
      }
    }

    _controller.topicData.addAll(data);
  }

  getScreen() {
    switch (_selectedTab) {
      case 0:
        return const TopicScreen();
      case 1:
        return const NotesScreen();
      case 2:
        return const ResourcesScreen();
      case 3:
        return const AboutScreen();
      default:
        return const AboutScreen();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // var courseId = '91a49abe-f532-4a80-928b-cf0bf3b79a6f';
    //var courseId2 = '4d5df222-34cf-444c-86cd-2b0128fa40e6';
    print(widget.courseId);
    loadCourse(widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48.sp),
          child: AppBar(
            backgroundColor: secondaryColor,
            elevation: 0,
            leading: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (Navigator.canPop(context)) Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      right: 4.sp, top: 16.sp, bottom: 16.sp, left: 20.sp),
                  child: Image.asset(
                    "assets/images/back_arrow.png",
                    height: 16.sp,
                    width: 16.sp,
                  ),
                )),
            leadingWidth: 40.sp,
            title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchScreen()));
                      },
                      child: Container(
                          width: 24.sp,
                          height: 24.sp,
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/search.png",
                            width: 18.sp,
                            height: 18.sp,
                            color: textPrimary,
                          ))),
                  SizedBox(
                    width: 16.sp,
                  )
                ]),
          ),
        ),
        backgroundColor: secondaryColorDark,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 48.sp,
                color: secondaryColor,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTab = 0;
                          });
                        },
                        child: SizedBox(
                          child: mainTab(82, "Topic", 0, _selectedTab),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTab = 1;
                          });
                        },
                        child: SizedBox(
                          child: mainTab(84, "Notes", 1, _selectedTab),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTab = 2;
                          });
                        },
                        child: SizedBox(
                          child: mainTab(121, "Resources", 2, _selectedTab),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTab = 3;
                          });
                        },
                        child: SizedBox(
                          child: mainTab(87, "About", 3, _selectedTab),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: getScreen(),
              )
            ]));
  }
}
