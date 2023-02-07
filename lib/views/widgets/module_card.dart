import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/widgets/progress_bar.dart';

import '../../../../utils/colors.dart';

class ModuleCard extends StatefulWidget {
  String courseName;
  String courseLength;
  String preview;

  ModuleCard(this.courseName, this.courseLength, this.preview,
      {Key? key})
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
                      Image.asset(
                        widget.preview,
                        fit: BoxFit.fill,
                        width: 58.sp,
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
                              child:Text(
                                widget.courseName,
                                style: TextStyle(
                                    color: textPrimary,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    height: 1.43),
                                overflow: TextOverflow.ellipsis,
                              )),
                          const Spacer(),
                          Text(
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
