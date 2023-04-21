import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/widgets/progress_bar.dart';

import '../../utils/colors.dart';
import 'GradientButton.dart';

courseInfoBottomSheet(
    BuildContext context, double maxHeight, double width, String title,
    {bool isCourseAssigned = false,
    bool isCourseStarted = false,
    double coursePercent = 0}) {
  showModalBottomSheet<void>(
      context: context,
      backgroundColor: secondaryColor,
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: lightGrey),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))),
      isScrollControlled: true,
      constraints: BoxConstraints(minHeight: 0, maxHeight: maxHeight),
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
          return Padding(
              padding:
                  EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 20.sp),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 4.sp,
                      width: 36,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 8.sp, bottom: 16.sp),
                      decoration: BoxDecoration(
                          color: secondaryColorDark,
                          borderRadius: BorderRadius.circular(4.sp)),
                    ),
                    SizedBox(
                      width: width - 40.sp,
                      height: 180.sp,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.sp),
                        child: Image.asset(
                          "assets/images/course_preview.png",
                          width: width - 40.sp,
                          height: 180.sp,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    Row(
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w500,
                              color: textPrimary,
                              height: 1.33),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    Row(
                      children: [
                        Text(
                          'Design',
                          style: TextStyle(
                              color: textPrimary,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.5),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: 8.sp,
                        ),
                        Text(
                          "\u2022",
                          style: TextStyle(
                              color: textPrimary,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.5),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: 8.sp,
                        ),
                        Text(
                          "UI/UX design",
                          style: TextStyle(
                              color: textPrimary,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.5),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    SizedBox(
                        height: 32.sp,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              height: 32.sp,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 6.sp),
                              decoration: BoxDecoration(
                                  color: secondaryColorDark,
                                  border: Border.all(color: lightGrey)),
                              child: Text(
                                "Intermediate",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: textPrimary,
                                    height: 1.5),
                              ),
                            ),
                            SizedBox(
                              width: 8.sp,
                            ),
                            Container(
                              height: 32.sp,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 6.sp),
                              decoration: BoxDecoration(
                                  border: Border.all(color: lightGrey)),
                              child: Text(
                                "77 Modules",
                                style: TextStyle(
                                    fontSize: 16.sp, color: textPrimary),
                              ),
                            ),
                            SizedBox(
                              width: 8.sp,
                            ),
                            Container(
                              height: 32.sp,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 6.sp),
                              decoration: BoxDecoration(
                                  border: Border.all(color: lightGrey)),
                              child: Text(
                                "77 Topics",
                                style: TextStyle(
                                    fontSize: 16.sp, color: textPrimary),
                              ),
                            ),
                            SizedBox(
                              width: 8.sp,
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 16.sp,
                    ),
                    if (isCourseAssigned && !isCourseStarted)
                      Text("Added on 24th September 2022",
                          style: TextStyle(
                              fontSize: 16.sp, color: textGrey2, height: 1.5)),
                    if (isCourseAssigned && !isCourseStarted)
                      SizedBox(
                        height: 16.sp,
                      ),
                    if (isCourseStarted)
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            "Expected completion by 30th January 2023",
                            style: TextStyle(
                                fontSize: 16.sp, color: textGrey2, height: 1.5),
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          ProgressBar(width - 40.sp, coursePercent / 100),
                          SizedBox(
                            height: 20.sp,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                coursePercent == 0
                                    ? "Duration: 1hr 40 mins"
                                    : "Remaining: 6 hours of content",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: textGrey2,
                                    height: 1.5),
                              ),
                              Text('$coursePercent%',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: textGrey2,
                                      height: 1.5))
                            ],
                          )
                        ],
                      )),
                    if (!isCourseStarted)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Duration: 1hr 40 mins",
                            style: TextStyle(
                                fontSize: 16.sp, color: textGrey2, height: 1.5),
                          ),
                          Text("English",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: textGrey2,
                                  height: 1.5))
                        ],
                      ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: GradientButton(isCourseAssigned
                          ? isCourseStarted
                              ? "Continue with the course"
                              : "Start with the course"
                          : "Add to learning folder"),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                  ]));
        });
      });
}
