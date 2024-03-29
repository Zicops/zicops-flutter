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
  int _selectedTab = 0;

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
                onTap: () {
                  // Navigator.pushReplacement(
                  //     context,
                  //     PageRouteBuilder(
                  //         pageBuilder:
                  //             (context, animation, secondaryAnimation) =>
                  //                 const HomePage(),
                  //         transitionsBuilder:
                  //             (context, animation, secondaryAnimation, child) {
                  //           return SlideTransition(
                  //             position: animation.drive(Tween(
                  //               begin: const Offset(1, 0),
                  //               end: Offset.zero,
                  //             ).chain(CurveTween(curve: Curves.ease))),
                  //             child: child,
                  //           );
                  //         }));
                  //Navigator.pop(context);
                  if (Navigator.canPop(context)) {
                    int count = 2;
                    Navigator.of(context).popUntil((_) => count-- <= 0);
                    // Navigator.pop(context);
                  }
                },
                child: Navigator.canPop(context)
                    ? Padding(
                        padding: EdgeInsets.only(
                            right: 4.sp,
                            top: 16.sp,
                            bottom: 16.sp,
                            left: 20.sp),
                        child: Image.asset(
                          "assets/images/back_arrow.png",
                          height: 16.sp,
                          width: 16.sp,
                        ),
                      )
                    : Container()),
            leadingWidth: Navigator.canPop(context) ? 40.sp : 0,
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
        // floatingActionButton: _selectedTab == 0? GestureDetector(
        //     behavior: HitTestBehavior.translucent,
        //     onTap: () {
        //
        //     },
        //     child: Container(
        //       height: 56.sp,
        //       width: 56.sp,
        //       alignment: Alignment.center,
        //       decoration: BoxDecoration(
        //           gradient: RadialGradient(
        //               colors: const [primaryColor, gradientTwo],
        //               center: Alignment.topLeft,
        //               radius: 2.5.sp)
        //               ,
        //           borderRadius: BorderRadius.circular(50.sp)),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Image.asset(
        //                 "assets/images/save.png",
        //             height: 18.sp,
        //             width: 18.sp,
        //           ),
        //         ],
        //       ),
        //     )): const SizedBox.shrink(),
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
                            child: mainTab(120, "About", 0, _selectedTab),
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
                              child: mainTab(120, "Cohorts", 1, _selectedTab),
                            ))),
                    Expanded(
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTab = 2;
                              });
                            },
                            child: SizedBox(
                              child: mainTab(120, "Dashboard", 2, _selectedTab),
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
