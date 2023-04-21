import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/widgets/GradientButton.dart';
import 'package:zicops/views/widgets/assign_course_modal.dart';

import '../../../utils/colors.dart';

class AssignCourseScreen extends StatefulWidget {
  const AssignCourseScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AssignCourseScreen();
  }
}

class _AssignCourseScreen extends State<AssignCourseScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: secondaryColor,
        padding: EdgeInsets.only(
            left: 20.sp, right: 20.sp, top: 13.sp, bottom: 20.sp),
        child: Column(
          children: [
            GestureDetector(
              onTap: () =>
                  {assignCourseBottomSheet(context, height - 120.sp, width)},
              child: GradientButton("Assign"),
            )
          ],
        ),
      ),
    );
  }
}
