import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

Widget courseBadge(String icon, String label) {
  return SizedBox(
    height: 24.sp,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 22.sp,
          height: 22.sp,
          alignment: Alignment.center,
          padding: EdgeInsets.all(1.5.sp),
          child: Image.asset(icon, fit: BoxFit.fill,),
        ),
        SizedBox(
          width: 4.sp,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 14.sp, color: textPrimary, height: 1.43),
        )
      ],
    ),
  );
}
