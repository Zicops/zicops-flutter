import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/utils/colors.dart';

Widget VideoSettingItem(
    String icon, String name, String value, bool showValue) {
  return Container(
    height: 48.sp,
    alignment: Alignment.center,
    child: Row(
      children: [
        Container(
          width: 24.sp,
          height: 24.sp,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 3.sp),
          child: Image.asset(icon),
        ),
        SizedBox(
          width: 16.sp,
        ),
        Text(name,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: textPrimary)),
        SizedBox(
          width: 12.sp,
        ),
        if (showValue) Image.asset("assets/images/dot.png", width: 4.sp,height: 4.sp,),
        if (showValue)
          SizedBox(
            width: 12.sp,
          ),
        if (showValue)
          Text(
            value,
            softWrap: true,
            style: TextStyle(fontSize: 14.sp, color: textGrey2),
          )
      ],
    ),
  );
}
