import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/blocs/profile/profile_bloc.dart';
import 'package:zicops/repositories/auth_repository.dart';
import 'package:zicops/repositories/profile_repository.dart';
import 'package:zicops/views/screens/home/home_screen.dart';
import 'package:zicops/views/screens/login_screen/login_screen.dart';
import 'package:zicops/views/screens/login_screen/lsp_selection.dart';
import 'package:zicops/views/screens/my_course/my_course_screen.dart';
import 'package:zicops/views/screens/notifications/notification_screen.dart';
import 'package:zicops/views/screens/preferences/preferences_screen.dart';
import 'package:zicops/views/screens/profile/profile_screen.dart';
import 'package:zicops/views/screens/quiz/quiz_screen.dart';
import 'package:zicops/views/screens/search/search_screen.dart';

import '../../../blocs/auth/auth_bloc.dart';
import '../../../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin {
  var _bottomNavIndex = 2;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool showNavDrawerOrg = false;
  late AnimationController controller;

  String name = '';
  String orgName = '';
  String url = '';

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
        return const MyCourseScreen();

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
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/home_logo.png",
              height: 20.sp,
              width: 90.95.sp,
            ),
            Row(
              children: [
                GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SearchScreen(selectedLanguage)));
                    },
                    child: Container(
                        width: 24.sp,
                        height: 24.sp,
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/search.png",
                          width: 18.sp,
                          height: 18.sp,
                          color: textPrimary,
                        ))),
                SizedBox(
                  width: 24.sp,
                ),
                GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const NotificationScreen()));
                    },
                    child: Container(
                      width: 24.sp,
                      height: 24.sp,
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/bell.png",
                        width: 16.sp,
                        height: 20.sp,
                      ),
                    )),
              ],
            )
          ],
        );

      case 3:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "My Course",
              style: TextStyle(
                  color: textPrimary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.33),
            ),
            Row(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SearchScreen(selectedLanguage)));
                  },
                  child: Container(
                      width: 24.sp,
                      height: 24.sp,
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/search.png",
                        width: 18.sp,
                        height: 18.sp,
                        color: textPrimary,
                      )),
                ),
                SizedBox(
                  width: 24.sp,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationScreen()));
                  },
                  child: Container(
                    width: 24.sp,
                    height: 24.sp,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/bell.png",
                      width: 16.sp,
                      height: 20.sp,
                    ),
                  ),
                )
              ],
            )
          ],
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
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
  }

  Widget navIcon(String icon, String selectedIcon, String label,
      double iconWidth, double iconHeight, int index, int selectedIndex) {
    return Container(
        width: 56.sp,
        height: 56.sp,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 24.sp,
                height: 24.sp,
                alignment: Alignment.center,
                child: Image.asset(
                  index == selectedIndex ? selectedIcon : icon,
                  height: iconHeight.sp,
                  width: iconWidth.sp,
                  fit: BoxFit.contain,
                )),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                    foreground: Paint()
                      ..shader = RadialGradient(
                        colors: index == 3 && index == selectedIndex
                            ? [primaryColor.withOpacity(0.88), gradientTwo]
                            : [textPrimary, textPrimary],
                        center: Alignment.topLeft,
                        radius: 55.sp,
                      ).createShader(
                          const Rect.fromLTWH(1.0, 1.0, 200.0, 24.0)),
                    fontSize: 10.sp,
                    height: 1.2),
              ),
            )
          ],
        ));
  }

  Widget drawerItem(
      String icon, String label, double iconWidth, double iconHeight) {
    return Container(
      height: 48.sp,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 24.sp,
              height: 24.sp,
              alignment: Alignment.center,
              child: Image.asset(
                icon,
                height: iconHeight.sp,
                width: iconWidth.sp,
                fit: BoxFit.contain,
                color: textPrimary,
              )),
          SizedBox(
            width: 31.sp,
          ),
          Text(
            label,
            style: TextStyle(
                color: textPrimary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                height: 1.43),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authRepository: AuthRepository()),
        ),
        BlocProvider(
          create: (context) =>
              ProfileBloc(ProfileRepository())..add(AboutDetailsRequested()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is Unauthenticated) {
                Navigator.pushAndRemoveUntil(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const LoginScreen(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position: animation.drive(Tween(
                              begin: const Offset(1, 0),
                              end: Offset.zero,
                            ).chain(CurveTween(curve: Curves.easeOutSine))),
                            child: child,
                          );
                        }),
                    (r) => false);
              }
            },
          ),
          BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state is AboutDetailsLoaded) {
                setState(() {
                  url = state.user.photoUrl!;
                  name = state.user.firstName! + " " + state.user.lastName!;
                  orgName = state.org.orgName;
                });
              }
            },
          ),
        ],
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: secondaryColorDark,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
                _bottomNavIndex == 2 || _bottomNavIndex == 3 ? 48.sp : 0),
            child: AppBar(
              backgroundColor: secondaryColor,
              elevation: 0,
              title: getTitle(),
              leading: GestureDetector(
                  behavior: HitTestBehavior.translucent,
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
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    return Stack(
                      children: [
                        Image.asset(
                          "assets/images/personal_bg.png",
                          fit: BoxFit.fill,
                          height: 155.sp,
                          width: double.infinity,
                        ),
                        Container(
                          padding: EdgeInsets.all(16.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                foregroundImage: NetworkImage(url),
                                radius: 32.sp,
                              ),
                              SizedBox(
                                height: 14.sp,
                              ),
                              GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    setState(() {
                                      showNavDrawerOrg = !showNavDrawerOrg;
                                      showNavDrawerOrg
                                          ? controller.forward()
                                          : controller.reverse();
                                    });
                                  },
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                        color: textPrimary,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5),
                                  )),
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  setState(() {
                                    showNavDrawerOrg = !showNavDrawerOrg;
                                    showNavDrawerOrg
                                        ? controller.forward()
                                        : controller.reverse();
                                  });
                                },
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 20.sp,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(orgName,
                                            style: TextStyle(
                                                color: textGrey2,
                                                fontSize: 14.sp,
                                                height: 1.43)),
                                        Container(
                                            width: 24.sp,
                                            height: 24.sp,
                                            alignment: Alignment.center,
                                            child: Transform.rotate(
                                                angle:
                                                    showNavDrawerOrg ? 22 : 0,
                                                child: Image.asset(
                                                  "assets/images/down_arrow_filled.png",
                                                  width: 10.sp,
                                                  height: 5.sp,
                                                  color: showNavDrawerOrg
                                                      ? primaryColor
                                                      : textPrimary,
                                                ))),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
                SizeTransition(
                  sizeFactor: CurvedAnimation(
                    curve: Curves.fastOutSlowIn,
                    parent: controller,
                  ),
                  child: Container(
                      color: secondaryColorLight,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.sp, vertical: 16.sp),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ...[1].map(
                            (e) => GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            const LspSelectionScreen(),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          return SlideTransition(
                                            position: animation.drive(Tween(
                                              begin: const Offset(1, 0),
                                              end: Offset.zero,
                                            ).chain(CurveTween(
                                                curve: Curves.ease))),
                                            child: child,
                                          );
                                        }));
                              },
                              child: Container(
                                  height: 48.sp,
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Change Lsp",
                                          style: TextStyle(
                                              color: textGrey2,
                                              fontSize: 14.sp,
                                              height: 1.43)),
                                      Container(
                                          width: 24.sp,
                                          height: 24.sp,
                                          alignment: Alignment.center,
                                          child: Transform.rotate(
                                              angle: -1.5,
                                              child: Image.asset(
                                                "assets/images/down_arrow.png",
                                                width: 12.sp,
                                                height: 8.sp,
                                                color: textGrey2,
                                              ))),
                                    ],
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          // Container(
                          //   height: 36.sp,
                          //   padding: EdgeInsets.symmetric(
                          //       vertical: 10.sp, horizontal: 20.sp),
                          //   alignment: Alignment.center,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(4.sp),
                          //       border: Border.all(
                          //           color: secondaryColorDarkOutline,
                          //           width: 1.sp)),
                          //   child: Text(
                          //     "Add Organization".toUpperCase(),
                          //     overflow: TextOverflow.ellipsis,
                          //     style: TextStyle(
                          //       fontSize: 14.sp,
                          //       fontWeight: FontWeight.w600,
                          //       letterSpacing: 2,
                          //       height: 1.14,
                          //       foreground: Paint()
                          //         ..shader = RadialGradient(
                          //           colors: [
                          //             primaryColor.withOpacity(0.88),
                          //             gradientTwo
                          //           ],
                          //           center: Alignment.topLeft,
                          //           radius: 55.sp,
                          //         ).createShader(const Rect.fromLTWH(
                          //             1.0, 1.0, 200.0, 24.0)),
                          //     ),
                          //   ),
                          // )
                        ],
                      )),
                ),
                GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const ProfileScreen(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return SlideTransition(
                                  position: animation.drive(Tween(
                                    begin: const Offset(1, 0),
                                    end: Offset.zero,
                                  ).chain(CurveTween(curve: Curves.ease))),
                                  child: child,
                                );
                              }));
                      // Navigator.push(
                      //     this.context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const ProfileScreen()));
                    },
                    child: drawerItem(
                      "assets/images/person.png",
                      "Profile",
                      16,
                      16,
                    )),
                GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.push(
                          this.context,
                          MaterialPageRoute(
                              builder: (context) => const QuizScreen()));
                    },
                    child:
                        drawerItem("assets/images/exams.png", "Exams", 18, 22)),
                GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.push(
                          this.context,
                          MaterialPageRoute(
                              builder: (context) => const PreferencesScreen()));
                    },
                    child: drawerItem(
                        "assets/images/preference.png", "Preferences", 18, 18)),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        // Navigator.pushAndRemoveUntil(
                        //     this.context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const LoginScreen()),
                        //         (r) => false);
                        _logout(context);
                      },
                      child: drawerItem(
                          "assets/images/logout.png", "Logout", 18, 18),
                    );
                  },
                )
              ],
            ),
          ),
          floatingActionButton: GestureDetector(
              behavior: HitTestBehavior.translucent,
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
                        color:
                            _bottomNavIndex == 2 ? secondaryColor : textPrimary,
                        fontSize: 10.sp,
                      ),
                    )
                  ],
                ),
              )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              _bottomNavIndex = 0;
                            });
                          },
                          child: navIcon(
                              "assets/images/self.png",
                              "assets/images/self.png",
                              "Self",
                              18,
                              21,
                              0,
                              _bottomNavIndex)),
                      SizedBox(
                        width: 4.sp,
                      ),
                      GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              _bottomNavIndex = 1;
                            });
                          },
                          child: navIcon(
                              "assets/images/classroom.png",
                              "assets/images/classroom.png",
                              "Classroom",
                              18,
                              18,
                              1,
                              _bottomNavIndex)),
                    ],
                  )),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            _bottomNavIndex = 3;
                          });
                        },
                        child: navIcon(
                            "assets/images/open_book.png",
                            "assets/images/open_book_selected.png",
                            "My Course",
                            22,
                            16,
                            3,
                            _bottomNavIndex),
                      ),
                      SizedBox(
                        width: 4.sp,
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            _bottomNavIndex = 4;
                          });
                        },
                        child: navIcon(
                            "assets/images/flag.png",
                            "assets/images/flag.png",
                            "Event",
                            15,
                            17,
                            4,
                            _bottomNavIndex),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
          body: getScreen(),
        ),
      ),
    );
  }

  // Future<void> tokenCheck() async {
  //   final _prefs = await SharedPreferences.getInstance();
  //   final token = _prefs.getString('token');
  //   bool hasExpired = JwtDecoder.isExpired(token!);
  //   final _firebaseAuth = FirebaseAuth.instance;
  //   if (hasExpired) {
  //     String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
  //     await _prefs.setString('token', token!);
  //   }
  // }

  void _logout(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(SignOutRequested());
  }
}
