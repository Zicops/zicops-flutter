import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zicops/blocs/home/home_bloc.dart';
import 'package:zicops/repositories/home_repository.dart';
import 'package:zicops/utils/colors.dart';
import 'package:zicops/views/screens/new_course/new_course_screen.dart';
import 'package:zicops/views/screens/search/search_screen.dart';
import 'package:zicops/views/widgets/course_grid_item.dart';

import '../../../models/user/user_course_model.dart';
import '../../../utils/time_format.dart';
import '../../widgets/course_list_item_with_progress.dart';

String selectedLanguage = "English";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  int currentCarousel = 0;
  List<String> banner = [
    'assets/images/homePageBanner/Frame_1.png',
    'assets/images/homePageBanner/Frame_2.png',
    'assets/images/homePageBanner/Frame_3.png',
    'assets/images/homePageBanner/Frame_4.png',
    'assets/images/homePageBanner/Frame_5.png'
  ];
  List homepageBannerList = [
    {'path': 'assets/images/homePageBanner/Frame_1.png'},
    {'path': 'assets/images/homePageBanner/Frame_2.png'},
    {'path': 'assets/images/homePageBanner/Frame_3.png'},
    {'path': 'assets/images/homePageBanner/Frame_4.png'},
    {'path': 'assets/images/homePageBanner/Frame_5.png'}
  ];
  List<Course> ongoingCourse = [];
  List<Course> learningFolderCourse = [];
  List<Course> latestCourse = [];
  List<Course> learningSpaceCourse = [];
  List<Course> quickCourse = [];
  List<Course> slowCourse = [];

  CarouselController carouselController = CarouselController();
  Widget sectionHeader(String label, Function() action,
      {bool showSeeAll = true}) {
    return Container(
        height: 24.sp,
        padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                  color: textPrimary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.33),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: action,
              child: Text("See all".toUpperCase(),
                  style: TextStyle(
                      foreground: Paint()
                        ..shader = RadialGradient(
                          colors: showSeeAll
                              ? [primaryColor, gradientTwo]
                              : [Colors.transparent, Colors.transparent],
                          center: Alignment.center,
                          radius: 35.sp,
                        ).createShader(
                            const Rect.fromLTWH(0.0, 0.0, 50.0, 24.0),
                            textDirection: TextDirection.ltr),
                      fontSize: 12.sp,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600)),
            )
          ],
        ));
  }

  Widget category(
      String icon, String label, double iconWidth, double iconHeight) {
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
            width: 74.sp,
            height: 74.sp,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.sp),
              color: secondaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    )),
                Text(
                  label,
                  style: TextStyle(
                      color: textPrimary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.43),
                )
              ],
            )));
  }

  Widget language(String background, String label) {
    return Container(
        width: 104.sp,
        height: 100.sp,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 2.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.sp),
            image: DecorationImage(
                image: AssetImage(background), fit: BoxFit.fill)),
        child: Text(
          label,
          style: TextStyle(
              color: textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              height: 1.33),
        ));
  }

  Widget viewAll(Future Function() onTapFunc,
      {int height = 156, int width = 156}) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
          onTap: onTapFunc,
          child: Container(
              padding:
                  EdgeInsets.symmetric(vertical: 0.5.sp, horizontal: 0.5.sp),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.sp),
                  gradient: LinearGradient(colors: [
                    secondaryColorDarkOutline,
                    secondaryColorDarkOutline.withOpacity(0.15),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Container(
                  width: width.sp,
                  height: height.sp,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(4.sp),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.rotate(
                          angle: 3.14,
                          child: Container(
                              width: 24.sp,
                              height: 24.sp,
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/back_arrow.png",
                                width: 16.sp,
                                height: 16.sp,
                                color: textPrimary,
                              ))),
                      SizedBox(
                        height: 4.sp,
                      ),
                      Text(
                        "View all",
                        style: TextStyle(
                            color: textPrimary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )))),
      SizedBox(
        width: 8.sp,
      )
    ]);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      padding: EdgeInsets.only(bottom: 5.sp),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 14.sp,
            ),
            SizedBox(
                width: width,
                height: 180.sp,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                        viewportFraction: 0.93,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 4),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 2000),
                        autoPlayCurve: Curves.easeIn,
                        enlargeCenterPage: false,
                        enlargeFactor: 0.3,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentCarousel = index;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                      items: banner
                          .map((i) => Center(
                              child: AnimatedContainer(
                                  curve: Curves.easeInCubic,
                                  width: 320.sp,
                                  height:
                                      currentCarousel == i ? 180.sp : 164.sp,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(4.sp)),
                                  clipBehavior: Clip.antiAlias,
                                  duration: const Duration(milliseconds: 800),
                                  child: Image.asset(
                                    i,
                                    // "assets/images/course_preview.png",
                                    //   fit: BoxFit.fill,
                                    fit: BoxFit.cover,

                                    alignment:
                                        FractionalOffset.fromOffsetAndRect(
                                            Offset(0, 0),
                                            Rect.fromLTRB(-60, 180, 320.sp, 0)),

                                    // for image crop
                                  ))))
                          .toList(),
                    ),
                    Positioned(
                        bottom: 12.sp,
                        left: 144.sp,
                        child: AnimatedSmoothIndicator(
                          count: [0, 1, 2, 3, 4].length,
                          effect: ExpandingDotsEffect(
                              dotHeight: 8.sp,
                              dotWidth: 8.sp,
                              spacing: 8.sp,
                              activeDotColor: const Color(0xFF22AAA1),
                              dotColor: const Color(0x29FFFFFF)
                              // strokeWidth: 5,
                              ),
                          activeIndex: currentCarousel,
                        )),
                  ],
                )),
            SizedBox(
              height: 14.25.sp,
            ),
            // For ongoing courses
            BlocProvider(
              create: (context) => HomeBloc(homeRepository: HomeRepository())
                ..add(OngoingCourseRequested()),
              child: BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {
                  if (state is OngoingCourseLoaded) {
                    setState(() {
                      ongoingCourse = state.ongoingCourses;
                    });
                  }
                  if (state is OngoingCourseError) {
                    print("error: ${state.error}");
                  }
                },
                builder: (context, state) {
                  if (state is OngoingCourseLoading) {
                    return SizedBox(
                      height: 156.sp,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is OngoingCourseLoaded) {
                    return ongoingCourse.isNotEmpty
                        ? Column(
                            children: [
                              ongoingCourse.length > 10
                                  ? sectionHeader("Ongoing Courses", () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                              pageBuilder: (context, animation,
                                                      secondaryAnimation) =>
                                                  NewCourseScreen(
                                                    courseList:
                                                        ongoingCourse.toList(),
                                                    title: 'Ongoing Courses',
                                                  ),
                                              transitionsBuilder: (context,
                                                  animation,
                                                  secondaryAnimation,
                                                  child) {
                                                return SlideTransition(
                                                  position: animation.drive(
                                                      Tween(
                                                              begin:
                                                                  const Offset(
                                                                      1, 0),
                                                              end: Offset.zero)
                                                          .chain(CurveTween(
                                                              curve: Curves
                                                                  .ease))),
                                                  child: child,
                                                );
                                              }));
                                    })
                                  : sectionHeader("Ongoing Courses", () {},
                                      showSeeAll: false),
                              SizedBox(
                                height: 8.sp,
                              ),
                              Container(
                                height: 156.sp,
                                alignment: Alignment.centerLeft,
                                child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      GridView(
                                        scrollDirection: Axis.horizontal,
                                        physics:
                                            const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                                        shrinkWrap: true,
                                        padding: EdgeInsets.only(left: 20.sp),
                                        gridDelegate:
                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                                childAspectRatio: 0.23,
                                                crossAxisSpacing: 8.sp,
                                                mainAxisSpacing: 8.sp,
                                                maxCrossAxisExtent: 74.sp),
                                        children: [
                                          ...ongoingCourse
                                              .toList()
                                              .take(10)
                                              .map((courseItem) =>
                                                  CourseListItem(
                                                    courseItem.name ?? '',
                                                    courseItem.owner ?? '',
                                                    formatDuration(
                                                        courseItem.duration ??
                                                            0),
                                                    courseItem.tileImage ?? '',
                                                    courseItem.courseId ?? '',
                                                    courseItem.expertiseLevel ??
                                                        '',
                                                    courseItem
                                                            .completedPercentage ??
                                                        0,
                                                  )),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 8.sp,
                                      ),
                                      ongoingCourse.length > 10
                                          ? viewAll(
                                              () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          NewCourseScreen(
                                                            courseList:
                                                                ongoingCourse
                                                                    .toList(),
                                                            title:
                                                                'Ongoing Courses',
                                                          ))),
                                            )
                                          : Container(),
                                    ]),
                              ),
                            ],
                          )
                        : Container();
                  }
                  return Container();
                },
              ),
            ),
            SizedBox(
              height: 14.25.sp,
            ),
            // For learning folder courses
            BlocProvider(
              create: (context) => HomeBloc(homeRepository: HomeRepository())
                ..add(LearningFolderCourseRequested()),
              child: BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {
                  if (state is LearningFolderCourseLoaded) {
                    setState(() {
                      learningFolderCourse = state.learningFolderCourses;
                    });
                  }
                },
                builder: (context, state) {
                  if (state is LearningFolderCourseLoading) {
                    return SizedBox(
                      height: 156.sp,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is LearningFolderCourseLoaded) {
                    return learningFolderCourse.isNotEmpty
                        ? Column(
                            children: [
                              learningFolderCourse.length > 10
                                  ? sectionHeader("Learning Folder Courses",
                                      () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                              pageBuilder: (context, animation,
                                                      secondaryAnimation) =>
                                                  NewCourseScreen(
                                                    courseList:
                                                        learningFolderCourse
                                                            .toList(),
                                                    title:
                                                        'Learning Folder Courses',
                                                  ),
                                              transitionsBuilder: (context,
                                                  animation,
                                                  secondaryAnimation,
                                                  child) {
                                                return SlideTransition(
                                                  position: animation.drive(
                                                      Tween(
                                                              begin:
                                                                  const Offset(
                                                                      1, 0),
                                                              end: Offset.zero)
                                                          .chain(CurveTween(
                                                              curve: Curves
                                                                  .ease))),
                                                  child: child,
                                                );
                                              }));
                                    })
                                  : sectionHeader(
                                      "Learning Folder Courses", () {},
                                      showSeeAll: false),
                              SizedBox(
                                height: 8.sp,
                              ),
                              Container(
                                height: 156.sp,
                                alignment: Alignment.centerLeft,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    SizedBox(
                                      width: 20.sp,
                                    ),
                                    ...learningFolderCourse
                                        .take(10)
                                        .map((courseItem) => Row(
                                              children: [
                                                CourseGridItem(
                                                  courseItem.name ?? '',
                                                  courseItem.owner ?? '',
                                                  courseItem.expertiseLevel ??
                                                      '',
                                                  formatDuration(
                                                      courseItem.duration ?? 0),
                                                  courseItem.tileImage ?? '',
                                                  courseItem.courseId ?? '',
                                                  //showPlusIcon: false,
                                                  isAssigned: true,
                                                ),
                                                SizedBox(
                                                  width: 8.sp,
                                                )
                                              ],
                                            )),
                                    learningFolderCourse.length > 10
                                        ? viewAll(
                                            () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NewCourseScreen(
                                                          courseList:
                                                              learningFolderCourse
                                                                  .toList(),
                                                          title:
                                                              'Learning Folder Courses',
                                                        ))),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Container();
                  }
                  return Container();
                },
              ),
            ),
            SizedBox(
              height: 14.25.sp,
            ),
            // For latest courses
            BlocProvider(
              create: (context) => HomeBloc(homeRepository: HomeRepository())
                ..add(LatestCourseRequested()),
              child: BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {
                  if (state is LatestCourseLoaded) {
                    setState(() {
                      latestCourse = state.latestCourses;
                    });
                  }
                },
                builder: (context, state) {
                  if (state is LatestCourseLoading) {
                    return SizedBox(
                      height: 156.sp,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is LatestCourseLoaded) {
                    return latestCourse.isNotEmpty
                        ? Column(
                            children: [
                              latestCourse.length > 10
                                  ? sectionHeader("Latest Courses", () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                              pageBuilder: (context, animation,
                                                      secondaryAnimation) =>
                                                  NewCourseScreen(
                                                    courseList:
                                                        latestCourse.toList(),
                                                    title: 'Latest Courses',
                                                  ),
                                              transitionsBuilder: (context,
                                                  animation,
                                                  secondaryAnimation,
                                                  child) {
                                                return SlideTransition(
                                                  position: animation.drive(
                                                      Tween(
                                                              begin:
                                                                  const Offset(
                                                                      1, 0),
                                                              end: Offset.zero)
                                                          .chain(CurveTween(
                                                              curve: Curves
                                                                  .ease))),
                                                  child: child,
                                                );
                                              }));
                                    })
                                  : sectionHeader("Latest Courses", () {},
                                      showSeeAll: false),
                              SizedBox(
                                height: 8.sp,
                              ),
                              Container(
                                height: 156.sp,
                                alignment: Alignment.centerLeft,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    SizedBox(
                                      width: 20.sp,
                                    ),
                                    ...state.latestCourses
                                        .take(10)
                                        .map((courseItem) => Row(
                                              children: [
                                                CourseGridItem(
                                                  courseItem.name ?? '',
                                                  courseItem.owner ?? '',
                                                  courseItem.expertiseLevel ??
                                                      '',
                                                  formatDuration(
                                                      courseItem.duration ?? 0),
                                                  courseItem.tileImage ?? '',
                                                  courseItem.id ?? '',
                                                  showPlusIcon: true,
                                                ),
                                                SizedBox(
                                                  width: 8.sp,
                                                )
                                              ],
                                            )),
                                    latestCourse.length > 10
                                        ? viewAll(
                                            () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NewCourseScreen(
                                                          courseList:
                                                              latestCourse
                                                                  .toList(),
                                                          title:
                                                              'Latest Courses',
                                                        ))),
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Container();
                  }
                  return Container();
                },
              ),
            ),
            SizedBox(
              height: 14.25.sp,
            ),
            // For learning space courses
            BlocProvider(
              create: (context) => HomeBloc(homeRepository: HomeRepository())
                ..add(LearningSpaceCourseRequested()),
              child: BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {
                  if (state is LearningSpaceCourseLoaded) {
                    setState(() {
                      learningSpaceCourse = state.learningSpaceCourses;
                    });
                  }
                },
                builder: (context, state) {
                  if (state is LearningSpaceCourseLoading) {
                    return SizedBox(
                      height: 156.sp,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is LearningSpaceCourseLoaded) {
                    return learningSpaceCourse.isNotEmpty
                        ? Column(
                            children: [
                              learningSpaceCourse.length > 10
                                  ? sectionHeader("Learning Space Courses", () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                              pageBuilder: (context, animation,
                                                      secondaryAnimation) =>
                                                  NewCourseScreen(
                                                    courseList:
                                                        learningSpaceCourse
                                                            .toList(),
                                                    title: 'Learning Space ',
                                                  ),
                                              transitionsBuilder: (context,
                                                  animation,
                                                  secondaryAnimation,
                                                  child) {
                                                return SlideTransition(
                                                  position: animation.drive(
                                                      Tween(
                                                              begin:
                                                                  const Offset(
                                                                      1, 0),
                                                              end: Offset.zero)
                                                          .chain(CurveTween(
                                                              curve: Curves
                                                                  .ease))),
                                                  child: child,
                                                );
                                              }));
                                    })
                                  : sectionHeader(
                                      "Learning Space Courses", () {},
                                      showSeeAll: false),
                              SizedBox(
                                height: 8.sp,
                              ),
                              Container(
                                height: 156.sp,
                                alignment: Alignment.centerLeft,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    SizedBox(
                                      width: 20.sp,
                                    ),
                                    ...learningSpaceCourse
                                        .take(10)
                                        .map((courseItem) => Row(
                                              children: [
                                                CourseGridItem(
                                                  courseItem.name ?? '',
                                                  courseItem.owner ?? '',
                                                  courseItem.expertiseLevel ??
                                                      '',
                                                  formatDuration(
                                                      courseItem.duration ?? 0),
                                                  courseItem.tileImage ?? '',
                                                  courseItem.id ?? '',
                                                  showPlusIcon: false,
                                                ),
                                                SizedBox(
                                                  width: 8.sp,
                                                )
                                              ],
                                            )),
                                    learningSpaceCourse.length > 10
                                        ? viewAll(
                                            () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NewCourseScreen(
                                                          courseList: state
                                                              .learningSpaceCourses
                                                              .toList(),
                                                          title:
                                                              'Learning space ',
                                                        ))),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Container();
                  }
                  return Container();
                },
              ),
            ),
            SizedBox(
              height: 14.25.sp,
            ),
            sectionHeader("Multilingual courses", () {}, showSeeAll: false),
            SizedBox(
              height: 10.sp,
            ),
            Container(
              height: 100.sp,
              alignment: Alignment.centerLeft,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 20.sp,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedLanguage = "English";
                            });
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        SearchScreen(
                                          selectedLanguage,
                                        ),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      return SlideTransition(
                                        position: animation.drive(Tween(
                                                begin: const Offset(1, 0),
                                                end: Offset.zero)
                                            .chain(CurveTween(
                                                curve: Curves.ease))),
                                        child: child,
                                      );
                                    }));
                          },
                          child: language(
                              "assets/images/english_bg.png", "English")),
                      SizedBox(
                        width: 10.sp,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedLanguage = "Hindi";
                            });
                          },
                          child:
                              language("assets/images/hindi_bg.png", "Hindi")),
                      SizedBox(
                        width: 10.sp,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedLanguage = "Arabic";
                            });
                          },
                          child: language(
                              "assets/images/arabic_bg.png", "Arabic")),
                      SizedBox(
                        width: 10.sp,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14.25.sp,
            ),
            BlocProvider(
              create: (context) => HomeBloc(homeRepository: HomeRepository())
                ..add(SubCategoryCourseRequested()),
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is SubCategoryCourseLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  // if (state is SubCategoryCourseError) {
                  //   return Text(state.error.toString());
                  // }
                  if (state is SubCategoryCourseLoaded) {
                    return Column(
                      children: [
                        state.subCategoryCourses1.isNotEmpty
                            ? Column(
                                children: [
                                  sectionHeader(state.userPref[0], () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NewCourseScreen(
                                                  courseList:
                                                      state.subCategoryCourses1,
                                                  title: state.userPref[0],
                                                )));
                                  }),
                                  SizedBox(
                                    height: 8.sp,
                                  ),
                                  Container(
                                    height: 156.sp,
                                    alignment: Alignment.centerLeft,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        SizedBox(
                                          width: 20.sp,
                                        ),
                                        ...state.subCategoryCourses1
                                            .map((courseItem) => Row(
                                                  children: [
                                                    CourseGridItem(
                                                      courseItem.name ?? '',
                                                      courseItem.owner ?? '',
                                                      courseItem
                                                              .expertiseLevel ??
                                                          '',
                                                      formatDuration(
                                                          courseItem.duration ??
                                                              0),
                                                      courseItem.tileImage ??
                                                          '',
                                                      courseItem.courseId ?? '',
                                                    ),
                                                    SizedBox(
                                                      width: 8.sp,
                                                    )
                                                  ],
                                                )),
                                        viewAll(
                                          () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NewCourseScreen(
                                                        courseList: state
                                                            .subCategoryCourses1
                                                            .toList(),
                                                        title:
                                                            state.userPref[0],
                                                      ))),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14.25.sp,
                                  ),
                                ],
                              )
                            : Container(),
                        state.subCategoryCourses2.isNotEmpty
                            ? Column(
                                children: [
                                  sectionHeader(state.userPref[1], () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NewCourseScreen(
                                                  courseList:
                                                      state.subCategoryCourses2,
                                                  title: state.userPref[1],
                                                )));
                                  }),
                                  SizedBox(
                                    height: 8.sp,
                                  ),
                                  Container(
                                    height: 156.sp,
                                    alignment: Alignment.centerLeft,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        SizedBox(
                                          width: 20.sp,
                                        ),
                                        ...state.subCategoryCourses2
                                            .map((courseItem) => Row(
                                                  children: [
                                                    CourseGridItem(
                                                      courseItem.name ?? '',
                                                      courseItem.owner ?? '',
                                                      courseItem
                                                              .expertiseLevel ??
                                                          '',
                                                      formatDuration(
                                                          courseItem.duration ??
                                                              0),
                                                      courseItem.tileImage ??
                                                          '',
                                                      courseItem.courseId ?? '',
                                                    ),
                                                    SizedBox(
                                                      width: 8.sp,
                                                    )
                                                  ],
                                                )),
                                        viewAll(
                                          () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NewCourseScreen(
                                                        courseList: state
                                                            .subCategoryCourses2
                                                            .toList(),
                                                        title:
                                                            state.userPref[1],
                                                      ))),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14.25.sp,
                                  ),
                                ],
                              )
                            : Container(),
                        state.subCategoryCourses3.isNotEmpty
                            ? Column(
                                children: [
                                  sectionHeader(state.userPref[2], () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NewCourseScreen(
                                                  courseList:
                                                      state.subCategoryCourses3,
                                                  title: state.userPref[2],
                                                )));
                                  }),
                                  SizedBox(
                                    height: 8.sp,
                                  ),
                                  Container(
                                    height: 156.sp,
                                    alignment: Alignment.centerLeft,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        SizedBox(
                                          width: 20.sp,
                                        ),
                                        ...state.subCategoryCourses3
                                            .map((courseItem) => Row(
                                                  children: [
                                                    CourseGridItem(
                                                      courseItem.name ?? '',
                                                      courseItem.owner ?? '',
                                                      courseItem
                                                              .expertiseLevel ??
                                                          '',
                                                      formatDuration(
                                                          courseItem.duration ??
                                                              0),
                                                      courseItem.tileImage ??
                                                          '',
                                                      courseItem.courseId ?? '',
                                                    ),
                                                    SizedBox(
                                                      width: 8.sp,
                                                    )
                                                  ],
                                                )),
                                        viewAll(
                                          () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NewCourseScreen(
                                                        courseList: state
                                                            .subCategoryCourses3
                                                            .toList(),
                                                        title:
                                                            state.userPref[2],
                                                      ))),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14.25.sp,
                                  ),
                                ],
                              )
                            : Container(),
                        state.subCategoryCourses4.isNotEmpty
                            ? Column(
                                children: [
                                  sectionHeader(state.userPref[3], () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NewCourseScreen(
                                                  courseList:
                                                      state.subCategoryCourses4,
                                                  title: state.userPref[3],
                                                )));
                                  }),
                                  SizedBox(
                                    height: 8.sp,
                                  ),
                                  Container(
                                    height: 156.sp,
                                    alignment: Alignment.centerLeft,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        SizedBox(
                                          width: 20.sp,
                                        ),
                                        ...state.subCategoryCourses4
                                            .map((courseItem) => Row(
                                                  children: [
                                                    CourseGridItem(
                                                      courseItem.name ?? '',
                                                      courseItem.owner ?? '',
                                                      courseItem
                                                              .expertiseLevel ??
                                                          '',
                                                      formatDuration(
                                                          courseItem.duration ??
                                                              0),
                                                      courseItem.tileImage ??
                                                          '',
                                                      courseItem.courseId ?? '',
                                                    ),
                                                    SizedBox(
                                                      width: 8.sp,
                                                    )
                                                  ],
                                                )),
                                        viewAll(() => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NewCourseScreen(
                                                        courseList: state
                                                            .subCategoryCourses4
                                                            .toList(),
                                                        title:
                                                            state.userPref[3],
                                                      )),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14.25.sp,
                                  ),
                                ],
                              )
                            : Container(),
                        state.subCategoryCourses5.isNotEmpty
                            ? Column(
                                children: [
                                  sectionHeader(state.userPref[4], () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NewCourseScreen(
                                                  courseList:
                                                      state.subCategoryCourses5,
                                                  title: state.userPref[4],
                                                )));
                                  }),
                                  SizedBox(
                                    height: 8.sp,
                                  ),
                                  Container(
                                    height: 156.sp,
                                    alignment: Alignment.centerLeft,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        SizedBox(
                                          width: 20.sp,
                                        ),
                                        ...state.subCategoryCourses5
                                            .map((courseItem) => Row(
                                                  children: [
                                                    CourseGridItem(
                                                      courseItem.name ?? '',
                                                      courseItem.owner ?? '',
                                                      courseItem
                                                              .expertiseLevel ??
                                                          '',
                                                      formatDuration(
                                                          courseItem.duration ??
                                                              0),
                                                      courseItem.tileImage ??
                                                          '',
                                                      courseItem.courseId ?? '',
                                                    ),
                                                    SizedBox(
                                                      width: 8.sp,
                                                    )
                                                  ],
                                                )),
                                        viewAll(() => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchScreen(
                                                        selectedLanguage)))),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14.25.sp,
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
            // Quick Courses
            BlocProvider(
              create: (context) => HomeBloc(homeRepository: HomeRepository())
                ..add(QuickCourseRequested()),
              child: BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {
                  if (state is QuickCourseLoaded) {
                    setState(() {
                      quickCourse = state.quickCourses;
                    });
                  }
                },
                builder: (context, state) {
                  if (state is QuickCourseLoading) {
                    return SizedBox(
                      height: 156.sp,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is QuickCourseLoaded) {
                    return quickCourse.isNotEmpty
                        ? Column(
                            children: [
                              quickCourse.length > 10
                                  ? sectionHeader("Quick Courses", () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                              pageBuilder: (context, animation,
                                                      secondaryAnimation) =>
                                                  NewCourseScreen(
                                                    courseList:
                                                        quickCourse.toList(),
                                                    title: 'Quick Courses',
                                                  ),
                                              transitionsBuilder: (context,
                                                  animation,
                                                  secondaryAnimation,
                                                  child) {
                                                return SlideTransition(
                                                  position: animation.drive(
                                                      Tween(
                                                              begin:
                                                                  const Offset(
                                                                      1, 0),
                                                              end: Offset.zero)
                                                          .chain(CurveTween(
                                                              curve: Curves
                                                                  .ease))),
                                                  child: child,
                                                );
                                              }));
                                    })
                                  : sectionHeader("Quick Courses", () {},
                                      showSeeAll: false),
                              SizedBox(
                                height: 8.sp,
                              ),
                              Container(
                                height: 156.sp,
                                alignment: Alignment.centerLeft,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    SizedBox(
                                      width: 20.sp,
                                    ),
                                    ...quickCourse
                                        .take(10)
                                        .map((courseItem) => Row(
                                              children: [
                                                CourseGridItem(
                                                  courseItem.name ?? '',
                                                  courseItem.owner ?? '',
                                                  courseItem.expertiseLevel ??
                                                      '',
                                                  formatDuration(
                                                      courseItem.duration ?? 0),
                                                  courseItem.tileImage ?? '',
                                                  courseItem.id ?? '',
                                                  showPlusIcon: false,
                                                  isAssigned: true,
                                                ),
                                                SizedBox(
                                                  width: 8.sp,
                                                )
                                              ],
                                            )),
                                    quickCourse.length > 10
                                        ? viewAll(
                                            () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NewCourseScreen(
                                                          courseList:
                                                              quickCourse
                                                                  .toList(),
                                                          title:
                                                              'Quick Courses',
                                                        ))),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Container();
                  }
                  return Container();
                },
              ),
            ),
            SizedBox(
              height: 14.25.sp,
            ),
            // Slow Courses
            BlocProvider(
              create: (context) => HomeBloc(homeRepository: HomeRepository())
                ..add(SlowCourseRequested()),
              child: BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {
                  if (state is SlowCourseLoaded) {
                    setState(() {
                      slowCourse = state.slowCourses;
                    });
                  }
                },
                builder: (context, state) {
                  if (state is SlowCourseLoading) {
                    return SizedBox(
                      height: 156.sp,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is SlowCourseLoaded) {
                    return slowCourse.isNotEmpty
                        ? Column(
                            children: [
                              slowCourse.length > 10
                                  ? sectionHeader("Slow Courses", () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                              pageBuilder: (context, animation,
                                                      secondaryAnimation) =>
                                                  NewCourseScreen(
                                                    courseList:
                                                        slowCourse.toList(),
                                                    title: 'Slow Courses',
                                                  ),
                                              transitionsBuilder: (context,
                                                  animation,
                                                  secondaryAnimation,
                                                  child) {
                                                return SlideTransition(
                                                  position: animation.drive(
                                                      Tween(
                                                              begin:
                                                                  const Offset(
                                                                      1, 0),
                                                              end: Offset.zero)
                                                          .chain(CurveTween(
                                                              curve: Curves
                                                                  .ease))),
                                                  child: child,
                                                );
                                              }));
                                    })
                                  : sectionHeader("Slow Courses", () {},
                                      showSeeAll: false),
                              SizedBox(
                                height: 8.sp,
                              ),
                              Container(
                                height: 156.sp,
                                alignment: Alignment.centerLeft,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    SizedBox(
                                      width: 20.sp,
                                    ),
                                    ...slowCourse
                                        .take(10)
                                        .map((courseItem) => Row(
                                              children: [
                                                CourseGridItem(
                                                  courseItem.name ?? '',
                                                  courseItem.owner ?? '',
                                                  courseItem.expertiseLevel ??
                                                      '',
                                                  formatDuration(
                                                      courseItem.duration ?? 0),
                                                  courseItem.tileImage ?? '',
                                                  courseItem.courseId ?? '',
                                                  showPlusIcon: false,
                                                  isAssigned: true,
                                                ),
                                                SizedBox(
                                                  width: 8.sp,
                                                )
                                              ],
                                            )),
                                    slowCourse.length > 10
                                        ? viewAll(
                                            () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NewCourseScreen(
                                                          courseList: slowCourse
                                                              .toList(),
                                                          title: 'Slow Courses',
                                                        ))),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Container();
                  }
                  return Container();
                },
              ),
            ),
            sectionHeader("Category", () {}),
            SizedBox(
              height: 8.sp,
            ),
            Container(
              height: 74.sp,
              alignment: Alignment.centerLeft,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 20.sp,
                  ),
                  Row(
                    children: [
                      category("assets/images/java.png", "Java", 18, 20),
                      SizedBox(
                        width: 8.sp,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      category("assets/images/coding.png", "Coding", 20, 12),
                      SizedBox(
                        width: 8.sp,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      category("assets/images/writing.png", "Writing", 18, 20),
                      SizedBox(
                        width: 8.sp,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      category(
                          "assets/images/design_icon.png", "Design", 18, 18),
                      SizedBox(
                        width: 8.sp,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      category(
                          "assets/images/design_icon.png", "Design", 18, 18),
                      SizedBox(
                        width: 8.sp,
                      )
                    ],
                  ),
                  viewAll(
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SearchScreen(selectedLanguage))),
                    height: 74,
                    width: 74,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14.25.sp,
            ),
          ],
        ),
      ),
    );
  }
}
