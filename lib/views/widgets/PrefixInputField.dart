import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

Widget prefixInputField(
  FocusNode focusNode,
  TextEditingController controller,
  String image,
  String hint,
  bool enabled, {
  bool validated = false,
  Function? onChange,
  TextInputType inputType = TextInputType.text,
  TextInputAction textInputAction = TextInputAction.next,
  Function? validator,
}) {
  return Container(
      // height: 96.sp,
      alignment: Alignment.centerLeft,
      child: TextFormField(
          enabled: enabled,
          focusNode: focusNode,
          controller: controller,
          onChanged: (val) {
            if (onChange != null) {
              onChange(val);
            }
          },
          maxLines: 1,
          keyboardType: inputType,
          textInputAction: textInputAction,
          validator: (val) {
            if (validator != null) {
              return validator(val);
            }
            return null;
          },
          decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(
                  left: 48.sp, top: 12.sp, bottom: 12.sp, right: 12.sp),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: focusNode.hasFocus ||
                              controller.text.isNotEmpty ||
                              !validated
                          ? secondaryColorDarkOutline
                          : lightGrey),
                  borderRadius: BorderRadius.circular(4.sp)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.circular(4.sp)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: error,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(4.sp))),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: error,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(4.sp))),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: focusNode.hasFocus ||
                              controller.text.isNotEmpty ||
                              !validated
                          ? secondaryColorDarkOutline
                          : lightGrey),
                  borderRadius: BorderRadius.circular(4.sp)),
              filled: true,
              fillColor:
                  focusNode.hasFocus ? secondaryColorDark : secondaryColorLight,
              prefixIcon: Container(
                  width: 24.sp,
                  height: 24.sp,
                  margin: EdgeInsets.only(
                      top: 12.sp, bottom: 12.sp, left: 12.sp, right: 12.sp),
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4.sp),
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    image,
                    color: focusNode.hasFocus || controller.text.isNotEmpty
                        ? textPrimary
                        : textGrey,
                  )),
              suffixIcon: validated
                  ? Container(
                      width: 23.sp,
                      height: 23.sp,
                      margin: const EdgeInsets.only(
                          top: 12, bottom: 12, left: 0, right: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 4),
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/checkmark.png"))
                  : const SizedBox.shrink(),
              suffixIconConstraints:
                  BoxConstraints(minHeight: 24.sp, minWidth: 24.sp),
              hintText: hint,
              hintStyle: TextStyle(color: textGrey, fontSize: 16.sp, height: 1.5)),
          cursorColor: textPrimary,
          style: GoogleFonts.poppins(
            color: textPrimary,
            fontSize: 16.sp,
            height: 1.5,
          )));
}
