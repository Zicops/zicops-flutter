import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../widgets/main_tab.dart';
import 'notification_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NotificationScreen();
  }
}

class _NotificationScreen extends State<NotificationScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryColorDark,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48.sp),
          child: AppBar(
            backgroundColor: secondaryColor,
            elevation: 0,
            leading: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (Navigator.canPop(context)) Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      right: 4.sp, top: 16.sp, bottom: 16.sp, left: 20.sp),
                  child: Image.asset(
                    "assets/images/back_arrow.png",
                    height: 16.sp,
                    width: 16.sp,
                  ),
                )),
            leadingWidth: 40.sp,
            title: SizedBox(
              height: 24.sp,
              child: Text("Notifications",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: textPrimary)),
            ),
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: secondaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTab = 0;
                            });
                          },
                          child: SizedBox(
                            child: mainTab(120, "All", 0, _selectedTab),
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
                              child: Container(
                                width: 120.sp,
                                height: 48.sp,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: 1 == _selectedTab
                                                ? textPrimary
                                                : secondaryColor,
                                            width: 1.5))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Unread',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: 1 == _selectedTab
                                              ? textPrimary
                                              : textGrey2,
                                          fontSize: 16.sp,
                                          height: 1.5,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 4.sp,
                                    ),
                                    Container(
                                      width: 14.sp,
                                      height: 14.sp,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: delete),
                                      child: Text('9', style: TextStyle(fontSize: 10.sp, color: secondaryColorDark),),
                                    )
                                  ],
                                ),
                              ),
                            ))),
                    Expanded(
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTab = 2;
                              });
                            },
                            child: SizedBox(
                              child: mainTab(120, "Read", 2, _selectedTab),
                            ))),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 32.sp,
                    ),
                    ...[1, 2, 3, 4, 5, 6].map((e) => NotificationItem(isUnread: _selectedTab != 2,))
                  ],
                ),
              )
            ]));
  }
}
