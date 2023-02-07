import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/utils/dummies.dart';

import '../../utils/colors.dart';
import 'course_grid_item_large.dart';

class MoreLikeThis extends StatefulWidget {
  const MoreLikeThis({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MoreLikeThis();
  }
}

class _MoreLikeThis extends State<MoreLikeThis> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 24.sp,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: 24.sp,
                  child: Text(
                    "More Like This",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {},
                child: Text("See all".toUpperCase(),
                    style: TextStyle(
                        foreground: Paint()
                          ..shader = RadialGradient(
                            colors: const [primaryColor, gradientTwo],
                            center: Alignment.center,
                            radius: 35.sp,
                          ).createShader(
                              const Rect.fromLTWH(0.0, 0.0, 50.0, 24.0),
                              textDirection: TextDirection.ltr),
                        fontSize: 12.sp,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600)),
              )
            ],
          ),
        ),
        SizedBox(
          height: 8.sp,
        ),
        Container(
          height: 248.sp,
          alignment: Alignment.center,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: 20.sp,
              ),
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
          height: 20.sp,
        )
      ],
    );
  }
}
