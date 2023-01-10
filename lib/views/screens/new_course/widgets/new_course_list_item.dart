import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';

class NewCourseListItem extends StatefulWidget {
  String courseName;
  String org;
  String difficulty;
  String courseLength;
  String preview;

  NewCourseListItem(this.courseName, this.org, this.difficulty,
      this.courseLength, this.preview,
      {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NewCourseListItem();
  }
}

class _NewCourseListItem extends State<NewCourseListItem> {
  bool isGridView = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74.sp,
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(4.sp),
          border: Border.all(color: secondaryColorDarkOutline, width: 0.5)),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(2.sp),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
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
          SizedBox(
              height: 60.sp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.courseName,
                    style: TextStyle(
                        color: textPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        height: 1.43),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                      width: 148.sp,
                      child: Row(
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
                            "\u2022",
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
                            widget.difficulty,
                            style: TextStyle(
                                color: textGrey2,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.33),
                            overflow: TextOverflow.ellipsis,
                          ),

                        ],
                      )),
                  Text(
                    widget.courseLength,
                    style: TextStyle(
                        color: primaryColor, fontSize: 12.sp, height: 1.33),
                  )
                ],
              )),
          SizedBox(
            width: 8.sp,
          ),
          Image.asset(
            "assets/images/add_button.png",
            width: 28.sp,
            height: 28.sp,
          )
        ],
      ),
    );
  }
}
