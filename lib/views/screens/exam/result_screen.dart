import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/widgets/GradientButton.dart';
import 'package:zicops/views/widgets/alternate_color_container.dart';

import '../../../utils/colors.dart';
import 'attempt_history_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ResultScreen();
  }
}

class _ResultScreen extends State<ResultScreen> {
  bool hasPassed = true;

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
            title: SizedBox(
              height: 24.sp,
              child: Text("Result",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: textPrimary)),
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          children: [
            SizedBox(
              height: 60.sp,
            ),
            Center(
                child: Container(
                    width: 120.sp,
                    height: 120.sp,
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                        border: Border.all(color: lightGrey, width: 1.sp),
                        borderRadius: BorderRadius.circular(4.sp)),
                    child: Image.asset(hasPassed
                        ? 'assets/images/pass.png'
                        : 'assets/images/fail.png'))),
            SizedBox(
              height: 20.sp,
            ),
            hasPassed
                ? SizedBox(
                    height: 72.sp,
                    child: Text.rich(
                      TextSpan(
                          text: 'Congratulations ',
                          style: TextStyle(
                              foreground: Paint()
                                ..shader = RadialGradient(
                                  colors: const [primaryColor, gradientTwo],
                                  center: Alignment.center,
                                  radius: 105.sp,
                                ).createShader(
                                    const Rect.fromLTWH(0.0, 0.0, 50.0, 24.0),
                                    textDirection: TextDirection.ltr),
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.28),
                          children: <InlineSpan>[
                            TextSpan(
                                text: 'Aakash',
                                style: TextStyle(
                                    foreground: Paint()
                                      ..shader = RadialGradient(
                                        colors: const [
                                          textPrimary,
                                          textPrimary
                                        ],
                                        center: Alignment.center,
                                        radius: 35.sp,
                                      ).createShader(
                                          const Rect.fromLTWH(
                                              0.0, 0.0, 50.0, 24.0),
                                          textDirection: TextDirection.ltr),
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.w500,
                                    height: 1.28))
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  )
                : SizedBox(
                    height: 36.sp,
                    child: Text.rich(
                        TextSpan(
                            text: 'Sorry ',
                            style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w500,
                                color: delete,
                                height: 1.28),
                            children: <InlineSpan>[
                              TextSpan(
                                  text: 'Aakash',
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.w500,
                                      color: textPrimary,
                                      height: 1.28))
                            ]),
                        textAlign: TextAlign.center),
                  ),
            SizedBox(
              height: 12.sp,
            ),
            SizedBox(
              height: 28.sp,
              child: Text(
                hasPassed
                    ? 'You have completed the exam.'
                    : 'Better luck next time.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: textPrimary,
                    height: 1.4),
              ),
            ),
            SizedBox(
              height: 12.sp,
            ),
            SizedBox(
                height: 48.sp,
                child: Text(
                  'IT developmen - Core java fundamentals',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 16.sp, color: textGrey2, height: 1.5),
                )),
            SizedBox(
              height: 24.sp,
            ),
            SizedBox(
              height: 16.sp,
              child: Text(
                'Result'.toUpperCase(),
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: textGrey2,
                    letterSpacing: 1,
                    height: 1.33),
              ),
            ),
            SizedBox(
              height: 8.sp,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.sp),
                  border: Border.all(color: lightGrey, width: 1.sp)),
              child: AlternateColorContainer([
                const {'title': 'Attempts', 'value': '1/3'},
                const {'title': 'Exam score', 'value': '10/100'},
                {'title': 'Result', 'value': hasPassed? 'Pass':'Failed', 'value_color': hasPassed? const Color(0xFF03DAC5):delete}
              ]),
            ),
            SizedBox(
              height: 20.sp,
            ),
            GestureDetector(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const AttemptHistoryScreen()));
            },child: Container(
              height: 48.sp,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.sp),
                  border: Border.all(color: lightGrey, width: 1.sp)),
              child: Text(
                'Attempt history'.toUpperCase(),
                style: TextStyle(
                    foreground: Paint()
                      ..shader = RadialGradient(
                        colors: const [primaryColor, gradientTwo],
                        center: Alignment.center,
                        radius: 105.sp,
                      ).createShader(const Rect.fromLTWH(0.0, 0.0, 50.0, 24.0),
                          textDirection: TextDirection.ltr),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2),
              ),
            )),
            SizedBox(
              height: 20.sp,
            ),
            Container(
              height: 48.sp,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.sp),
                  border: Border.all(color: lightGrey, width: 1.sp)),
              child: Text(
                'Go to main screen'.toUpperCase(),
                style: TextStyle(
                    foreground: Paint()
                      ..shader = RadialGradient(
                        colors: const [primaryColor, gradientTwo],
                        center: Alignment.center,
                        radius: 105.sp,
                      ).createShader(const Rect.fromLTWH(0.0, 0.0, 50.0, 24.0),
                          textDirection: TextDirection.ltr),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            gradientButton('Download result'),
            SizedBox(
              height: 20.sp,
            ),
          ],
        ));
  }
}
