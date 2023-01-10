// import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
// import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:zicops/views/screens/home/home_screen.dart';
import 'package:zicops/views/screens/my_course/my_course_screen.dart';
import 'package:zicops/views/screens/new_course/new_course_screen.dart';
import 'package:zicops/views/screens/profile/profile_screen.dart';
import 'package:zicops/views/screens/quiz/quiz_screen.dart';

import '../../../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  var _bottomNavIndex = 2;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  Widget getScreen() {
    switch (_bottomNavIndex) {
      case 0:
        return const ProfileScreen();
      case 1:
        return const QuizScreen();
      case 2:
        return const HomeScreen();

      case 3:
        return const MyCourseScreen();

      case 4:
        return const NewCourseScreen();

      default:
        {
          return const HomeScreen();
        }
    }
  }

  Widget getTitle() {
    switch (_bottomNavIndex) {
      case 0:
        return Text("Self",
            style: TextStyle(
                color: textPrimary,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                height: 1.33));
      case 1:
        return Text("Classroom",
            style: TextStyle(
                color: textPrimary,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                height: 1.33));
      case 2:
        return Image.asset(
          "assets/images/home_logo.png",
          height: 20.sp,
          width: 90.95.sp,
        );

      case 3:
        return Text(
          "My Course",
          style: TextStyle(
              color: textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              height: 1.33),
        );

      case 4:
        return Text("Calendar",
            style: TextStyle(
                color: textPrimary,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                height: 1.33));

      default:
        {
          return const HomeScreen();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: secondaryColorDark,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.sp),
        child: AppBar(
          backgroundColor: secondaryColor,
          elevation: 0,
          title: getTitle(),
          leading: GestureDetector(
              onTap: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              child: Padding(
                padding: EdgeInsets.only(
                    right: 4.sp, top: 16.sp, bottom: 16.sp, left: 20.sp),
                child: Image.asset(
                  "assets/images/menu.png",
                  height: 18.sp,
                  width: 12.sp,
                ),
              )),
          leadingWidth: 40.sp,
        ),
      ),
      drawer: Drawer(
        backgroundColor: secondaryColor,
        child: ListView(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/personal_bg.png",
                  fit: BoxFit.fill,
                  height: 165,
                  width: double.infinity,
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: const [
                //     CircleAvatar(
                //       foregroundImage:
                //           AssetImage("assets/images/personal_bg.png"),
                //       radius: 32,
                //     ),
                //     Text("Akash Chowdry"),
                //     ExpansionTile(
                //       backgroundColor: secondaryColorLight,
                //       title: Text("Accenture"),
                //       children: [Text("Saleforce"), Text("SalesForce")],
                //     ),
                //   ],
                // )
              ],
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/person.png",
                width: 16,
                height: 16,
              ),
              title: const Text(
                "Profile",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textPrimary),
              ),
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/flag.png",
                width: 16,
                height: 16,
              ),
              title: const Text(
                "Events",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textPrimary),
              ),
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/labs.png",
                width: 16,
                height: 16,
              ),
              title: const Text(
                "Labs",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textPrimary),
              ),
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/exams.png",
                width: 16,
                height: 16,
              ),
              title: const Text(
                "Exams",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textPrimary),
              ),
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/heart.png",
                width: 16,
                height: 16,
              ),
              title: const Text(
                "Favourites",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textPrimary),
              ),
            ),
            const Divider(),
            ListTile(
              leading: Image.asset(
                "assets/images/preference.png",
                width: 16,
                height: 16,
              ),
              title: const Text(
                "Preferences",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textPrimary),
              ),
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/settings.png",
                width: 16,
                height: 16,
              ),
              title: const Text(
                "Settings",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textPrimary),
              ),
            ),
            const Divider(),
            ListTile(
              leading: Image.asset(
                "assets/images/about.png",
                width: 16,
                height: 16,
              ),
              title: const Text(
                "About",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textPrimary),
              ),
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/help.png",
                width: 16,
                height: 16,
              ),
              title: const Text(
                "Help and Feedback",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textPrimary),
              ),
            ),
            ListTile(
              leading: Image.asset(
                "assets/images/logout.png",
                width: 16,
                height: 16,
              ),
              title: const Text(
                "Logout",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textPrimary),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
          onTap: () {
            setState(() {
              _bottomNavIndex = 2;
            });
          },
          child: Container(
            height: 56.sp,
            width: 56.sp,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: _bottomNavIndex == 2
                    ? RadialGradient(
                        colors: const [primaryColor, gradientTwo],
                        center: Alignment.topLeft,
                        radius: 2.5.sp)
                    : const LinearGradient(
                        colors: [secondaryColor, secondaryColor]),
                borderRadius: BorderRadius.circular(50.sp)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  _bottomNavIndex == 2
                      ? "assets/images/home_selected.png"
                      : "assets/images/home.png",
                  height: 17.5.sp,
                  width: 16.sp,
                ),
                Text(
                  "Home",
                  style: TextStyle(
                    color: _bottomNavIndex == 2 ? secondaryColor : textPrimary,
                    fontSize: 10.sp,
                  ),
                )
              ],
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.only(bottom: 8.sp, left: 8.sp, right: 8.sp),
        height: 56.sp,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bottom_nav.png"),
                fit: BoxFit.fill)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _bottomNavIndex = 0;
                        });
                      },
                      child: Container(
                          width: 56.sp,
                          height: 56.sp,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/self.png",
                                height: 20.9.sp,
                                width: 18.sp,
                              ),
                              Text(
                                "Self",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: textPrimary,
                                ),
                              ),
                            ],
                          ))),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _bottomNavIndex = 1;
                        });
                      },
                      child: Container(
                        width: 56.sp,
                        height: 56.sp,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/classroom.png",
                              height: 18.sp,
                              width: 18.sp,
                            ),
                            Text(
                              "Classroom",
                              style: TextStyle(
                                color: textPrimary,
                                fontSize: 10.sp,
                              ),
                            )
                          ],
                        ),
                      )),
                ],
              )),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _bottomNavIndex = 3;
                      });
                    },
                    child: Container(
                        width: 56.sp,
                        height: 56.sp,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/open_book.png",
                              height: 17.5.sp,
                              width: 16.sp,
                            ),
                            Text(
                              "My Course",
                              style: TextStyle(
                                color: textPrimary,
                                fontSize: 10.sp,
                              ),
                            )
                          ],
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _bottomNavIndex = 4;
                      });
                    },
                    child: Container(
                        width: 56.sp,
                        height: 56.sp,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/calendar.png",
                              height: 17.5.sp,
                              width: 16.sp,
                            ),
                            Text(
                              "Calendar",
                              style: TextStyle(
                                color: textPrimary,
                                fontSize: 10.sp,
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
      body: getScreen(),
    );
  }
}
