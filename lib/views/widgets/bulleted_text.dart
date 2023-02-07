import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/utils/colors.dart';

class BulletedText extends StatelessWidget{
  String text;
  double horizontal;
  double vertical;
  BulletedText(this.text,{this.horizontal= 0, this.vertical=0 ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: horizontal,vertical: vertical), child:Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      SizedBox(width:4.sp,height:4.sp, child: Image.asset("assets/images/dot.png", color: textPrimary,),),
      SizedBox(width: 8.sp,),
      SizedBox(width:270.sp, child: Text(text, softWrap:true, style: TextStyle(fontSize: 12.sp, color: textGrey2),),)
    ],));
  }

}