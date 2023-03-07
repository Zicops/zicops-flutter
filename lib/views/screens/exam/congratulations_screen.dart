import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/screens/exam/answer_key_screen.dart';
import 'package:zicops/views/screens/exam/result_screen.dart';
import 'package:zicops/views/screens/home/home.dart';

import '../../../utils/colors.dart';

class CongratulationScreen extends StatefulWidget {
  const CongratulationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CongratulationScreen();
  }
}

class _CongratulationScreen extends State<CongratulationScreen> {
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
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(
              children: [
                const Spacer(),
                Container(
                    width: 160.sp,
                    height: 160.sp,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                        border: Border.all(color: lightGrey, width: 1.sp),
                        borderRadius: BorderRadius.circular(4.sp)),
                    child: Image.asset('assets/images/completed.png')),
                SizedBox(
                  height: 20.sp,
                ),
                SizedBox(
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
                                      colors: const [textPrimary, textPrimary],
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
                ),
                SizedBox(
                  height: 12.sp,
                ),
                SizedBox(
                  height: 72.sp,
                  child: Text(
                    'You have successfully completed the exam: IT development - Core java fundamentals ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.sp, color: textGrey2, height: 1.5),
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResultScreen()));
                    },
                    child: Container(
                      height: 48.sp,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.sp),
                          border: Border.all(color: lightGrey, width: 1.sp)),
                      child: Text(
                        'report'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            foreground: Paint()
                              ..shader = RadialGradient(
                                colors: const [primaryColor, gradientTwo],
                                center: Alignment.center,
                                radius: 105.sp,
                              ).createShader(
                                  const Rect.fromLTWH(0.0, 0.0, 50.0, 24.0),
                                  textDirection: TextDirection.ltr),
                            letterSpacing: 2),
                      ),
                    )),
                SizedBox(
                  height: 20.sp,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AnswerKeyScreen()));
                    },
                    child: Container(
                      height: 48.sp,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.sp),
                          border: Border.all(color: lightGrey, width: 1.sp)),
                      child: Text(
                        'answer key'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            foreground: Paint()
                              ..shader = RadialGradient(
                                colors: const [primaryColor, gradientTwo],
                                center: Alignment.center,
                                radius: 105.sp,
                              ).createShader(
                                  const Rect.fromLTWH(0.0, 0.0, 50.0, 24.0),
                                  textDirection: TextDirection.ltr),
                            letterSpacing: 2),
                      ),
                    )),
                SizedBox(
                  height: 20.sp,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                        return const HomePage();
                      }), (r){
                        return false;
                      });
                    },
                    child: Container(
                      height: 48.sp,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.sp),
                          border: Border.all(color: lightGrey, width: 1.sp)),
                      child: Text(
                        'return to main screen'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            foreground: Paint()
                              ..shader = RadialGradient(
                                colors: const [primaryColor, gradientTwo],
                                center: Alignment.center,
                                radius: 105.sp,
                              ).createShader(
                                  const Rect.fromLTWH(0.0, 0.0, 50.0, 24.0),
                                  textDirection: TextDirection.ltr),
                            letterSpacing: 2),
                      ),
                    )),
                SizedBox(
                  height: 20.sp,
                ),
              ],
            )));
  }
}
