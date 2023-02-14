import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

Widget VideoCourseBadge(String icon, String label) {
  return SizedBox(
    height: 16.sp,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 16.sp,
          height: 16.sp,
          alignment: Alignment.center,
          padding: EdgeInsets.all(1.5.sp),
          child: Image.asset(icon, fit: BoxFit.fill,),
        ),
        SizedBox(
          width: 4.sp,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: textPrimary, height: 1.33),
        )
      ],
    ),
  );
}
