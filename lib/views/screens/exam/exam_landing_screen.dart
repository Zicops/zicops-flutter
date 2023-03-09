import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zicops/views/screens/exam/congratulations_screen.dart';
import 'package:zicops/views/widgets/bulleted_text.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../utils/colors.dart';
import '../../widgets/GradientButton.dart';
import '../../widgets/alternate_color_container.dart';
import 'attempt_history_screen.dart';

class ExamLandingScreen extends StatefulWidget {
  const ExamLandingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ExamLandingScreen();
  }
}

class _ExamLandingScreen extends State<ExamLandingScreen> {
  bool isChecked = false;
  bool continueWithLastAttempt = false;
  bool isStart = true;
  double minPanelHeight = 0;
  double maxPanelHeight = 0;
  final PanelController _panelController = PanelController();

  Widget PreviousUnfinishedAttempt(StateSetter setState) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          children: [
            Container(
              width: 56.sp,
              height: 56.sp,
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 16.sp),
              decoration: BoxDecoration(
                  border: Border.all(color: lightGrey, width: 1.sp),
                  borderRadius: BorderRadius.circular(1.sp)),
              child: Image.asset(
                'assets/images/about.png',
                width: 20.sp,
                height: 20.sp,
                color: const Color(0xFFEDB458),
              ),
            ),
            Container(
              height: 48.sp,
              alignment: Alignment.center,
              child: Text(
                'Alert: You have a previous unfinished attempt!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            continueWithLastAttempt
                ? Container(margin: EdgeInsets.only(top: 8.sp),child: Text(
                    'You will be redirected to the last attempted question to continue with your attempt. Are you sure you want to continue?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.sp, color: textGrey2, height: 1.5),
                  ))
                : const SizedBox.shrink(),
            SizedBox(height: 16.sp),
            GestureDetector(onTap: (){
              if (!continueWithLastAttempt) {
                setState(() {
                  maxPanelHeight = 400.sp;
                  continueWithLastAttempt = true;
                });
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const CongratulationScreen()));
              }
            },child: gradientButton(continueWithLastAttempt? 'Yes' :'Continue with last attempt')),
            SizedBox(
              height: 16.sp,
            ),
            Container(
              height: 48.sp,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.sp),
                  border: Border.all(color: lightGrey, width: 1.sp)),
              child: Text(
                continueWithLastAttempt
                    ? 'No'.toUpperCase()
                    : 'Finish previous & Start new'.toUpperCase(),
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: textGrey2,
                    letterSpacing: 2),
              ),
            )
          ],
        ));
  }

  Widget Options() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          children: [
            Container(
              height: 48.sp,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.sp),
                  border: Border.all(color: lightGrey, width: 1.sp)),
              child: Text(
                  'Skip exam'.toUpperCase(),
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: textGrey2,
                    letterSpacing: 2),
              ),
            ),
            SizedBox(
              height: 16.sp,
            ),
            Container(
              height: 48.sp,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.sp),
                  border: Border.all(color: lightGrey, width: 1.sp)),
              child: Text(
                'view course'.toUpperCase(),
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: textGrey2,
                    letterSpacing: 2),
              ),
            ),

            SizedBox(
              height: 16.sp,
            ),
            Container(
              height: 48.sp,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.sp),
                  color: secondaryColorLight),
              child: Text(
                'take exam now'.toUpperCase(),
                style: TextStyle(
                    foreground: Paint()
                      ..shader = RadialGradient(
                        colors: const [primaryColor, gradientTwo],
                        center: Alignment.center,
                        radius: 105.sp,
                      ).createShader(
                          const Rect.fromLTWH(0.0, 0.0, 50.0, 24.0),
                          textDirection: TextDirection.ltr),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2),
              ),
            ),
            SizedBox(height: 16.sp,),
            gradientButton('take sample exam'),
            SizedBox(height: 8.sp,),
            Text('This link will be active 15 minutes before the exam', textAlign: TextAlign.center, style: TextStyle(fontSize: 14.sp, color: textGrey2),)
          ],
        ));
  }

  getBottomSheetChild(StateSetter setState) {
    if(isChecked) {
      return PreviousUnfinishedAttempt(setState);
    }
    else {
      return Options();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SlidingUpPanel(
        controller: _panelController,
        minHeight: minPanelHeight,
        maxHeight: maxPanelHeight,
        backdropEnabled: true,
        color: Colors.transparent,
        panel: Container(
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
                  margin: EdgeInsets.only(top: 8.sp, bottom: 10.sp),
                  decoration: BoxDecoration(
                      color: secondaryColorDark,
                      borderRadius: BorderRadius.circular(4.sp)),
                ),
                Expanded(child: getBottomSheetChild(setState)),
              ],
            )),
        body: Stack(
          fit: StackFit.expand,
          children: [
            ListView(
              children: [
                SizedBox(
                  height: 64.sp,
                ),
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
                            'Date & Time'.toUpperCase(),
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
                      Container(
                          height: 87.sp,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(4.sp),
                              border:
                                  Border.all(color: lightGrey, width: 1.sp)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '00:53:20',
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    fontFamily: 'DigitalDream',
                                    color: const Color(0xFF03DAC5)),
                              ),
                              SizedBox(
                                height: 4.sp,
                              ),
                              Text(
                                '30 September, Monday',
                                style: TextStyle(
                                    fontSize: 14.sp, color: textGrey2),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 20.sp,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AttemptHistoryScreen()));
                        },
                        child: Container(
                          height: 48.sp,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.sp),
                              border:
                                  Border.all(color: lightGrey, width: 1.sp)),
                          child: Text(
                            'View attempt history'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: textPrimary,
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.sp,
                      ),
                      Text(
                        'Exam information'.toUpperCase(),
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
                          {'title': 'Exam type', 'value': 'Tale anytime'},
                          {'title': 'Exam duration', 'value': '3 hours'},
                          {'title': 'Passing criteria', 'value': '60 %'},
                          {'title': 'Attempts', 'value': '1/3'},
                          {'title': 'Maximum attempts', 'value': '03'},
                          {'title': 'Proctored', 'value': 'No'},
                          {'title': 'Total no. of questions', 'value': '50'},
                          {'title': 'Total marks', 'value': '30'},
                        ]),
                      ),
                      SizedBox(
                        height: 16.sp,
                      ),
                      Text(
                        'Other information'.toUpperCase(),
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
                      Text(
                        'A. General information:',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: textPrimary,
                            height: 1.33),
                      ),
                      SizedBox(
                        height: 12.sp,
                      ),
                      BulletedText(
                        'The examination will comprise of Objective type Multiple Choice Questions (MCQs)',
                        dotColor: textGrey2,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textFontSize: 16,
                      ),
                      SizedBox(
                        height: 12.sp,
                      ),
                      BulletedText(
                        'All questions are compulsory and each carries One mark',
                        dotColor: textGrey2,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textFontSize: 16,
                      ),
                      SizedBox(
                        height: 12.sp,
                      ),
                      BulletedText(
                        'The total number of questions, duration of examination, will be different based on the course, the detail is available on your screen.',
                        dotColor: textGrey2,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textFontSize: 16,
                      ),
                      SizedBox(
                        height: 12.sp,
                      ),
                      BulletedText(
                        'The Subjects or topics covered in the exam will be as per the Syllabus.',
                        dotColor: textGrey2,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textFontSize: 16,
                      ),
                      SizedBox(
                        height: 12.sp,
                      ),
                      BulletedText(
                        'There will be NO NEGATIVE MARKING for the wrong answers.',
                        dotColor: textGrey2,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textFontSize: 16,
                      ),
                      SizedBox(
                        height: 12.sp,
                      ),
                      Divider(
                        height: 1.sp,
                        thickness: 1.sp,
                        color: lightGrey,
                      ),
                      SizedBox(
                        height: 12.sp,
                      ),
                      Text(
                        'B. Information & instruction:',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: textPrimary,
                            height: 1.33),
                      ),
                      SizedBox(
                        height: 12.sp,
                      ),
                      BulletedText(
                        'The examination does not require using any paper, pen, pencil and calculator.',
                        dotColor: textGrey2,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textFontSize: 16,
                      ),
                      SizedBox(
                        height: 12.sp,
                      ),
                      BulletedText(
                        'Every student will take the examination on a Laptop/Desktop/Smart Phone.',
                        dotColor: textGrey2,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textFontSize: 16,
                      ),
                      SizedBox(
                        height: 12.sp,
                      ),
                      BulletedText(
                        'On computer screen every student will be given objective type type Multiple Choice Questions (MCQs).',
                        dotColor: textGrey2,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textFontSize: 16,
                      ),
                      SizedBox(
                        height: 12.sp,
                      ),
                      BulletedText(
                        ' Each student will get questions and answers in different order selected randomly from a fixed Question Databank.',
                        dotColor: textGrey2,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textFontSize: 16,
                      ),
                      SizedBox(
                        height: 12.sp,
                      ),
                      BulletedText(
                        'The students just need to click on the Right Choice / Correct option from the multiple choices /options given with each question.For Multiple Choice Questions, each question has four options, and the candidate has to click the appropriate option.',
                        dotColor: textGrey2,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textFontSize: 16,
                      ),
                      SizedBox(
                        height: 12.sp,
                      ),
                      Divider(
                        height: 1.sp,
                        thickness: 1.sp,
                        color: lightGrey,
                      ),
                      SizedBox(
                        height: 12.sp,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 24.sp,
                              height: 24.sp,
                              padding: EdgeInsets.all(3.sp),
                              child: Checkbox(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.sp)),
                                  activeColor: primaryColor,
                                  side: BorderSide(
                                      color: textPrimary, width: 2.sp),
                                  checkColor: Colors.black,
                                  value: isChecked,
                                  onChanged: (val) {
                                    setState(() {
                                      isChecked = !isChecked;
                                    });
                                  })),
                          SizedBox(
                            width: 8.sp,
                          ),
                          Expanded(
                              child: Text(
                            'I have read and understood all the instructions given above and agree to adhere to them ',
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: textPrimary,
                                height: 1.5),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 24.sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 156.sp,
                )
              ],
            ),
            Positioned(
              top: 0,
              child: Center(child: Container(
                width: width,
                height: 64.sp,
                alignment: Alignment.center,
                color: secondaryColor,
                padding:
                    EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 12.sp),
                child: Text("Exam1: IT development: Core java fundamentals",
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: textPrimary)),
              ),
            )),
            Positioned(
                bottom: 78.sp,
                child: Container(
                    width: width,
                    height: 88.sp,
                    padding: EdgeInsets.symmetric(vertical: 0.5.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.sp),
                        gradient: LinearGradient(
                            colors: [
                              secondaryColorDarkOutline,
                              secondaryColorDarkOutline.withOpacity(0.15),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Container(
                        padding: EdgeInsets.all(20.sp),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.sp),
                              topRight: Radius.circular(4.sp)),
                        ),
                        child: GestureDetector(onTap: (){
                          setState(() {
                            if (isChecked) {
                              maxPanelHeight = 296.sp;

                            } else {
                              maxPanelHeight = 328.sp;
                            }
                            _panelController.open();
                          });
                        },child: gradientButton(isChecked?"Start" :"Options")))))
          ],
        ));
  }
}
