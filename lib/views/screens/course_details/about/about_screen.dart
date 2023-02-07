import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/utils/colors.dart';
import 'package:zicops/views/widgets/bulleted_text.dart';

import '../../../widgets/expansion_container.dart';
import '../../../widgets/more_like_this.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AboutScreen();
  }
}

class _AboutScreen extends State<AboutScreen> {
  Widget courseInfo() {
    return SizedBox(
        height: 202.sp,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/course_preview.png",
              fit: BoxFit.fill,
            ),
            Container(
              color: Colors.black.withOpacity(0.43),
              height: 202.sp,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 20.sp, right: 20.sp, top: 14.sp, bottom: 16.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Complete Java Programming - Beginner to Advance",
                    softWrap: true,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: textPrimary,
                        height: 1.4),
                  ),
                  Text("Zicops special",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: primaryColor)),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Self Learning".toUpperCase(),
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              color: textPrimary,
                              height: 1.33)),
                      Text(
                        "Econtent".toUpperCase(),
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            color: textPrimary,
                            height: 1.33),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget courseBadge(String icon, String label) {
    return SizedBox(
      height: 24.sp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 22.sp,
            height: 22.sp,
            alignment: Alignment.center,
            padding: EdgeInsets.all(1.5.sp),
            child: Image.asset(icon, fit: BoxFit.fill,),
          ),
          SizedBox(
            width: 4.sp,
          ),
          Text(
            label,
            style: TextStyle(fontSize: 14.sp, color: textPrimary, height: 1.43),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          courseInfo(),
          Padding(
            padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 20.sp),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 48.sp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.sp),
                      // gradient: const LinearGradient(colors: [primaryColor, gradientTwo])
                      image: const DecorationImage(
                          image: AssetImage("assets/images/button_bg.png"),
                          fit: BoxFit.fill)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "+".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                            letterSpacing: 2,
                            color: secondaryColorLight,
                            height: 1.5),
                      ),
                      SizedBox(width: 6.sp,),
                      Text(
                        "Course Preview".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            letterSpacing: 2,
                            color: secondaryColorLight,
                            height: 1.5),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 17.sp,
                ),
                courseBadge("assets/images/signal.png", "Intermediate"),
                SizedBox(
                  height: 8.sp,
                ),
                courseBadge("assets/images/gradient_clock.png", "1hrs 20mins"),
                SizedBox(
                  height: 8.sp,
                ),
                courseBadge(
                    "assets/images/gradient_flag.png", "24th December 2022"),
                SizedBox(
                  height: 8.sp,
                ),
                courseBadge(
                    "assets/images/gradient_calendar.png", "30 days remaining"),
                SizedBox(
                  height: 8.sp,
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy he... Read More",
                  style: TextStyle(
                      fontSize: 14.sp, color: textPrimary, height: 1.43),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Divider(
                  height: 1.sp,
                  thickness: 1.sp,
                  color: lightGrey,
                ),
                SizedBox(
                  height: 12.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      foregroundImage:
                          const AssetImage("assets/images/avatar_default.png"),
                      radius: 18.sp,
                    ),
                    SizedBox(
                      width: 15.sp,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.sp,
                          child: Text(
                            "Owned by: Zicops",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                height: 1.43,
                                color: textPrimary),
                          ),
                        ),
                        SizedBox(
                          height: 16.sp,
                          child: Text(
                            "Instructor: Junko Takai ",
                            style: TextStyle(
                                fontSize: 12.sp,
                                height: 1.33,
                                color: textPrimary),
                          ),
                        ),
                      ],
                    )
                  ],
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
                  height: 12.sp,
                ),
                ExpansionContainer(
                  "Learning Objectives",
                  Column(children: [
                    Divider(
                      height: 1.sp,
                      thickness: 1.sp,
                      color: lightGrey,
                    ),
                    SizedBox(
                      height: 13.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                ExpansionContainer(
                  "Benefits",
                  Column(children: [
                    Divider(
                      height: 1.sp,
                      thickness: 1.sp,
                      color: lightGrey,
                    ),
                    SizedBox(
                      height: 13.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                ExpansionContainer(
                  "Pre-requisites",
                  Column(children: [
                    Divider(
                      height: 1.sp,
                      thickness: 1.sp,
                      color: lightGrey,
                    ),
                    SizedBox(
                      height: 13.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                ExpansionContainer(
                  "Target audience",
                  Column(children: [
                    Divider(
                      height: 1.sp,
                      thickness: 1.sp,
                      color: lightGrey,
                    ),
                    SizedBox(
                      height: 13.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                ExpansionContainer(
                  "Course inclusion",
                  Column(children: [
                    Divider(
                      height: 1.sp,
                      thickness: 1.sp,
                      color: lightGrey,
                    ),
                    SizedBox(
                      height: 13.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                    BulletedText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        horizontal: 15.sp),
                    SizedBox(
                      height: 20.sp,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 16.sp,
                ),
                Divider(
                  height: 1.sp,
                  thickness: 1.sp,
                  color: lightGrey,
                ),
                SizedBox(
                  height: 16.sp,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 24.sp,
                margin: EdgeInsets.only(left: 20.sp),
                child: Text(
                  "Related Skills",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: textPrimary),
                ),
              ),
              SizedBox(
                height: 8.sp,
              ),
              Container(
                height: 28.sp,
                alignment: Alignment.center,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 20.sp,
                    ),
                    ...[
                      "Database",
                      "Enterprise",
                      "Design",
                      "Coding"
                    ].map((e) => Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.5.sp, horizontal: 0.5.sp),
                        margin: EdgeInsets.only(right: 8.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.sp),
                            gradient: LinearGradient(
                                colors: [
                                  secondaryColorDarkOutline,
                                  secondaryColorDarkOutline.withOpacity(0.15),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4.sp, horizontal: 12.sp),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.sp),
                                color: secondaryColor),
                            child: SizedBox(
                                height: 20.sp,
                                child: Text(
                                  e,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: textPrimary,
                                      height: 1.43),
                                )))))
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 16.sp,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Divider(
                height: 1.sp,
                thickness: 1.sp,
                color: lightGrey,
              )),
          SizedBox(
            height: 14.sp,
          ),
          MoreLikeThis()
        ],
      ),
    );
  }
}
