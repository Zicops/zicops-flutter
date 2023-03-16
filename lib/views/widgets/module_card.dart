import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/widgets/progress_bar.dart';

import '../../../../utils/colors.dart';

class ModuleCard extends StatefulWidget {
  String courseName;
  String courseLength;
  String preview;
  bool isSelected;
  bool isExam;
  Duration? position;
  Duration? duration;

  ModuleCard(this.courseName, this.courseLength, this.preview, this.isSelected,
      this.position, this.duration,
      {Key? key, this.isExam = false, })
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ModuleCard();
  }
}

class _ModuleCard extends State<ModuleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320.sp,
        height: 74.sp,
        padding: EdgeInsets.symmetric(vertical: 0.5.sp, horizontal: 0.5.sp),
        margin: EdgeInsets.only(bottom: 8.sp),
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
              color: widget.isSelected ? overlay : secondaryColor,
              borderRadius: BorderRadius.circular(4.sp),
              border: widget.isSelected
                  ? Border.all(color: secondaryColorDarkOutline, width: 1.sp)
                  : Border.all(width: 0)),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(2.sp),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if(!widget.isExam)Image.asset(
                        widget.preview,
                        fit: BoxFit.fill,
                        width: 58.sp,
                        height: 58.sp,
                      ),
                      Container(
                        color: widget.isExam
                            ? secondaryColorDark
                            : widget.isSelected
                                ? overlay
                                : Colors.black.withOpacity(0.43),
                        alignment: Alignment.center,
                        width: 60.sp,
                        height: 60.sp,
                      ),
                      widget.isExam
                          ? Image.asset(
                              'assets/images/quiz.png',
                              width: 20.sp,
                              height: 20.sp,
                            )
                          : widget.isSelected
                              ? Image.asset(
                                  "assets/images/media.png",
                                  width: 24.sp,
                                  height: 24.sp,
                                )
                              : Image.asset(
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
                          const Spacer(),
                          widget.isSelected
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ("${widget.duration!.inMilliseconds - widget.position!.inMilliseconds} mins left")
                                          .toString(),
                                      style: TextStyle(
                                          color: textGrey2,
                                          fontSize: 12.sp,
                                          height: 1.33),
                                    ),
                                    SizedBox(
                                      height: 6.sp,
                                    ),
                                    Container(
                                        height: 5.sp,
                                        alignment: Alignment.centerLeft,
                                        child: ProgressBar(
                                            230,
                                            widget.position!.inSeconds /
                                                widget.duration!.inSeconds))
                                  ],
                                )
                              : Text(
                                  widget.courseLength,
                                  style: TextStyle(
                                      color: textGrey2,
                                      fontSize: 12.sp,
                                      height: 1.33),
                                )
                        ],
                      ))),
            ],
          ),
        ));
  }
}
