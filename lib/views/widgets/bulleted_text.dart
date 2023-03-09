import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/utils/colors.dart';

class BulletedText extends StatelessWidget {
  String text;
  double horizontal;
  double vertical;
  Color dotColor;
  double textFontSize;
  CrossAxisAlignment crossAxisAlignment;
  BulletedText(this.text,
      {this.horizontal = 0,
      this.vertical = 0,
      this.dotColor = textPrimary,
      this.crossAxisAlignment = CrossAxisAlignment.center,
        this.textFontSize = 12,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: Row(
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 4.sp,
              height: 4.sp,
              margin: EdgeInsets.only(top: crossAxisAlignment == CrossAxisAlignment.start? 8.sp :0),
              child: Image.asset(
                "assets/images/dot.png",
                color: dotColor,
              ),
            ),
            SizedBox(
              width: 8.sp,
            ),
            SizedBox(
              width: 270.sp,
              child: Text(
                text,
                softWrap: true,
                style: TextStyle(fontSize: textFontSize.sp, color: textGrey2),
              ),
            )
          ],
        ));
  }
}
