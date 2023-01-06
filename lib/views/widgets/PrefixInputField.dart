import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

Widget prefixInputField(FocusNode focusNode, TextEditingController controller,
    String image, String hint,
    {bool validated = false, Function? onChange, TextInputType inputType = TextInputType.text }) {
  return SizedBox(
      height: 48.sp,
      child: TextField(
          focusNode: focusNode,
          controller: controller,
          onChanged: (val){
            onChange!(val);
          },
          maxLines: 1,
          keyboardType: inputType,
          decoration: InputDecoration(

              contentPadding:  EdgeInsets.only(
                  left: 48, top: 12.sp, bottom: 12.sp, right: 12),
              enabledBorder: OutlineInputBorder(
                  borderSide:  BorderSide(color: focusNode.hasFocus || controller.text.isNotEmpty? secondaryColorDarkOutline: lightGrey),
                  borderRadius: BorderRadius.circular(4.sp)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.circular(4.sp)),
              filled: true,
              fillColor:
                  focusNode.hasFocus ? secondaryColorDark : secondaryColorLight,
              prefixIcon: Container(
                  width: 24.sp,
                  height: 24.sp,
                  margin: EdgeInsets.only(top: 12.sp, bottom: 12.sp, left: 16, right: 12),
                  padding:
                      EdgeInsets.symmetric(horizontal: 2, vertical: 4.sp),
                  child: Image.asset(
                    image,
                    color: focusNode.hasFocus || controller.text.isNotEmpty? textPrimary : textGrey,
                  )),
              suffixIcon: validated
                  ? Container(
                      width: 24.sp,
                      height: 24.sp,
                  margin: const EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 12),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                      child: Image.asset("assets/images/checkmark.png"))
                  : const SizedBox.shrink(),
              suffixIconConstraints:
              BoxConstraints(minHeight: 24.sp, minWidth: 24.sp),
              hintText: hint,
              hintStyle:
                   TextStyle(color: textGrey, fontSize: 16.sp, height: 1.5)),
          cursorColor: textPrimary,
          style: GoogleFonts.poppins(
              color: textPrimary, fontSize: 16.sp, height: 1.5, )));
}
