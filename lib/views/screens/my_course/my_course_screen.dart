import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/blocs/home/home_bloc.dart';
import 'package:zicops/repositories/home_repository.dart';
import 'package:zicops/utils/colors.dart';
import 'package:zicops/views/widgets/course_grid_item_large.dart';

import '../../../utils/time_format.dart';
import '../../widgets/main_tab.dart';

class MyCourseScreen extends StatefulWidget {
  const MyCourseScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyCourseScreen();
  }
}

class _MyCourseScreen extends State<MyCourseScreen> {
  int _selectedTab = 0;
  // final _controller = Get.find<Controller>();

  String getTitle() {
    switch (_selectedTab) {
      case 0:
        return "on going courses";
      case 1:
        return "Assigned  courses";
      case 2:
        return "courses added by you";
      case 3:
        return "completed course";

      default:
        {
          return "on going courses";
        }
    }
  }

  List courseToDisplay = [];

  // List getCourseList() {
  //   switch (_selectedTab) {
  //     case 0:
  //       return _controller.onGoingCourses;
  //     case 1:
  //       return _controller.assignedCourses;
  //     case 2:
  //       return _controller.selfAddedCourses;
  //     case 3:
  //       return _controller.completedCourses;
  //     default:
  //       {
  //         return _controller.onGoingCourses;
  //       }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          color: secondaryColor,
          height: 48.sp,
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
                    child: mainTab(112, "On going", 0, _selectedTab),
                  )),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTab = 1;
                    });
                  },
                  child: SizedBox(
                    child: mainTab(112, "Assigned", 1, _selectedTab),
                  )),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTab = 2;
                    });
                  },
                  child: SizedBox(
                    child: mainTab(112, "Added", 2, _selectedTab),
                  )),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTab = 3;
                    });
                  },
                  child: SizedBox(
                    child: mainTab(112, "Completed", 3, _selectedTab),
                  )),
            ],
          ),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.only(
              left: 20.sp, right: 20.sp, top: 13.sp, bottom: 45.sp),
          child: BlocProvider(
            create: (context) => HomeBloc(homeRepository: HomeRepository())
              ..add(LearningFolderCourseRequested()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(getTitle().toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: textGrey2,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        height: 1.33)),
                SizedBox(
                  height: 8.sp,
                ),
                Expanded(child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is LearningFolderCourseLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is LearningFolderCourseLoaded) {
                      if (_selectedTab == 0) {
                        courseToDisplay = state.learningFolderCourses
                            .where((course) =>
                                course.topicsStartedPercentage != 0 &&
                                course.topicsStartedPercentage! <= 100)
                            .toList();
                      } else if (_selectedTab == 1) {
                        courseToDisplay = state.learningFolderCourses
                            .where((course) => course.addedOn != 'self')
                            .toList();
                      } else if (_selectedTab == 2) {
                        courseToDisplay = courseToDisplay = state
                            .learningFolderCourses
                            .where((course) => course.addedOn == 'self')
                            .toList();
                      } else if (_selectedTab == 3) {
                        courseToDisplay = state.learningFolderCourses
                            .where((course) =>
                                course.topicsStartedPercentage == 100)
                            .toList();
                      }
                      return ListView(
                        children: [
                          ...courseToDisplay.map((courseItem) => Column(
                                children: [
                                  CourseGridItemLarge(
                                    courseItem.name,
                                    courseItem.owner,
                                    courseItem.expertiseLevel,
                                    formatDuration(courseItem.duration),
                                    courseItem.tileImage,
                                    courseItem.id,
                                    showProgressBar:
                                        _selectedTab == 0 || _selectedTab == 3
                                            ? true
                                            : false,
                                    progress: _selectedTab == 3
                                        ? 1
                                        : (courseItem.completedPercentage /
                                            100),
                                    isCompleted: _selectedTab == 3,
                                  ),
                                  SizedBox(
                                    height: 16.sp,
                                  )
                                ],
                              ))
                        ],
                      );
                    }
                    return Container();
                  },
                ))
              ],
            ),
          ),
        ))
      ],
    );
  }
}
