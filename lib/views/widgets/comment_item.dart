import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/utils/colors.dart';

class CommentItem extends StatefulWidget {
  const CommentItem({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CommentItem();
  }
}

class _CommentItem extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.only(top: 13.sp, bottom: 16.sp),
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 4.sp),
              child: CircleAvatar(
                foregroundImage:
                    const AssetImage("assets/images/avatar_default.png"),
                radius: 14.sp,
              ),
            ),
            SizedBox(
              width: 16.sp,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 20.sp,
                    child: Text(
                      "Debraj Mukherjee",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: textPrimary),
                    )),
                SizedBox(
                  height: 4.sp,
                ),
                SizedBox(
                    height: 16.sp,
                    child: Text("2mins ago",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: textGrey2))),
                SizedBox(
                  height: 8.sp,
                ),
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: textGrey2)),
                SizedBox(
                  height: 16.sp,
                ),
                SizedBox(
                    height: 24.sp,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 24.sp,
                            height: 24.sp,
                            padding: EdgeInsets.symmetric(
                                vertical: 2.sp, horizontal: 1.sp),
                            child: Image.asset("assets/images/thumb_up.png",
                                fit: BoxFit.fill)),
                        SizedBox(
                          width: 8.sp,
                        ),
                        Text(
                          "56",
                          style: TextStyle(fontSize: 14.sp, color: textGrey2),
                        ),
                        SizedBox(
                          width: 24.sp,
                        ),
                        Container(
                            width: 24.sp,
                            height: 24.sp,
                            padding: EdgeInsets.symmetric(
                                vertical: 2.sp, horizontal: 1.sp),
                            child: Image.asset("assets/images/thumb_down.png",
                                fit: BoxFit.fill)),
                        SizedBox(
                          width: 8.sp,
                        ),
                        Text(
                          "56",
                          style: TextStyle(fontSize: 14.sp, color: textGrey2),
                        ),
                        SizedBox(
                          width: 24.sp,
                        ),
                        Container(
                            width: 24.sp,
                            height: 24.sp,
                            padding: EdgeInsets.symmetric(
                                vertical: 2.sp, horizontal: 2.sp),
                            child: Image.asset(
                              "assets/images/comment.png",
                              fit: BoxFit.fill,
                            )),
                        SizedBox(
                          width: 8.sp,
                        ),
                        Text(
                          "Reply",
                          style: TextStyle(fontSize: 14.sp, color: textGrey2),
                        ),
                        SizedBox(
                          width: 24.sp,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 16.sp,
                ),
                Text("299 replies",
                    style: TextStyle(fontSize: 14.sp, color: textPrimary))
              ],
            )),
            Container(
              width: 24.sp,
              height: 24.sp,
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/vert_dots.png",
                width: 4.sp,
                height: 16.sp,
              ),
            )
          ],
        ),
      ),
      Divider(
        height: 1.sp,
        thickness: 1.sp,
        color: lightGrey,
      ),
    ]);
  }
}
