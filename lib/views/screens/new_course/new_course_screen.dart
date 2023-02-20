import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zicops/utils/colors.dart';
import 'package:zicops/views/screens/new_course/widgets/new_course_list_item.dart';
import 'package:zicops/views/widgets/course_grid_item.dart';

import '../../../controllers/controller.dart';
import '../../../utils/dummies.dart';
import '../../widgets/course_list_item_with_progress.dart';

class NewCourseScreen extends StatefulWidget {
  const NewCourseScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NewCourseScreen();
  }
}

class _NewCourseScreen extends State<NewCourseScreen> {
  final _controller = Get.find<Controller>();

  bool isGridView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48.sp),
          child: AppBar(
            elevation: 0,
            backgroundColor: secondaryColor,
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
            title: SizedBox(
              height: 24.sp,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Latest courses",
                    style: TextStyle(
                        color: textPrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        height: 1.33),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 24.sp,
                        height: 24.sp,
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/filter.png",
                          width: 18.sp,
                          height: 12.sp,
                          color: textPrimary,
                        ),
                      ),
                      SizedBox(
                        width: 24.sp,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isGridView = !isGridView;
                          });
                        },
                        child: AnimatedContainer(
                          width: 24.sp,
                          height: 24.sp,
                          alignment: Alignment.center,
                          duration: Duration(milliseconds: 400),
                          child: Image.asset(
                            !isGridView
                                ? "assets/images/grid_view.png"
                                : "assets/images/list_view.png",
                            width: 18.sp,
                            height: 18.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 24.sp,
                      ),
                      Container(
                          width: 24.sp,
                          height: 24.sp,
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/search.png",
                            width: 18.sp,
                            height: 18.sp,
                            color: textPrimary,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20.sp),
            color: secondaryColorDark,
            child: isGridView
                ? GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 8.sp,
                    mainAxisSpacing: 8.sp,
                    crossAxisCount: 2,
                    children: [
                        ..._controller.latestCourses.map((courseItem) =>
                            CourseGridItem(
                                courseItem.name,
                                courseItem.owner,
                                courseItem.expertiseLevel,
                                courseItem.duration,
                                courseItem.tileImage,
                                courseItem.id))
                      ])
                : ListView(
                    children: [
                      ..._controller.latestCourses.map((courseItem) => Column(
                            children: [
                              NewCourseListItem(
                                courseItem.name,
                                courseItem.owner,
                                courseItem.expertiseLevel,
                                courseItem.duration ?? '1',
                                courseItem.tileImage,
                              ),
                              SizedBox(
                                height: 8.sp,
                              )
                            ],
                          ))
                    ],
                  )));
  }
}
