import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zicops/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zicops/views/screens/account_setup/account_setup_screen.dart';
import 'package:zicops/views/screens/forget_pass/forget_pass_screen.dart';
import 'package:zicops/views/widgets/GradientButton.dart';

import '../../../utils/validation.dart';
import '../../widgets/CustomPassword.dart';
import '../../widgets/PrefixInputField.dart';

class LspSelectionScreen extends StatefulWidget {
  const LspSelectionScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LspSelectionScreen();
  }
}

class _LspSelectionScreen extends State<LspSelectionScreen> {
  bool isLoading = false;

  Widget cohortCard(String preview, String title) {
    return Column(
      children: [
        SizedBox(
          width: 216.sp,
          height: 216.sp,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(4.sp),
              child: Image.asset(
                preview,
                width: 216.sp,
                height: 216.sp,
              )),
        ),
        SizedBox(height: 8.sp),
        SizedBox(
          height: 24.sp,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: textPrimary),
          ),
        ),
        SizedBox(height: 20.sp,)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"),
                fit: BoxFit.fill,
              )),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                const SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Image.asset(
                      "assets/images/zicops_logo.png",
                      width: 40.sp,
                    ),
                    SizedBox(height: 20.sp),
                    Image.asset(
                      "assets/images/zicops_name.png",
                      width: 120.sp,
                      height: 20.sp,
                    ),
                    SizedBox(height: 20.sp),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: Text(
                          "Welcome!",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 24.sp,
                              color: textPrimary,
                              height: 1.3),
                          textAlign: TextAlign.center,
                        )),
                  ])
                ]),
                SizedBox(height: 4.sp),
                SizedBox(
                    child: Text(
                  "Select your Learning space!",
                  style:
                      TextStyle(fontSize: 16.sp, color: textGrey2, height: 1.5),
                  textAlign: TextAlign.center,
                )),
                SizedBox(height: 20.sp),
                SizedBox(
                    child: Text(
                  "These learning spaces are empowered by zicops learning technology pvt ltd",
                  style:
                      TextStyle(fontSize: 16.sp, color: textGrey2, height: 1.5),
                  textAlign: TextAlign.center,
                )),
                SizedBox(height: 40.sp),
                Expanded(
                    child: ListView(
                  children: [
                    ...[1, 2, 3].map((e) => cohortCard(
                        "assets/images/cohort_card.png",
                        "Zicops Learning space"))
                  ],
                ))
              ]))),
    );
  }
}
