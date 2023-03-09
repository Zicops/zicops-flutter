import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/screens/exam/congratulations_screen.dart';
import 'package:zicops/views/screens/exam/result_screen.dart';

import '../../../utils/colors.dart';
import 'answer_key_screen.dart';
import 'exam_landing_screen.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ExamScreen();
  }
}

class _ExamScreen extends State<ExamScreen> {
  int _currentScreen = 0;

  getScreen() {
    switch (_currentScreen) {
      case 0:
        return ExamLandingScreen();
      default:
        return ExamLandingScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryColorDark,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48.sp),
          child: AppBar(
            backgroundColor: secondaryColor,
            elevation: 0,
            leading: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (Navigator.canPop(context)) Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      right: 4.sp, top: 16.sp, bottom: 16.sp, left: 20.sp),
                  child: Image.asset(
                    "assets/images/back_arrow.png",
                    height: 16.sp,
                    width: 16.sp,
                  ),
                )),
            leadingWidth: 40.sp,
          ),
        ),
        body: getScreen());
  }
}
