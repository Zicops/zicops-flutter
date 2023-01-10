import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/utils/colors.dart';
import 'package:zicops/utils/dummies.dart';
import 'package:zicops/views/widgets/course_grid_item.dart';
import 'package:zicops/views/widgets/course_grid_item_large.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  Widget sectionHeader(String label, Function action) {
    return Container(
        height: 24.sp,
        padding: EdgeInsets.only(right: 20.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                  color: textPrimary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500),
            ),
            GestureDetector(
              child: Text("See all",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500)),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      padding:
          EdgeInsets.only(left:20.sp,top: 14.sp, bottom: 45.sp),
      child: SingleChildScrollView(
        child: Column(
          children: [
            sectionHeader("Continue Course", () {}),
            SizedBox(
              height: 8.sp,
            ),
            sectionHeader("Recommended Courses", () {}),
            SizedBox(
              height: 8.sp,
            ),
            Container(
              height: 156.sp,
              alignment: Alignment.centerLeft,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...courseItems.map((courseItem) => Row(
                        children: [
                          CourseGridItem(
                            courseItem["courseName"],
                            courseItem["org"],
                            courseItem["difficulty"],
                            courseItem["courseLength"],
                            courseItem["preview"],
                          ),
                          SizedBox(
                            width: 8.sp,
                          )
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 14.25.sp,
            ),
            sectionHeader("Category", () {}),
            SizedBox(
              height: 8.sp,
            ),
            sectionHeader("New Courses", () {}),
            SizedBox(
              height: 8.sp,
            ),
            Container(
              width: width,
              height: 248.sp,
              alignment: Alignment.centerLeft,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...courseItems.map((courseItem) => Row(
                        children: [
                          CourseGridItemLarge(
                            courseItem["courseName"],
                            courseItem["org"],
                            courseItem["difficulty"],
                            courseItem["courseLength"],
                            courseItem["preview"],
                            showAddButton: true,
                          ),
                          SizedBox(
                            width: 8.sp,
                          )
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 14.25.sp,
            ),
            sectionHeader("Webinars", () {}),
            SizedBox(
              height: 8.sp,
            ),
            sectionHeader("Available Webinars", () {}),
          ],
        ),
      ),
    );
  }
}
