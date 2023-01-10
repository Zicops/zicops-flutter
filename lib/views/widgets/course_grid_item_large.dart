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
  bool showAddButton = false;

  CourseGridItemLarge(this.courseName, this.org, this.difficulty,
      this.courseLength, this.preview,
      {this.showAddButton = false,Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CourseGridItemLarge();
  }
}

class _CourseGridItemLarge extends State<CourseGridItemLarge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.sp,
      height: 248.sp,
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(4.sp),
          border: Border.all(color: secondaryColorDarkOutline, width: 0.5)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              SizedBox(
                  height: 178.sp,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4.sp),
                              topLeft: Radius.circular(4.sp)),
                          child: Image.asset(
                            widget.preview,
                            fit: BoxFit.fill,
                            height: 179.sp,
                          )),
                      Positioned(top: 176.sp, child: ProgressBar(0.4)),
                    ],
                  )),
              Container(
                height: 68.sp,
                padding:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 11.sp),
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
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [

                    Text(
                      "${widget.org} \u2022 Course",
                      style: TextStyle(
                          color: textGrey2,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.42),
                      overflow: TextOverflow.ellipsis,
                    ), Text(widget.courseLength, style: TextStyle(color: primaryColor, fontSize: 14.sp, height:1.43 ),)])
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
                padding: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 4.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.sp),
                    color: const Color(0xE6101012)),
                child: Text(
                  widget.difficulty,
                  style: TextStyle(
                      fontSize: 12.sp, color: textPrimary, height: 1.33),
                ),
              )),
          if(widget.showAddButton)Positioned(
              bottom: 56.sp,
              right: 13.75.sp,
              child: Image.asset(
                "assets/images/add_button.png",
                width: 28.sp,
                height: 28.sp,
              ))

        ],
      ),
    );
  }
}
