import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/screens/quiz/widgets/quiz_item.dart';

import '../../../utils/colors.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuizScreen();
  }
}

class _QuizScreen extends State<QuizScreen> {
  onOptionSelect(questionNumber, selectedOption){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.sp),
        child: AppBar(
          backgroundColor: secondaryColor,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(
                right: 4.sp, top: 16.sp, bottom: 16.sp, left: 20.sp),
            child: Image.asset(
              "assets/images/back_arrow.png",
              height: 16.sp,
              width: 16.sp,
            ),
          ),
          leadingWidth: 40.sp,
          title: SizedBox(
            height: 24.sp,
            child: Text("Quiz",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: textPrimary)),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
            top: 14.sp, bottom: 20.sp, left: 20.sp, right: 20.sp),
        color: secondaryColorDark,
        child: SingleChildScrollView(child: Column(
          children: [
            QuizItem(1, null, "Which big cat is normally found in savannahs / grassy plain ?", [{"option":"Lepard"}, {"option":"Tiger", "optionImage":"assets/images/leopard.png"}, {"option":"Lion", "optionImage":"assets/images/leopard.png"}], null,
                onOptionSelect),
            SizedBox(
              height: 8.sp,
            ),
            Divider(
              height: 0.5.sp,
              thickness: 0.5.sp,
              color: secondaryColorDarkOutline,
            ),
          ],
        ),
      ),),
    );
  }
}
