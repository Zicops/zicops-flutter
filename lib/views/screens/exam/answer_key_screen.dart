import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/screens/exam/widgets/exam_quiz_item.dart';
import 'package:zicops/views/widgets/bulleted_text.dart';

import '../../../utils/colors.dart';
import '../../widgets/GradientButton.dart';
import '../../widgets/alternate_color_container.dart';
import '../../widgets/modules_dropdown.dart';
import '../quiz/widgets/quiz_item.dart';

class AnswerKeyScreen extends StatefulWidget {
  const AnswerKeyScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AnswerKeyScreen();
  }
}

class _AnswerKeyScreen extends State<AnswerKeyScreen> {
  List quizItems = [
    {
      "index": 1,
      "questionImage": "assets/images/leopard.png",
      "question":
          "Which big cat is normally found in savannahs / grassy plain ?",
      "options": const [
        {"option": "Lepard", "optionImage": "assets/images/leopard.png"},
        {"option": "Tiger", "optionImage": "assets/images/leopard.png"},
        {"option": "Lion", "optionImage": "assets/images/leopard.png"}
      ],
      "selectedOption": "Lepard"
    },
    {
      "index": 2,
      "questionImage": "assets/images/leopard.png",
      "question":
          "Which big cat is normally found in savannahs / grassy plain ?",
      "options": const [
        {"option": "Lepard", "optionImage": "assets/images/leopard.png"},
        {"option": "Tiger", "optionImage": "assets/images/leopard.png"},
        {"option": "Lion", "optionImage": "assets/images/leopard.png"}
      ],
      "selectedOption": "Tiger"
    }
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
        body: Column(
          children: [
            Container(
              height: 64.sp,
              color: secondaryColor,
              padding:
                  EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 12.sp),
              child: Text("Exam1: IT development: Core java fundamentals",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: textPrimary)),
            ),
            Expanded(
                child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  color: secondaryColorDark,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 16.sp,
                      ),
                      SizedBox(
                          height: 16.sp,
                          child: Text(
                            'Attempt'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: textGrey2,
                                letterSpacing: 1,
                                height: 1.33),
                          )),
                      SizedBox(
                        height: 8.sp,
                      ),
                      ModulesDropDown(),
                      SizedBox(
                        height: 18.sp,
                      ),
                      Text(
                        'Result'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: textGrey2,
                            letterSpacing: 1,
                            height: 1.33),
                      ),
                      SizedBox(
                        height: 8.sp,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.sp),
                            border: Border.all(color: lightGrey, width: 1.sp)),
                        child: AlternateColorContainer(const [
                          {'title': 'Attempts', 'value': '1/3'},
                          {'title': 'Exam score', 'value': '10/100'},
                          {
                            'title': 'Result',
                            'value': 'Failed',
                            'value_color': delete
                          }
                        ]),
                      ),
                      SizedBox(
                        height: 14.sp,
                      ),
                      Divider(
                        height: 1.sp,
                        thickness: 1.sp,
                        color: lightGrey,
                      ),

                      ...quizItems.map((quizItem) => ExamQuizItem(
                          quizItem["index"],
                          quizItem["questionImage"],
                          quizItem["question"],
                          quizItem["options"],
                          quizItem["selectedOption"]))
                    ],
                  ),
                )
              ],
            ))
          ],
        ));
  }
}
