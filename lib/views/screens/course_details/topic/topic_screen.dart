import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';
import '../../../widgets/comment_item.dart';
import '../../../widgets/module_card.dart';
import '../../../widgets/modules_dropdown.dart';
import '../../../widgets/more_like_this.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TopicScreen();
  }
}

class _TopicScreen extends State<TopicScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 11.sp),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.only(top: 11.sp, right: 20.sp, left: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ModulesDropDown(),
              SizedBox(
                height: 13.sp,
              ),
              SizedBox(
                height: 16.sp,
                child: Text("Chapter 1: Introduction".toUpperCase(),
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: textGrey2,
                        height: 1.33,
                        letterSpacing: 1)),
              ),

              SizedBox(
                height: 8.sp,
              ),
              SizedBox(
                height: 320.sp,
                child: ListView(
                  children: [
                    ...[1, 2, 3, 4, 5].map(
                      (e) => ModuleCard("$e.Empathize", "1hr 50 mins",
                          "assets/images/course_preview_2.png"),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12.sp,
              ),
              Divider(
                height: 1.sp,
                thickness: 1.sp,
                color: lightGrey,
              ),
              SizedBox(
                height: 14.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discussion",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: textPrimary),
                  ),
                  Container(
                    width: 24.sp,
                    height: 24.sp,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 3.sp, horizontal: 7.4.sp),
                    child: Image.asset("assets/images/unfold_more.png"),
                  )
                ],
              ),
              CommentItem(),
              SizedBox(
                height: 14.sp,
              ),
            ],
          ),
        ),
        MoreLikeThis()
      ]),
    );
  }
}
