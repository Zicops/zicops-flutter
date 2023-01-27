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
  onOptionSelect(questionNumber, selectedOption) {}
  int selectedQues = 0;
  List quizItems = [
    {
      "index": 1,
      "questionImage": null,
      "question":
          "Which big cat is normally found in savannahs / grassy plain ?",
      "options": const [
        {"option": "Lepard"},
        {
          "option": "Tiger",
        },
        {
          "option": "Lion",
        }
      ],
      "selectedOption": null
    },
    {
      "index": 2,
      "questionImage": "assets/images/leopard.png",
      "question":
          "Which big cat is normally found in savannahs / grassy plain ?",
      "options": const [
        {"option": "Lepard"},
        {
          "option": "Tiger",
        },
        {
          "option": "Lion",
        }
      ],
      "selectedOption": null
    },
    {
      "index": 3,
      "questionImage": null,
      "question":
          "Which big cat is normally found in savannahs / grassy plain ?",
      "options": const [
        {"option": "Lepard", "optionImage": "assets/images/leopard.png"},
        {"option": "Tiger", "optionImage": "assets/images/leopard.png"},
        {"option": "Lion", "optionImage": "assets/images/leopard.png"}
      ],
      "selectedOption": null
    },
    {
      "index": 4,
      "questionImage": "assets/images/leopard.png",
      "question":
          "Which big cat is normally found in savannahs / grassy plain ?",
      "options": const [
        {"option": "Lepard", "optionImage": "assets/images/leopard.png"},
        {"option": "Tiger", "optionImage": "assets/images/leopard.png"},
        {"option": "Lion", "optionImage": "assets/images/leopard.png"}
      ],
      "selectedOption": null
    }
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Quiz",
                style: TextStyle(
                    color: textPrimary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.33),
              ),
              Row(
                children: [
                  GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if (selectedQues > 0) {
                          setState(() {
                            selectedQues = selectedQues - 1;
                          });
                        }
                      },
                      child: Transform.rotate(
                          angle: 1.5,
                          child: Container(
                              width: 24.sp,
                              height: 48.sp,
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/down_arrow.png",
                                width: 12.sp,
                                height: 8.sp,
                                color: textPrimary,
                              )))),
                  SizedBox(
                    width: 24.sp,
                  ),
                  GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if (selectedQues < 3) {
                          setState(() {
                            selectedQues = selectedQues + 1;
                          });
                        }
                      },
                      child: Transform.rotate(
                          angle: -1.5,
                          child: Container(
                            width: 24.sp,
                            height: 48.sp,
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/down_arrow.png",
                              width: 12.sp,
                              height: 8.sp,
                            ),
                          ))),
                ],
              )
            ],
          ),
        ),
      ),
      body: Container(
          height: height,
          padding: EdgeInsets.only(
              top: 14.sp, bottom: 20.sp, left: 20.sp, right: 20.sp),
          child: Stack(children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QuizItem(
                      quizItems[selectedQues]["index"],
                      quizItems[selectedQues]["questionImage"],
                      quizItems[selectedQues]["question"],
                      quizItems[selectedQues]["options"],
                      quizItems[selectedQues]["selectedOption"],
                      onOptionSelect),
                  SizedBox(
                    height: 60.sp,
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                    width: width - 40.sp,
                    color: secondaryColorDark,
                    child: Column(children: [
                      Divider(
                        height: 1.sp,
                        thickness: 1.sp,
                        color: lightGrey,
                      ),
                      SizedBox(
                        height: 16.sp,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                                height: 36.sp,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.sp, vertical: 10.sp),
                                decoration: BoxDecoration(
                                    border: Border.all(color: lightGrey),
                                    borderRadius: BorderRadius.circular(4.sp)),
                                child: Text(
                                  "Clear".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: neutral,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 2,
                                      height: 1.14),
                                )),
                          ),
                          Expanded(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {},
                                    child: Container(
                                        height: 36.sp,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.sp, vertical: 10.sp),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: lightGrey, width: 1.sp),
                                            borderRadius:
                                                BorderRadius.circular(4.sp)),
                                        child: Text(
                                          "Save".toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: primaryColor,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 2,
                                              height: 1.14),
                                        ))),
                                SizedBox(
                                  width: 16.sp,
                                ),
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 36.sp,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.sp),
                                    decoration: BoxDecoration(
                                        gradient: RadialGradient(
                                            colors: const [
                                              primaryColor,
                                              gradientTwo
                                            ],
                                            center: Alignment.topLeft,
                                            radius: 10.sp),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Container(
                                        height: 24.sp,
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Submit'.toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: secondaryColorLight,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.sp,
                                              letterSpacing: 2,
                                              ),
                                        )),
                                  ),
                                )
                              ])),
                        ],
                      )
                    ])))
          ])),
    );
  }
}
