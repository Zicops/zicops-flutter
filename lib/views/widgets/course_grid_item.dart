import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/widgets/unassign_course_modal.dart';

import '../../utils/colors.dart';
import '../screens/course_details/course_details_screen.dart';
import 'assign_course_modal.dart';
import 'course_info_modal.dart';

class CourseGridItem extends StatefulWidget {
  String courseName;
  String org;
  String difficulty;
  String courseLength;
  String preview;
  String courseId;
  bool showPlusIcon;
  bool isAssigned;

  CourseGridItem(this.courseName, this.org, this.difficulty, this.courseLength,
      this.preview, this.courseId,
      {Key? key, this.showPlusIcon = true, this.isAssigned = false})
      : super(key: key);

  // CourseGridItem(this.courseName, this.org, this.difficulty, this.courseLength,
  //     this.preview, this.courseId
  //     {Key? key, this.showPlusIcon = true})
  //     : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CourseGridItem();
  }
}

class _CourseGridItem extends State<CourseGridItem> {
  bool isGridView = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CourseDetailsScreen(widget.courseId,
                    widget.courseName, widget.difficulty, widget.preview)));
      },
      onLongPress: () {
        courseInfoBottomSheet(context, 596.sp, width, widget.courseName,
            isCourseAssigned: true, isCourseStarted: true, coursePercent: 40);
      },
      child: Center(
          child: Container(
              width: 156.sp,
              height: 156.sp,
              padding:
                  EdgeInsets.symmetric(vertical: 0.5.sp, horizontal: 0.5.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.sp),
                  gradient: LinearGradient(colors: [
                    secondaryColorDarkOutline,
                    secondaryColorDarkOutline.withOpacity(0.15),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(4.sp),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(4.sp),
                                    topLeft: Radius.circular(4.sp)),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    widget.preview.contains("https://")
                                        ? Image.network(
                                            widget.preview,
                                            fit: BoxFit.fill,
                                            width: 156.sp,
                                            height: 88.sp,
                                          )
                                        : Image.asset(
                                            'assets/images/course_preview_2.png',
                                            fit: BoxFit.fill,
                                            width: 156.sp,
                                            height: 88.sp,
                                          ),
                                  ],
                                ))),
                        Container(
                          height: 70.sp,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.sp, vertical: 10.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.courseName,
                                maxLines: 2,
                                style: TextStyle(
                                    color: textPrimary,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    if (false)
                      Positioned(
                          top: 8.sp,
                          right: 8.sp,
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
                    if (widget.showPlusIcon)
                      Positioned(
                          top: 73.5.sp,
                          right: 13.75.sp,
                          child: GestureDetector(
                              onTap: () {
                                widget.isAssigned
                                    ? unAssignCourseBottomSheet(
                                        context, 365.sp, width)
                                    : assignCourseBottomSheet(
                                        context, height - 20.sp, width);
                              },
                              child: Image.asset(
                                widget.isAssigned
                                    ? "assets/images/checkmark_with_bg.png"
                                    : "assets/images/add_button_big.png",
                                width: 28.sp,
                                height: 28.sp,
                                fit: BoxFit.fill,
                              )))
                  ],
                ),
              ))),
    );
    // return GestureDetector(
    //   onTap: () {
    //     print(widget.courseId);
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => CourseDetailsScreen(widget.courseId,
    //                 widget.courseName, widget.difficulty, widget.preview)));
    //   },
    //   child: Center(
    //       child: Container(
    //           width: 156.sp,
    //           height: 156.sp,
    //           padding:
    //               EdgeInsets.symmetric(vertical: 0.5.sp, horizontal: 0.5.sp),
    //           decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(4.sp),
    //               gradient: LinearGradient(colors: [
    //                 secondaryColorDarkOutline,
    //                 secondaryColorDarkOutline.withOpacity(0.15),
    //               ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    //           child: Container(
    //             decoration: BoxDecoration(
    //               color: secondaryColor,
    //               borderRadius: BorderRadius.circular(4.sp),
    //             ),
    //             child: Stack(
    //               children: [
    //                 Column(
    //                   children: [
    //                     Expanded(
    //                         child: ClipRRect(
    //                             borderRadius: BorderRadius.only(
    //                                 topRight: Radius.circular(4.sp),
    //                                 topLeft: Radius.circular(4.sp)),
    //                             child: Stack(
    //                               alignment: Alignment.center,
    //                               children: [
    //                                 widget.preview.contains("https://")
    //                                     ? Image.network(
    //                                         widget.preview,
    //                                         fit: BoxFit.fill,
    //                                         width: 156.sp,
    //                                         height: 88.sp,
    //                                       )
    //                                     : Image.asset(
    //                                         'assets/images/course_preview_2.png',
    //                                         fit: BoxFit.fill,
    //                                         width: 156.sp,
    //                                         height: 88.sp,
    //                                       ),
    //                                 // FadeInImage(
    //                                 //   image: NetworkImage(widget.preview),
    //                                 //   placeholder: AssetImage(
    //                                  //       'assets/images/course_preview_2.png'),
    //                                 // ),
    //                                 Container(
    //                                   color: Colors.black.withOpacity(0.43),
    //                                   height: 87.75.sp,
    //                                 ),
    //                                 Positioned(
    //                                     top: 46.sp,
    //                                     child: Image.asset(
    //                                       "assets/images/play_button.png",
    //                                       width: 20.sp,
    //                                       height: 20.sp,
    //                                       opacity:
    //                                           const AlwaysStoppedAnimation(0.6),
    //                                     ))
    //                               ],
    //                             ))),
    //                     Container(
    //                       height: 68.sp,
    //                       padding: EdgeInsets.symmetric(
    //                           horizontal: 15.sp, vertical: 11.sp),
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text(
    //                             widget.courseName,
    //                             style: TextStyle(
    //                                 color: textPrimary,
    //                                 fontSize: 16.sp,
    //                                 fontWeight: FontWeight.w500,
    //                                 height: 1.5),
    //                             overflow: TextOverflow.ellipsis,
    //                           ),
    //                           Text(
    //                             widget.org,
    //                             style: TextStyle(
    //                                 color: textGrey2,
    //                                 fontSize: 14.sp,
    //                                 fontWeight: FontWeight.w400,
    //                                 height: 1.42),
    //                             overflow: TextOverflow.ellipsis,
    //                           )
    //                         ],
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //                 Positioned(
    //                     top: 8.sp,
    //                     right: 8.sp,
    //                     child: Container(
    //                       height: 24.sp,
    //                       padding: EdgeInsets.symmetric(
    //                           horizontal: 6.sp, vertical: 4.sp),
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(2.sp),
    //                           color: const Color(0xE6101012)),
    //                       child: Text(
    //                         widget.difficulty,
    //                         style: TextStyle(
    //                             fontSize: 12.sp,
    //                             color: textPrimary,
    //                             height: 1.33),
    //                       ),
    //                     )),
    //                 Positioned(
    //                     top: 73.5.sp,
    //                     right: 13.75.sp,
    //                     child: Image.asset(
    //                       "assets/images/add_button_big.png",
    //                       width: 28.sp,
    //                       height: 28.sp,
    //                       fit: BoxFit.fill,
    //                     ))
    //               ],
    //             ),
    //           ))),
    // );
  }
}
