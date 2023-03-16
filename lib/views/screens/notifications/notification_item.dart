import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

class NotificationItem extends StatelessWidget {
  bool isUnread;

  NotificationItem({Key? key, this.isUnread = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 20.sp),
        alignment: Alignment.center,
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 8.sp,
              ),
              Row(
                children: [
                  isUnread
                      ? Container(
                          width: 6.sp,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/dot.png',
                            width: 6.sp,
                            height: 6.sp,
                            color: delete,
                          ),
                        )
                      : SizedBox(
                          width: 6.sp,
                        ),
                  SizedBox(
                    width: 6.sp,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(2.sp),
                      child: Container(
                        width: 64.sp,
                        height: 64.sp,
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/course_preview.png',
                          width: 64.sp,
                          height: 64.sp,
                          fit: BoxFit.fill,
                        ),
                      )),
                ],
              ),
              SizedBox(
                width: 12.sp,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: textGrey2,
                        height: 1.43),
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  Row(
                    children: [
                      Text(
                        'Learning folder',
                        style: TextStyle(
                            color: textGrey2,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.33),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 8.sp,
                      ),
                      Text(
                        "\u2022",
                        style: TextStyle(
                            color: textGrey2,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.33),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 8.sp,
                      ),
                      Text(
                        "Now",
                        style: TextStyle(
                            color: textGrey2,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.33),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.sp,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.sp),
                        border: Border.all(color: lightGrey, width: 1.sp)),
                    child: Text(
                      'learning Folder'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: textPrimary,
                          height: 1.33,
                          letterSpacing: 1),
                    ),
                  )
                ],
              )),
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
              child: Divider(
                height: 1.sp,
                thickness: 1.sp,
                color: lightGrey,
              ))
        ]));
  }
}
