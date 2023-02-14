import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';

class SkillMatrix extends StatelessWidget {
  const SkillMatrix({Key? key}) : super(key: key);

  Widget GridLine(String name, Color color) {
    return Container(
      width: 723.sp,
      height: 17.sp,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 12.sp, color: neutral, height: 1.33),
          ),
          Divider(
            height: 1.sp,
            thickness: 1.sp,
            color: color,
          )
        ],
      ),
    );
  }

  Widget LegendItem(String name, Color color) {
    return Row(
      children: [
        Container(
          width: 12.sp,
          height: 12.sp,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        SizedBox(
          width: 4.sp,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 12.sp, color: textGrey2, height: 1.33),
        ),
      ],
    );
  }

  Widget Bar(String name, double value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 24.sp,
          height: (152 * value).sp,
          decoration: BoxDecoration(
              color: const Color(0xFF03DAC5),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(2.sp),
                  topLeft: Radius.circular(2.sp))),
        ),
        SizedBox(
          height: 6.sp,
        ),
        Container(
          width: 82.sp,
          height: 32.sp,
          alignment: Alignment.center,
          child: Text(
            name,
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(fontSize: 12.sp, color: textGrey2, height: 1.33),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 0.5.sp, horizontal: 0.5.sp),
        margin: EdgeInsets.only(left: 20.sp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.sp),
            gradient: LinearGradient(colors: [
              secondaryColorDarkOutline,
              secondaryColorDarkOutline.withOpacity(0.15),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Container(
            height: 334.sp,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 15.sp),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(4.sp),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Skill matrix dashboard",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: textPrimary),
              ),
              SizedBox(
                height: 36.sp,
              ),
              Expanded(
                  child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                      width: 723.sp,
                      height: 238.sp,
                      alignment: Alignment.center,
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GridLine("Competent", const Color(0xFFEDB458)),
                              SizedBox(
                                height: 32.sp,
                              ),
                              GridLine("Intermediate", const Color(0xFF41A9EF)),
                              SizedBox(
                                height: 32.sp,
                              ),
                              GridLine("Beginner", const Color(0xFFE782A6)),
                              SizedBox(
                                height: 54.sp,
                              ),
                              Container(
                                width: 723.sp,
                                alignment: Alignment.center,
                                child: Divider(
                                  height: 1.sp,
                                  thickness: 1.sp,
                                  color: lightGrey,
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                              left: 70.sp,
                              bottom: 0.sp,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Bar("UI/UX Design", 1.2),
                                  SizedBox(
                                    width: 4.sp,
                                  ),
                                  Bar("Product Management", 1),
                                  SizedBox(
                                    width: 4.sp,
                                  ),
                                  Bar("Product Design", 0.7),
                                  SizedBox(
                                    width: 4.sp,
                                  ),
                                  Bar("Product Design", 0.7),
                                  SizedBox(
                                    width: 4.sp,
                                  ),
                                  Bar("Product Design", 0.7),
                                  SizedBox(
                                    width: 4.sp,
                                  ),
                                ],
                              ))
                        ],
                      ))
                ],
              )),
              SizedBox(
                height: 12.sp,
              ),
              Row(
                children: [
                  LegendItem("Beginner", const Color(0xFFE782A6)),
                  SizedBox(
                    width: 12.sp,
                  ),
                  LegendItem("Intermediate", const Color(0xFF41A9EF)),
                  SizedBox(
                    width: 12.sp,
                  ),
                  LegendItem("Competent", const Color(0xFFEDB458))
                ],
              )
            ])));
  }
}
