import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';

class SearchCourseListItem extends StatefulWidget {
  String courseName;
  String org;
  String difficulty;
  String courseLength;
  String preview;

  SearchCourseListItem(this.courseName, this.org, this.difficulty,
      this.courseLength, this.preview,
      {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchCourseListItem();
  }
}

class _SearchCourseListItem extends State<SearchCourseListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.sp,
      height: 74.sp,
      padding: EdgeInsets.symmetric(vertical: 8.sp),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                  width: 148.sp,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                          Expanded(
                              child: Text(
                            widget.difficulty,
                            style: TextStyle(
                                color: textGrey2,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.33),
                            overflow: TextOverflow.ellipsis,
                          )),
                        ],
                      ),
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
            ],
          ),
          Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  "assets/images/add_button_big.png",
                  width: 28.sp,
                  height: 28.sp,
                )),
          )
        ],
      ),
    );
  }
}
