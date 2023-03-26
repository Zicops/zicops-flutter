import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/utils/colors.dart';
import 'package:zicops/views/widgets/course_grid_item_large.dart';

import '../../../utils/dummies.dart';
import '../../widgets/course_list_item_with_progress.dart';
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

  String getTitle() {
    switch (_selectedTab) {
      case 0:
        return "ongoing courses";
      case 1:
        return "Assigned  courses";
      case 2:
        return "courses added by you";
      case 3:
        return "completed course";

      default:
        {
          return "ongoing courses";
        }
    }
  }

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
              Expanded(
                  child: ListView(
                children: [
                  ...courseItems.map((courseItem) => Column(
                        children: [
                          CourseGridItemLarge(
                            courseItem["courseName"],
                            courseItem["org"],
                            courseItem["difficulty"],
                            courseItem["courseLength"],
                            courseItem["preview"],
                            showProgressBar: _selectedTab == 0 || _selectedTab == 3?true: false,
                            progress: _selectedTab == 3? 1: 0.4,
                            isCompleted: _selectedTab == 3,
                          ),
                          SizedBox(
                            height: 16.sp,
                          )
                        ],
                      ))
                ],
              ))
            ],
          ),
        ))
      ],
    );
  }
}
