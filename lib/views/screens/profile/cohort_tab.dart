import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/screens/profile/widgets/cohort_card.dart';

import '../../../utils/colors.dart';

class CohortTabScreen extends StatefulWidget {
  const CohortTabScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CohortTabScreen();
  }
}

class _CohortTabScreen extends State<CohortTabScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            color: secondaryColorDark,
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 13.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "your cohorts".toUpperCase(),
                  style: TextStyle(
                      color: neutral,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      height: 1.33),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                ...[1, 2, 3, 4].map((e) => Column(
                      children: [
                        CohortCard(
                            "UI/UX Design Cohort",
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
                            "Cohort Maneger",
                            "assets/images/avatar_default.png",
                            "assets/images/course_preview.png"),
                        SizedBox(
                          height: 16.sp,
                        )
                      ],
                    ))
              ],
            )));
  }
}
