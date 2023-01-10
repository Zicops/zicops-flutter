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
        Text(
          "${widget.index.toString()}.",
          style: TextStyle(
              color: textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              height: 1.33),
        ),
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
          height: 8.sp,
        ),
        Divider(
          height: 0.5.sp,
          thickness: 0.5.sp,
          color: secondaryColorDarkOutline,
        ),
        SizedBox(
          height: 12.sp,
        ),
        Text(
          "Options".toUpperCase(),
          style: TextStyle(
              color: textGrey2,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              height: 1.33),
        ),
        SizedBox(
          height: 12.sp,
        ),
        ...widget.options.map((e) => Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 14.sp),
              margin: EdgeInsets.only(bottom: 8.sp),
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(4.sp),
                  border: Border.all(
                    color: secondaryColorDarkOutline,width: 0.5.sp
                  )),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.selectedOption = e["option"];
                    });
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 24.sp,
                            height: 24.sp,
                            padding: EdgeInsets.all(2.sp),
                            child: Radio(
                              value: e["option"] as String,
                              groupValue: widget.selectedOption,
                              onChanged: (e) {
                                setState(() {
                                  widget.selectedOption = e as String?;
                                });
                              },
                              activeColor: primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: 15.sp,
                          ),
                          Text(
                            e["option"],
                            style: TextStyle(
                                color: textGrey2,
                                fontSize: 14.sp,
                                height: 1.43),
                          )
                        ],
                      ),
                      e["optionImage"] != null
                          ? SizedBox(
                              height: 14.sp,
                            )
                          : const SizedBox.shrink(),
                      e["optionImage"] != null
                          ? Image.asset(e["optionImage"])
                          : const SizedBox.shrink()
                    ],
                  )),
            ))
      ],
    );
  }
}
