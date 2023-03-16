import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

Widget mainTab(double width, String tabTitle, int index, int selectedTab) {
  return Container(
    width: width.sp,
    height: 48.sp,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: index == selectedTab?textPrimary: secondaryColor, width:1.5))
    ),
    child: Text(
      tabTitle,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: index == selectedTab ? textPrimary : textGrey2,
          fontSize: 16.sp,
          height: 1.5,
          fontWeight: index == selectedTab? FontWeight.w500: FontWeight.w400),
    ),
  );
}
