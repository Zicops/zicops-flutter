import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/widgets/progress_bar.dart';

import '../../../../utils/colors.dart';
import '../screens/course_details/course_details_screen.dart';

class CourseListItem extends StatefulWidget {
  String courseName;
  String org;
  String courseLength;
  String preview;
  String courseId;
  String difficulty;
  int topicPercentage;

  CourseListItem(this.courseName, this.org, this.courseLength, this.preview,
      this.courseId, this.difficulty, this.topicPercentage,
      {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CourseListItem();
  }
}

class _CourseListItem extends State<CourseListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CourseDetailsScreen(widget.courseId,
                    widget.courseName, widget.difficulty, widget.preview)));
      },
      child: Container(
          width: 320.sp,
          height: 74.sp,
          padding: EdgeInsets.symmetric(vertical: 0.5.sp, horizontal: 0.5.sp),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.sp),
              gradient: LinearGradient(colors: [
                secondaryColorDarkOutline,
                secondaryColorDarkOutline.withOpacity(0.15),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Container(
            padding: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(4.sp),
            ),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(2.sp),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          widget.preview,
                          fit: BoxFit.fill,
                          width: 104.sp,
                          height: 58.sp,
                        ),
                        Container(
                          color: Colors.black.withOpacity(0.43),
                          height: 58.sp,
                        ),
                        Image.asset(
                          "assets/images/play_button.png",
                          width: 20.sp,
                          height: 20.sp,
                          opacity: const AlwaysStoppedAnimation(0.6),
                        )
                      ],
                    )),
                SizedBox(
                  width: 8.sp,
                ),
                Expanded(
                    child: SizedBox(
                        height: 58.sp,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 24.sp,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.courseName,
                                  style: TextStyle(
                                      color: textPrimary,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      height: 1.43),
                                  overflow: TextOverflow.ellipsis,
                                )),
                            SizedBox(
                              height: 2.sp,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.org,
                                  style: TextStyle(
                                      color: textGrey2,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      height: 1.33),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  width: 8.sp,
                                ),
                                Text(
                                  widget.courseLength,
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 12.sp,
                                      height: 1.33),
                                )
                              ],
                            ),
                            const Spacer(),
                            ProgressBar(192, widget.topicPercentage / 100),
                          ],
                        ))),
              ],
            ),
          )),
    );
  }
}
