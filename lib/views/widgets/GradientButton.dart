import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  const GradientButton(this.title, {super.key, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 48.sp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.sp),
          // gradient: const LinearGradient(colors: [primaryColor, gradientTwo])
          image: const DecorationImage(
              image: AssetImage("assets/images/button_bg.png"),
              fit: BoxFit.fill)),
      child: isLoading
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: Colors.white,
              ))
          : Text(
              title.toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  letterSpacing: 2,
                  height: 1.5),
            ),
    );
  }
}
