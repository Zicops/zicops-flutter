import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';

class CohortCard extends StatefulWidget {
  final String courseName;
  final String description;
  final String manager;
  final String managerPic;
  final String preview;

  CohortCard(this.courseName, this.description, this.manager, this.managerPic,
      this.preview);

  @override
  State<StatefulWidget> createState() {
    return _CohortCard();
  }
}

class _CohortCard extends State<CohortCard> {
  @override
  Widget build(BuildContext context) {
    //CjD33TfEMP
    return Container(
        padding: EdgeInsets.symmetric(vertical: 0.5.sp, horizontal: 0.5.sp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.sp),
            gradient: LinearGradient(colors: [
              secondaryColorDarkOutline,
              secondaryColorDarkOutline.withOpacity(0.15),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Container(
          height: 284.sp,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(4.sp),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  SizedBox(
                      height: 179.sp,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4.sp),
                                  topLeft: Radius.circular(4.sp)),
                              child: Image.network(
                                widget.preview,
                                fit: BoxFit.fill,
                                height: 179.sp,
                              )),
                        ],
                      )),
                  Container(
                    height: 104.sp,
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.sp, vertical: 11.sp),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.courseName,
                          style: TextStyle(
                              color: textPrimary,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.5),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.description,
                          style: TextStyle(
                              color: textGrey2,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.43),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 16.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              foregroundImage: NetworkImage(widget.managerPic),
                              radius: 10.sp,
                            ),
                            SizedBox(
                              width: 8.sp,
                            ),
                            Text(
                              widget.manager,
                              style: TextStyle(
                                  color: textPrimary,
                                  fontSize: 14.sp,
                                  height: 1.43),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
