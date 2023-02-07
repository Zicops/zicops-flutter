import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';

class BookmarkListItem extends StatefulWidget {
  String desc;
  String courseLength;
  String preview;
  bool showDivider;

  BookmarkListItem(this.desc, this.courseLength, this.preview,
      {this.showDivider = false, Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BookmarkListItem();
  }
}

class _BookmarkListItem extends State<BookmarkListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320.sp,
        padding: EdgeInsets.only(top: 8.sp, bottom: 11.sp),
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(4.sp),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              widget.preview,
                              fit: BoxFit.fill,
                              width: 48.sp,
                              height: 48.sp,
                            ),
                            Container(
                              color: Colors.black.withOpacity(0.43),
                              height: 48.sp,
                            ),
                            Image.asset(
                              "assets/images/play_button.png",
                              width: 20.sp,
                              height: 20.sp,
                              opacity: const AlwaysStoppedAnimation(0.7),
                            )
                          ],
                        )),
                    SizedBox(
                      width: 16.sp,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.courseLength,
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              height: 1.33),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                            width: 248.sp,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.desc,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyle(
                                  color: textGrey2,
                                  fontSize: 12.sp,
                                  height: 1.33),
                            ))
                      ],
                    ),
                    SizedBox(
                      width: 8.sp,
                    ),
                  ],
                ),
              ],
            ),
            if(widget.showDivider) SizedBox(height: 12.sp,),
            if(widget.showDivider) Divider(height: 1.sp, thickness: 1.sp, color: lightGrey,)
          ],
        ));
  }
}
