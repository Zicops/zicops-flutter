import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/widgets/progress_bar.dart';

import '../../utils/colors.dart';

class CourseGridItemLarge extends StatefulWidget {
  final String courseName;
  final String org;
  final String difficulty;
  final String courseLength;
  final String preview;
  double progress = 0.4;
  bool showAddButton = false;
  bool showProgressBar = false;
  bool isCompleted = false;

  CourseGridItemLarge(this.courseName, this.org, this.difficulty,
      this.courseLength, this.preview,
      {this.showAddButton = false,
      this.showProgressBar = false,
      this.isCompleted = false,
      this.progress = 0.4,
      Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CourseGridItemLarge();
  }
}

class _CourseGridItemLarge extends State<CourseGridItemLarge> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 320.sp,
            height: 248.sp,
            padding: EdgeInsets.symmetric(vertical: 0.5.sp, horizontal: 0.5.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.sp),
                gradient: LinearGradient(colors: [
                  secondaryColorDarkOutline,
                  secondaryColorDarkOutline.withOpacity(0.15),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Container(
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(4.sp)),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                          child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4.sp),
                                  topLeft: Radius.circular(4.sp)),
                              child: Image.network(
                                widget.preview,
                                fit: BoxFit.fill,
                                width: 320.sp,
                                height: 179.5.sp,
                              )),
                          if (widget.showProgressBar)
                            Positioned(
                                top: 176.sp,
                                child: ProgressBar(400, widget.progress)),
                        ],
                      )),
                      Container(
                        height: 68.sp,
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.sp, vertical: 11.sp),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.courseName,
                              style: TextStyle(
                                  color: textPrimary,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    Text(
                                      widget.org,
                                      style: TextStyle(
                                          color: textGrey2,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          height: 1.42),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      width: 8.sp,
                                    ),
                                    Image.asset(
                                      "assets/images/dot.png",
                                      width: 4.sp,
                                      height: 4.sp,
                                    ),
                                    SizedBox(
                                      width: 8.sp,
                                    ),
                                    Text(
                                      widget.difficulty,
                                      style: TextStyle(
                                          color: textGrey2,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          height: 1.42),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ]),
                                  widget.isCompleted
                                      ? Container(
                                          width: 20.sp,
                                          height: 20.sp,
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            "assets/images/checkmark.png",
                                            width: 15.sp,
                                            height: 12.sp,
                                          ),
                                        )
                                      : Text(
                                          widget.courseLength,
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 14.sp,
                                              height: 1.43),
                                        )
                                ])
                          ],
                        ),
                      )
                    ],
                  ),
                  Positioned(
                      top: 16.sp,
                      right: 16.sp,
                      child: Container(
                        height: 24.sp,
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.sp, vertical: 4.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.sp),
                            color: const Color(0xE6101012)),
                        child: Text(
                          widget.difficulty,
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: textPrimary,
                              height: 1.33),
                        ),
                      )),
                  if (widget.showAddButton)
                    Positioned(
                        bottom: 56.sp,
                        right: 13.75.sp,
                        child: Container(
                            width: 28.sp,
                            height: 28.sp,
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/add_button_big.png",
                              width: 28.sp,
                              height: 28.sp,
                              fit: BoxFit.fill,
                            )))
                ],
              ),
            )));
  }
}
