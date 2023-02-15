import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/utils/colors.dart';
import 'package:zicops/views/screens/profile/about_tab.dart';
import 'package:zicops/views/screens/profile/cohort_tab.dart';
import 'package:zicops/views/screens/profile/dashboard_tab.dart';

import '../../widgets/main_tab.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreen();
  }
}

class _ProfileScreen extends State<ProfileScreen> {
  int _selectedTab = 2;

  getScreen() {
    switch (_selectedTab) {
      case 0:
        return AboutTabScreen();
      case 1:
        return const CohortTabScreen();
      case 2:
        return const DashboardTabScreen();
      default:
        return AboutTabScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    // _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48.sp),
          child: AppBar(
            backgroundColor: secondaryColor,
            elevation: 0,
            leading: GestureDetector(
                behavior: HitTestBehavior.translucent,

                onTap: (){
              if(Navigator.canPop(context))Navigator.pop(context);
            },child: Padding(
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
              child: Text("Profile",
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
                            child: mainTab(120,"About", 0, _selectedTab),
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
                              child: mainTab(120,"Cohorts", 1, _selectedTab),
                            ))),
                    Expanded(
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTab = 2;
                              });
                            },
                            child: SizedBox(
                              child: mainTab(120,"Dashboard", 2, _selectedTab),
                            ))),
                  ],
                ),
              ),
              Expanded(
                child: getScreen(),
              )
            ]));
  }
}

