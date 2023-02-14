import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';

Widget listItem(String preview, String courseName, String difficulty) {
  return Column(
    children: [

      Container(
        height: 54.sp,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 8.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(2.sp),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      preview,
                      fit: BoxFit.fill,
                      width: 36.sp,
                      height: 36.sp,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.43),
                      height: 36.sp,
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
              width: 16.sp,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20.sp,
                  alignment: Alignment.center,
                  child: Text(
                    courseName,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: textPrimary),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 16.sp,
                  alignment: Alignment.center,
                  child: Text(
                    courseName,
                    style: TextStyle(fontSize: 12.sp, color: textGrey2),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      Divider(
        height: 1.sp,
        thickness: 1.sp,
        color: lightGrey,
      ),
    ],
  );
}
