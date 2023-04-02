import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/blocs/course/course_bloc.dart';
import 'package:zicops/models/courseDetails/user_course_details.dart';
import 'package:zicops/repositories/course_repository.dart';
import 'package:zicops/views/screens/course_details/resources/resources_screen.dart';
import 'package:zicops/views/screens/course_details/topic/topic_screen.dart';

import '../../../utils/colors.dart';
import '../../widgets/main_tab.dart';
import '../search/search_screen.dart';
import 'about/about_screen.dart';
import 'notes/notes_screen.dart';

class CourseDetailsScreen extends StatefulWidget {
 final String courseId;
  final  String courseName;
 final String difficulty;
  final String preview;

  const CourseDetailsScreen(
      this.courseId, this.courseName, this.difficulty, this.preview,
      {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CourseDetailsScreen();
  }
}

class _CourseDetailsScreen extends State<CourseDetailsScreen> {
  int _selectedTab = 0;
  List<dynamic> topicData = [];
  var isCourseAssigned = false;
  UserCourseMap userCourseMap = UserCourseMap();
  getScreen(isCourseAssigned) {
    print("isCourseAssigned: $isCourseAssigned");
    switch (_selectedTab) {
      case 0:
        return  AboutScreen( courseId: widget.courseId,
          isCourseAssigned: isCourseAssigned,);
      case 1:
        return  TopicScreen(widget.courseId,
          widget.difficulty,
          widget.preview,
          isCourseAssigned,
          userCourseMap,);
      case 2:
        return  NotesScreen(  courseId: widget.courseId,
          preview: widget.preview,
          isCourseAssigned: isCourseAssigned,);
      case 3:
        return  ResourcesScreen(  widget.courseId,
          isCourseAssigned,);
      default:
        return AboutScreen(
          courseId: widget.courseId,
          isCourseAssigned: isCourseAssigned,
        );
    }
  }

  @override
  void initState() {
    super.initState();

    print(widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseBloc(courseRepository: CourseRepository())
        ..add(CourseDataRequested(
          courseId: widget.courseId,
        )),
      child: BlocConsumer<CourseBloc, CourseState>(
        listener: (context, state) {
          if (state is CourseLoaded) {
            isCourseAssigned = state.isCourseAssigned;
            if (isCourseAssigned) {
              userCourseMap = state.userCourseMap;
            }
          }
        },
        builder: (context, state) {
          if (state is CourseLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
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
                            right: 4.sp,
                            top: 16.sp,
                            bottom: 16.sp,
                            left: 20.sp),
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
                                      builder: (context) =>
                                          const SearchScreen()));
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
                                child:
                                    mainTab(121, "Resources", 2, _selectedTab),
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
                      child: getScreen(isCourseAssigned),
                    )
                  ]));
        },
      ),
    );
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
        body: SafeArea(
            child: Column(
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
                          child: mainTab(82, "About", 0, _selectedTab),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTab = 1;
                          });
                        },
                        child: SizedBox(
                          child: mainTab(84, "Topic", 1, _selectedTab),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTab = 2;
                          });
                        },
                        child: SizedBox(
                          child: mainTab(121, "Notes", 2, _selectedTab),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTab = 3;
                          });
                        },
                        child: SizedBox(
                          child: mainTab(87, "Resources", 3, _selectedTab),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: getScreen(),
              )
            ])));
  }
}
