import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';
import '../../../widgets/main_tab.dart';

class DateCard extends StatefulWidget {
  Widget child;


  DateCard(this.child, {Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _DateCard();
  }
}

class _DateCard extends State<DateCard> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 0.5.sp, horizontal: 0.5.sp),
        margin: EdgeInsets.symmetric(horizontal: 20.sp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.sp),
            gradient: LinearGradient(colors: [
              secondaryColorDarkOutline,
              secondaryColorDarkOutline.withOpacity(0.15),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Container(
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(4.sp),
            ),
            child: Column(
              children: [
                Container(
                  height: 48.sp,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTab = 0;
                              });
                            },
                            child: SizedBox(
                              child: mainTab(82, "Day", 0, _selectedTab),
                            )),
                      ),
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTab = 1;
                              });
                            },
                            child: SizedBox(
                              child: mainTab(82, "Week", 1, _selectedTab),
                            )),
                      ),
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTab = 2;
                              });
                            },
                            child: SizedBox(
                              child: mainTab(82, "Month", 2, _selectedTab),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                Container(
                  height: 48.sp,
                  padding: EdgeInsets.symmetric(horizontal: 12.sp),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 24.sp,
                        height: 24.sp,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            vertical: 4.sp, horizontal: 6.sp),
                        child: Transform.rotate(
                          angle: 1.5,
                          child: Image.asset(
                            "assets/images/down_arrow.png",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 24.sp,
                      ),
                      const Spacer(),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "September",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: textPrimary),
                          ),
                          Text(
                            "2023",
                            style: TextStyle(fontSize: 14.sp, color: textGrey2),
                          )
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 24.sp,
                      ),
                      Container(
                        width: 24.sp,
                        height: 24.sp,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            vertical: 4.sp, horizontal: 6.sp),
                        child: Transform.rotate(
                          angle: -1.5,
                          child: Image.asset("assets/images/down_arrow.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                widget.child
              ],
            )));
  }
}
