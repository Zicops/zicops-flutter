import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';

class ExamQuizItem extends StatefulWidget {
  int index;
  String? questionImage;
  String question;
  List options;
  String? selectedOption;

  ExamQuizItem(this.index, this.questionImage, this.question, this.options,
      this.selectedOption);

  @override
  State<StatefulWidget> createState() {
    return _ExamQuizItem();
  }
}

class _ExamQuizItem extends State<ExamQuizItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 16.sp,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 18.sp),
            child: Text(
              "Question ${widget.index.toString()}".toUpperCase(),
              style: TextStyle(
                  color: textGrey2,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  height: 1.33),
            )),
        SizedBox(
          height: 8.sp,
        ),
        Container(
            height: 20.sp,
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Correct',
                  style: TextStyle(
                      color: const Color(0xFF03DAC5),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.43),
                ),
                Text(
                  '2/2',
                  style: TextStyle(
                      color: textPrimary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.43),
                ),
              ],
            )),
        SizedBox(
          height: 8.sp,
        ),
        Text(
          widget.question,
          style: TextStyle(
              color: textPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              height: 1.43),
        ),
        SizedBox(
          height: 11.sp,
        ),
        widget.questionImage != null
            ? Container(
                margin: EdgeInsets.only(bottom: 8.sp),
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4.sp)),
                height: 180.sp,
                child: Image.asset(
                  widget.questionImage!,
                  height: 180.sp,
                  fit: BoxFit.fill,
                ),
              )
            : const SizedBox.shrink(),
        SizedBox(
          height: 12.sp,
        ),
        Container(
            alignment: Alignment.centerLeft,
            height: 16.sp,
            child: Text(
              "Options".toUpperCase(),
              style: TextStyle(
                  color: textGrey2,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  height: 1.33),
            )),
        SizedBox(
          height: 12.sp,
        ),
        ...widget.options.map((e) => Container(
              padding:
                  EdgeInsets.symmetric(vertical: 0.5.sp, horizontal: 0.5.sp),
              margin: EdgeInsets.only(bottom: 8.sp),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.sp),
                  gradient: LinearGradient(
                      colors: e["option"] == widget.selectedOption
                          ? [primaryColor, primaryColor]
                          : [
                              secondaryColorDarkOutline,
                              secondaryColorDarkOutline.withOpacity(0.15),
                            ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 14.sp),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(4.sp),
                  ),
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          child: Row(
                            children: [
                              Container(
                                width: 24.sp,
                                height: 24.sp,
                                margin: EdgeInsets.all(2.sp),
                                transform:
                                    Matrix4.translationValues(-4.sp, 0, 0),
                                child: Radio(
                                  value: e["option"] as String,
                                  groupValue: widget.selectedOption,
                                  activeColor: primaryColor,
                                  onChanged: (String? value) {},
                                ),
                              ),
                              SizedBox(
                                width: 11.sp,
                              ),
                              Expanded(
                                  child: Text(
                                e["option"],
                                softWrap: true,
                                style: TextStyle(
                                    color: e["option"] == widget.selectedOption?textPrimary:textGrey2,
                                    fontSize: 14.sp,
                                    height: 1.43),
                              )),
                              const Spacer(),
                              if (e["option"] == widget.selectedOption)
                                Container(
                                  width: 24.sp,
                                  height: 24.sp,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/images/checkmark.png',
                                    width: 17.5.sp,
                                    height: 14.sp,
                                    color: const Color(0xFF03DAC5),
                                  ),
                                )
                            ],
                          )),
                      e["optionImage"] != null
                          ? SizedBox(
                              height: 12.sp,
                            )
                          : const SizedBox.shrink(),
                      e["optionImage"] != null
                          ? Image.asset(e["optionImage"])
                          : const SizedBox.shrink()
                    ],
                  )),
            )),
        SizedBox(height: 16.sp,),
        Divider(
          height: 1.sp,
          thickness: 1.sp,
          color: lightGrey,
        ),
      ],
    );
  }
}
