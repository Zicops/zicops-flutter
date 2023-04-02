import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

unAssignCourseBottomSheet(BuildContext context, double maxHeight, double width) {
  showModalBottomSheet<void>(
      context: context,
      backgroundColor: secondaryColor,
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: lightGrey),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))),
      isScrollControlled: true,
      constraints: BoxConstraints(minHeight: 0, maxHeight: maxHeight),
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
          return Container(
              padding:
              EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 20.sp),
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  border: Border.all(color: lightGrey)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 4.sp,
                      width: 36,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 8.sp, bottom: 16.sp),
                      decoration: BoxDecoration(
                          color: secondaryColorDark,
                          borderRadius: BorderRadius.circular(4.sp)),
                    ),
                    Container(
                      width: 56.sp,
                      height: 56.sp,
                      alignment: Alignment.center,
                      child:
                      Image.asset("assets/images/folder_with_outline.png"),
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    Container(
                      height: 24.sp,
                      alignment: Alignment.center,
                      child: Text(
                        "Unassign course?",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: textPrimary),
                      ),
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    Text(
                      "Are you sure you want to unassign the course? If you unenroll, the course will be removed from your learning folder.",
                      style: TextStyle(fontSize: 16.sp, color: textGrey2),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 48.sp,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: delete, width: 1.sp),
                            borderRadius: BorderRadius.circular(4.sp)),
                        child: Text(
                          "Unassign".toUpperCase(),
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: delete,
                              letterSpacing: 2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 48.sp,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: lightGrey, width: 1.sp),
                              borderRadius: BorderRadius.circular(4.sp)),
                          child: Text("Cancel".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: textPrimary,
                                  letterSpacing: 2)),
                        )),
                  ]));
        });
      });
}
