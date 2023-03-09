import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/widgets/alternate_color_container.dart';

import '../../../utils/colors.dart';

class AttemptHistoryScreen extends StatefulWidget {
  const AttemptHistoryScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AttemptHistoryScreen();
  }
}

class _AttemptHistoryScreen extends State<AttemptHistoryScreen> {
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
              child: Text("Attempt history",
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
            ...[1, 2, 3].map((e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24.sp,
                    ),
                    SizedBox(
                      height: 16.sp,
                      child: Text(
                        'Attempt $e'.toUpperCase(),
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
                      child: AlternateColorContainer(const [
                        {
                          'title': 'Started at',
                          'value': '22-04-2022, 11:30 AM IST'
                        },
                        {
                          'title': 'Finishes at',
                          'value': '25-04-2022, 01:29 PM IST'
                        },
                        {'title': 'Duration', 'value': '3 hrs'},
                        {'title': 'Score', 'value': '90/100'},
                        {
                          'title': 'Result',
                          'value': 'Pass',
                          'value_color': Color(0xFF03DAC5)
                        },
                      ]),
                    ),
                  ],
                )),
            SizedBox(height: 24.sp)
          ],
        ));
  }
}
