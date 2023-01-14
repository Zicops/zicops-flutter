import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';

class QuizItem extends StatefulWidget {
  int index;
  String? questionImage;
  String question;
  List options;
  String? selectedOption;
  Function onOptionSelect;

  QuizItem(this.index, this.questionImage, this.question, this.options,
      this.selectedOption, this.onOptionSelect);

  @override
  State<StatefulWidget> createState() {
    return _QuizItem();
  }
}

class _QuizItem extends State<QuizItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 24.sp,
            alignment: Alignment.centerLeft,
            child: Text(
              "${widget.index.toString()}.",
              style: TextStyle(
                  color: textPrimary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.33),
            )),
        SizedBox(
          height: 8.sp,
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
        Text(
          widget.question,
          style: TextStyle(
              color: textPrimary,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              height: 1.43),
        ),
        SizedBox(
          height: 11.sp,
        ),
        Divider(
          height: 0.5.sp,
          thickness: 0.5.sp,
          color: lightGrey,
        ),
        SizedBox(
          height: 9.sp,
        ),
        Container(
            alignment: Alignment.centerLeft,
            height: 24.sp,
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
          height: 8.sp,
        ),
        ...widget.options.map((e) => GestureDetector(
            onTap: () {
              setState(() {
                widget.selectedOption = e["option"];
              });
            },
            child: Container(
              padding:
                  EdgeInsets.symmetric(vertical: 0.5.sp, horizontal: 0.5.sp),
              margin: EdgeInsets.only(bottom: 8.sp),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.sp),
                  gradient: LinearGradient(colors: [
                    secondaryColorDarkOutline,
                    secondaryColorDarkOutline.withOpacity(0.15),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.sp, vertical: 14.sp),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(4.sp),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 24.sp,
                            height: 24.sp,
                            padding: EdgeInsets.all(2.sp),
                            transform: Matrix4.translationValues(-4.sp, 0, 0),
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
                                color: textGrey2,
                                fontSize: 14.sp,
                                height: 1.43),
                          ))
                        ],
                      ),
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
            )))
      ],
    );
  }
}
