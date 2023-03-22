import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zicops/blocs/home/home_bloc.dart';
import 'package:zicops/repositories/home_repository.dart';
import 'package:zicops/utils/colors.dart';
import 'package:zicops/utils/dummies.dart';
import 'package:zicops/views/screens/new_course/new_course_screen.dart';
import 'package:zicops/views/screens/search/search_screen.dart';
import 'package:zicops/views/widgets/course_grid_item.dart';
import 'package:zicops/views/widgets/course_grid_item_large.dart';

import '../../../utils/time_format.dart';
import '../../widgets/course_list_item_with_progress.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  int currentCarousel = 0;
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
                      items: [0, 1, 2, 3, 4]
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
                                    "assets/images/course_preview.png",
                                    fit: BoxFit.fill,
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
            BlocProvider(
              create: (context) => HomeBloc(homeRepository: HomeRepository())
                ..add(LearningFolderCourseRequested()),
              child: Column(
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is LearningFolderCourseLoaded) {
                        return sectionHeader("Ongoing Courses", () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewCourseScreen(
                                        courseList: state.learningFolderCourses
                                            .where((course) =>
                                                course
                                                    .topicsStartedPercentage !=
                                                0)
                                            .toList(),
                                        title: 'Ongoing Courses',
                                      )));
                        });
                      }
                      return sectionHeader("Ongoing Courses", () {});
                    },
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  Container(
                    height: 156.sp,
                    alignment: Alignment.centerLeft,
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state is LearningFolderCourseLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is LearningFolderCourseLoaded) {
                          return ListView(
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
                                    ...state.learningFolderCourses
                                        .where((course) =>
                                            course.topicsStartedPercentage != 0)
                                        .toList()
                                        .map((courseItem) => CourseListItem(
                                              courseItem.name ?? '',
                                              courseItem.owner ?? '',
                                              formatDuration(
                                                  courseItem.duration ?? 0),
                                              courseItem.tileImage ?? '',
                                              courseItem.id ?? '',
                                              courseItem.expertiseLevel ?? '',
                                              courseItem.completedPercentage ??
                                                  0,
                                            )),
                                  ],
                                ),
                                SizedBox(
                                  width: 8.sp,
                                ),
                                viewAll(
                                  () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NewCourseScreen(
                                                courseList: state
                                                    .learningFolderCourses
                                                    .where((course) =>
                                                        course
                                                            .topicsStartedPercentage !=
                                                        0)
                                                    .toList(),
                                                title: 'Ongoing Courses',
                                              ))),
                                ),
                              ]);
                          // return ListView(
                          //   scrollDirection: Axis.horizontal,
                          //   children: [
                          //     SizedBox(
                          //       width: 20.sp,
                          //     ),
                          //     ...state.learningFolderCourses
                          //         .where((course) =>
                          //             course.topicsStartedPercentage != 0)
                          //         .toList()
                          //         .map((courseItem) => Row(
                          //               children: [
                          //                 CourseGridItem(
                          //                   courseItem.name ?? '',
                          //                   courseItem.owner ?? '',
                          //                   courseItem.expertiseLevel ?? '',
                          //                   '1',
                          //                   courseItem.tileImage ?? '',
                          //                   courseItem.id ?? '',
                          //                 ),
                          //                 SizedBox(
                          //                   width: 8.sp,
                          //                 )
                          //               ],
                          //             )),
                          //     viewAll(
                          //       () => Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => NewCourseScreen(
                          //                     courseList: state
                          //                         .learningFolderCourses
                          //                         .where((course) =>
                          //                             course
                          //                                 .topicsStartedPercentage !=
                          //                             0)
                          //                         .toList(),
                          //                     title: 'Ongoing Courses',
                          //                   ))),
                          //     ),
                          //   ],
                          // );
                        }
                        return Container(
                          child: const Text("No data"),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14.25.sp,
            ),
            // Container(
            //     height: 156.sp,
            //     alignment: Alignment.center,
            //     child: ListView(scrollDirection: Axis.horizontal, children: [
            //       GridView(
            //         scrollDirection: Axis.horizontal,
            //         physics:
            //             const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
            //         shrinkWrap: true,
            //         padding: EdgeInsets.only(left: 20.sp),
            //         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //             childAspectRatio: 0.23,
            //             crossAxisSpacing: 8.sp,
            //             mainAxisSpacing: 8.sp,
            //             maxCrossAxisExtent: 74.sp),
            //         children: [
            //           ...[1, 2, 3, 4].map((e) => CourseListItem(
            //               "IT Development",
            //               "Cognizent",
            //               "120mins Left",
            //               "assets/images/course_preview.png")),
            //         ],
            //       ),
            //       SizedBox(
            //         width: 8.sp,
            //       ),
            //       // viewAll()
            //     ])),
            BlocProvider(
              create: (context) => HomeBloc(homeRepository: HomeRepository())
                ..add(LearningFolderCourseRequested()),
              child: Column(
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is LearningFolderCourseLoaded) {
                        return sectionHeader("Learning Folder courses", () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewCourseScreen(
                                        courseList: state.learningFolderCourses,
                                        title: 'Learning Folder courses',
                                      )));
                        });
                      }
                      return sectionHeader("Learning Folder courses", () {});
                    },
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  Container(
                    height: 156.sp,
                    alignment: Alignment.centerLeft,
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state is LearningFolderCourseLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is LearningFolderCourseLoaded) {
                          return ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(
                                width: 20.sp,
                              ),
                              ...state.learningFolderCourses
                                  .map((courseItem) => Row(
                                        children: [
                                          CourseGridItem(
                                            courseItem.name ?? '',
                                            courseItem.owner ?? '',
                                            courseItem.expertiseLevel ?? '',
                                            formatDuration(
                                                courseItem.duration ?? 0),
                                            courseItem.tileImage ?? '',
                                            courseItem.id ?? '',
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
                                        builder: (context) => NewCourseScreen(
                                              courseList: state
                                                  .learningFolderCourses
                                                  .toList(),
                                              title: 'Learning Folder courses',
                                            ))),
                              ),
                            ],
                          );
                        }
                        return Container(
                          child: const Text("No data"),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 14.25.sp,
            ),
            BlocProvider(
              create: (context) => HomeBloc(homeRepository: HomeRepository())
                ..add(LatestCourseRequested()),
              child: Column(
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is LatestCourseLoaded) {
                        return sectionHeader("Latest courses", () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewCourseScreen(
                                        courseList: state.latestCourses,
                                        title: 'Latest courses',
                                      )));
                        });
                      }
                      return sectionHeader("Latest courses", () {});
                    },
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  Container(
                    height: 156.sp,
                    alignment: Alignment.centerLeft,
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        // print("latest course $state");
                        if (state is LatestCourseLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is LatestCourseLoaded) {
                          return ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(
                                width: 20.sp,
                              ),
                              ...state.latestCourses.map((courseItem) => Row(
                                    children: [
                                      CourseGridItem(
                                        courseItem.name ?? '',
                                        courseItem.owner ?? '',
                                        courseItem.expertiseLevel ?? '',
                                        formatDuration(
                                            courseItem.duration ?? 0),
                                        courseItem.tileImage ?? '',
                                        courseItem.id ?? '',
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
                                        builder: (context) => NewCourseScreen(
                                              courseList:
                                                  state.latestCourses.toList(),
                                              title: 'Latest courses',
                                            ))),
                              ),
                            ],
                          );
                        }
                        return Container(
                          child: const Text("No data"),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 14.25.sp,
            ),
            BlocProvider(
              create: (context) => HomeBloc(homeRepository: HomeRepository())
                ..add(LatestCourseRequested()),
              child: Column(
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is LatestCourseLoaded) {
                        return sectionHeader("Learning space", () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewCourseScreen(
                                        courseList: state.latestCourses,
                                        title: 'Learning space',
                                      )));
                        });
                      }
                      return sectionHeader("Learning space", () {});
                    },
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  Container(
                    height: 156.sp,
                    alignment: Alignment.centerLeft,
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        //    print("latest course $state");
                        if (state is LatestCourseLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is LatestCourseLoaded) {
                          return ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(
                                width: 20.sp,
                              ),
                              ...state.latestCourses.map((courseItem) => Row(
                                    children: [
                                      CourseGridItem(
                                        courseItem.name ?? '',
                                        courseItem.owner ?? '',
                                        courseItem.expertiseLevel ?? '',
                                        formatDuration(
                                            courseItem.duration ?? 0),
                                        courseItem.tileImage ?? '',
                                        courseItem.id ?? '',
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
                                        builder: (context) => NewCourseScreen(
                                              courseList:
                                                  state.latestCourses.toList(),
                                              title: 'Learning space',
                                            ))),
                              ),
                            ],
                          );
                        }
                        return Container(
                          child: const Text("No data"),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Container(
            //   height: 156.sp,
            //   alignment: Alignment.centerLeft,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       SizedBox(
            //         width: 20.sp,
            //       ),
            //       ...courseItems.map((courseItem) => Row(
            //             children: [
            //               CourseGridItem(
            //                 courseItem["courseName"],
            //                 courseItem["org"],
            //                 courseItem["difficulty"],
            //                 courseItem["courseLength"],
            //                 courseItem["preview"],
            //                 courseItem["courseId"],
            //               ),
            //               SizedBox(
            //                 width: 8.sp,
            //               )
            //             ],
            //           )),
            //       viewAll()
            //     ],
            //   ),
            // ),
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
                      language("assets/images/english_bg.png", "English"),
                      SizedBox(
                        width: 10.sp,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      language("assets/images/hindi_bg.png", "Hindi"),
                      SizedBox(
                        width: 10.sp,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      language("assets/images/arabic_bg.png", "Arabic"),
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
                  if (state is SubCategoryCourseError) {
                    return Container(
                      child: Text(state.error.toString()),
                    );
                  }
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
                                                      courseItem.id ?? '',
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
                                                      courseItem.id ?? '',
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
                                                      courseItem.id ?? '',
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
                                                      courseItem.id ?? '',
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
                                                      courseItem.id ?? '',
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
                                                    const SearchScreen()))),
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
                            builder: (context) => const SearchScreen())),
                    height: 74,
                    width: 74,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14.25.sp,
            ),
            sectionHeader("Trending courses", () {}),
            SizedBox(
              height: 8.sp,
            ),
            Container(
              width: width,
              height: 248.sp,
              alignment: Alignment.centerLeft,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 20.sp,
                  ),
                  ...courseItems.map((courseItem) => Row(
                        children: [
                          CourseGridItemLarge(
                            courseItem["courseName"],
                            courseItem["org"],
                            courseItem["difficulty"],
                            courseItem["courseLength"],
                            courseItem["preview"],
                            showAddButton: true,
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
                              builder: (context) => const SearchScreen())),
                      height: 248,
                      width: 320),
                ],
              ),
            ),
            SizedBox(
              height: 14.25.sp,
            ),
            sectionHeader("Recommended courses", () {}),
            SizedBox(
              height: 8.sp,
            ),
            Container(
              width: width,
              height: 248.sp,
              alignment: Alignment.centerLeft,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 20.sp,
                  ),
                  ...courseItems.map(
                    (courseItem) => Row(
                      children: [
                        CourseGridItemLarge(
                          courseItem["courseName"],
                          courseItem["org"],
                          courseItem["difficulty"],
                          courseItem["courseLength"],
                          courseItem["preview"],
                          showAddButton: true,
                        ),
                        SizedBox(
                          width: 8.sp,
                        )
                      ],
                    ),
                  ),
                  viewAll(
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen())),
                      height: 248,
                      width: 320)
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

// import 'dart:convert';
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:zicops/utils/colors.dart';
// import 'package:zicops/utils/dummies.dart';
// import 'package:zicops/views/screens/new_course/new_course_screen.dart';
// import 'package:zicops/views/screens/search/search_screen.dart';
// import 'package:zicops/views/widgets/course_grid_item.dart';
// import 'package:zicops/views/widgets/course_grid_item_large.dart';
// import 'package:zicops/views/widgets/course_list_item_with_progress.dart';
//
// import '../../../controllers/controller.dart';
// import '../../../graphql_api.graphql.dart';
// import '../../../main.dart';
// import '../../../models/user/user_course_model.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return _HomeScreen();
//   }
// }
//
// class _HomeScreen extends State<HomeScreen> {
//   final _controller = Get.find<Controller>();
//
//   int currentCarousel = 0;
//   CarouselController carouselController = CarouselController();
//   // remember to refractor the code later
//   // take allCatMain from bloc and we can display that.
//
//   String lspId = '8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1';
//
//   Future<List<Course>> loadCourses({String lspId = '', String? subCat}) async {
//     // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     // final data = sharedPreferences.getString('userData');
//     List<Course> courseData = [];
//     final allLatestCourse = await courseQClient.client()?.execute(
//         LatestCoursesQuery(
//             variables: LatestCoursesArguments(
//                 publishTime: DateTime.now().millisecondsSinceEpoch ~/ 1000,
//                 pageCursor: "",
//                 pageSize: 1000,
//                 filters: CoursesFilters(lspId: lspId, subCategory: subCat),
//                 Direction: "")));
//
//     for (int i
//         in allLatestCourse?.data?.latestCourses?.courses?.asMap().keys ?? []) {
//       final data = allLatestCourse?.data?.latestCourses?.courses?[i];
//       courseData.add(Course(
//           id: data?.id,
//           name: data?.name,
//           publisher: data?.publisher,
//           description: data?.description,
//           expertiseLevel: data?.expertiseLevel,
//           owner: data?.owner,
//           isDisplay: data?.isDisplay,
//           type: data?.type,
//           tileImage: data?.tileImage,
//           //subCategories: data?.subCategories,
//           image: data?.image));
//     }
//     // print(courseData);
//     return courseData;
//   }
//
//   Future<List<Course>> loadUserCourseData() async {
//     // 5. try to add data in the model
//     String lspId = '8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1';
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     // Map<String, dynamic> jsonDetails =
//         // jsonDecode(sharedPreferences.getString('user')??'');
//     var user = _controller.userDetails;
//     final userCourseMap = await userClient.client()?.execute(
//         GetUserCourseMapsQuery(
//             variables: GetUserCourseMapsArguments(
//                 user_id: user.id!,
//                 publish_time:
//                     (DateTime.now().millisecondsSinceEpoch / 1000).toInt(),
//                 pageCursor: '',
//                 pageSize: 50,
//                 filters: new CourseMapFilters(lspId: [lspId]))));
//
//     List<String>? userCourseIds = [];
//     List<String?> courseIds = [];
//
//     var assignedCourses = userCourseMap?.data?.getUserCourseMaps?.userCourses;
//
//     for (int i in assignedCourses?.asMap().keys ?? []) {
//       var data = assignedCourses?[i];
//       userCourseIds.add(data?.userCourseId ?? '');
//       courseIds.add(data?.courseId.toString());
//     }
//     final courseRes = await courseQClient.client()?.execute(
//         GetCourseQuery(variables: GetCourseArguments(course_id: courseIds)));
//     final userCourseProgress = await userClient.client()?.execute(
//         GetUserCourseProgressByMapIdQuery(
//             variables: GetUserCourseProgressByMapIdArguments(
//                 userId: user.id!, userCourseId: userCourseIds)));
//
//     List<dynamic> courseMeta = [];
//     for (int i in assignedCourses?.asMap().keys ?? []) {
//       var data = assignedCourses?[i];
//       var courseData = courseRes?.data?.getCourse;
//       var cpData = userCourseProgress?.data?.getUserCourseProgressByMapId
//               ?.where((cp) => cp?.userCourseId == data?.userCourseId)
//               .toList() ??
//           [];
//
//       var courseDetails = courseData
//               ?.singleWhere((course) => course?.id == data?.courseId)
//               ?.toJson() ??
//           {};
//       courseMeta.add(Course(
//           id: courseDetails['id'],
//           name: courseDetails['name'],
//           publisher: courseDetails['publisher'],
//           courseProgress: cpData,
//           createdAt: data?.createdAt,
//           endDate: data?.endDate,
//           duration: courseDetails['duration'],
//           addedBy: data?.addedBy,
//           tileImage: courseDetails['tileImage'],
//           image: courseDetails['image'],
//           publishDate: courseDetails['publish_date'],
//           owner: courseDetails['owner'],
//           expertiseLevel: courseDetails['expertise_level'],
//           userCourseId: courseDetails['user_course_id'],
//           userLspId: courseDetails['user_lsp_id']));
//     }
//
//     List<Course> userCourseData = [];
//     //to calculate progress of user
//     for (int i in courseMeta.asMap().keys) {
//       var _courseData = courseMeta[i];
//       var role = json.decode(_courseData?.addedBy);
//       var topicsCompleted = 0;
//       var topicsStarted = 0;
//       List userProgressArr = _courseData?.courseProgress ?? [];
//
//       for (int i in userProgressArr.asMap().keys) {
//         if (userProgressArr[i]?.status != 'non-started') ++topicsStarted;
//
//         if (userProgressArr[i]?.status == 'completed') ++topicsCompleted;
//       }
//       int progressLength = userProgressArr.length;
//       double cProgress = ((topicsStarted * 100) / progressLength);
//       double tProgress = ((topicsCompleted * 100) / progressLength);
//       var courseProgress = userProgressArr.isNotEmpty ? cProgress.floor() : 0;
//       var topicProgress = userProgressArr.isNotEmpty ? tProgress.floor() : 0;
//       var courseDuration = _courseData?.duration;
//
//       if (_courseData?.status == 'PUBLISHED') continue;
//
//       // int? timeLeft =
//       //     (courseDuration - (courseDuration * (topicProgress ?? 0)) / 100);
//
//       userCourseData.add(Course(
//           id: _courseData?.id,
//           name: _courseData?.name,
//           publisher: _courseData?.publisher,
//           courseProgress: _courseData?.courseProgress,
//           createdAt: _courseData?.createdAt,
//           endDate: _courseData?.endDate,
//           duration: _courseData?.duration,
//           addedBy: role['role'],
//           tileImage: _courseData?.tileImage,
//           image: _courseData?.image,
//           publishDate: _courseData?.publishDate,
//           owner: _courseData?.owner,
//           expertiseLevel: _courseData?.expertiseLevel,
//           completedPercentage: topicProgress,
//           topicsStartedPercentage: courseProgress,
//           scheduleDate: _courseData?.endDate,
//           userCourseId: _courseData?.userCourseId,
//           userLspId: _courseData?.userLspId));
//     }
//
//     //  print(userCourseData.toString());
//     return userCourseData;
//   }
//
//   Future loadUserPreferences() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     // Map<String, dynamic> jsonDetails =
//         // jsonDecode(sharedPreferences.getString('user') ?? '');
//     // var user = UserDetailsModel.fromJson(jsonDetails);
//     // String userLspId = sharedPreferences.getString('userLspId')!;
//
//     // for now it is hardcoded need to be fixed in lsp screen screen
//     // String userLspId = '96a30957-3bd8-41cc-87ad-9c863d423c3e';
//     String userLspId = _controller.userDetails.userLspId.toString();
//     String userId = _controller.userDetails.id.toString();
//     final res = await userClient.client()?.execute(GetUserPreferencesQuery(
//         variables: GetUserPreferencesArguments(userId: userId)));
//
//     print(res?.data?.getUserPreferences?.length);
//
//     for (int i in res?.data?.getUserPreferences?.asMap().keys ?? []) {
//       final data = res?.data?.getUserPreferences?[i];
//       if (data!.userLspId == userLspId &&
//           _controller.userPreferences.length < 5 &&
//           data.isActive) {
//         print(data.subCategory);
//         _controller.userPreferences.add(data.subCategory);
//       }
//     }
//
//     bool isEmpty = true;
//     if (_controller.userPreferences.isNotEmpty) {
//       for (var i in _controller.userPreferences.asMap().keys) {
//         var index = i + 1;
//         _controller.subCats['subCat$index'] = await loadCourses(
//             lspId: lspId, subCat: _controller.userPreferences[i]);
//
//         if (_controller.subCats['subCat$index']!.isNotEmpty) {
//           isEmpty = false;
//         }
//       }
//
//       print(_controller.subCats);
//       // _controller.subCatCourses1 = await loadCourses(
//       //     lspId: lspId, subCat: _controller.userPreferences[0]);
//       // _controller.subCatCourses2 = await loadCourses(
//       //     lspId: lspId, subCat: _controller.userPreferences[1]);
//       // //subCatCourses2[0].subCategory = userPreferences[1];
//       // _controller.subCatCourses3 = await loadCourses(
//       //     lspId: lspId, subCat: _controller.userPreferences[2]);
//       // _controller.subCatCourses4 = await loadCourses(
//       //     lspId: lspId, subCat: _controller.userPreferences[3]);
//       // _controller.subCatCourses5 = await loadCourses(
//       //     lspId: lspId, subCat: _controller.userPreferences[4]);
//
//       _controller.subCatCourses1 = _controller.subCats['subCat1']!.toList();
//       _controller.subCatCourses2 = _controller.subCats['subCat2']!.toList();
//       //subCatCourses2[0].subCategory = userPreferences[1];
//       _controller.subCatCourses3 = _controller.subCats['subCat3']!.toList();
//       _controller.subCatCourses4 = _controller.subCats['subCat4']!.toList();
//       _controller.subCatCourses5 = _controller.subCats['subCat5']!.toList();
//     }
//
//     // if (kDebugMode) {
//     //   print(subCatCourses1[0].subCategory);
//     //   print(subCatCourses1[0].id);
//     //   print(subCatCourses1[0].name);
//     //   print(subCatCourses1[0].publisher);
//     //   print(subCatCourses1[0].description);
//     //   print(subCatCourses1[0].expertiseLevel);
//     //   print(subCatCourses1[0].owner);
//     //   print(subCatCourses1[0].isDisplay);
//     //   print(subCatCourses1[0].type);
//     //   print(subCatCourses1[0].tileImage);
//     //   print(subCatCourses1[0].image);
//     //   // print(json.encode(subCatCourses1));
//     // }
//
//     setState(() {
//       if (!isEmpty) {
//         _controller.subCatCourses1[0].subCategory =
//             _controller.userPreferences[0];
//         _controller.subCatCourses2[0].subCategory =
//             _controller.userPreferences[1];
//         _controller.subCatCourses3[0].subCategory =
//             _controller.userPreferences[2];
//       }
//       // _controller.subCatCourses4[0].subCategory =
//       //     _controller.userPreferences[3];
//       // _controller.subCatCourses5[0].subCategory =
//       //     _controller.userPreferences[4];
//     });
//
//     // print(subCatCourses2[0].subCategory);
//     // print(subCatCourses4);
//     // print(subCatCourses4[0].subCategory);
//     //  print(subCatCourses5[0].subCategory);
//     // after this call for loadCourses by iterating over userPreferences and passing is as subcat
//     // take that course and put it in subcatCourse1 2 3 4 5 resp.
//   }
//
//   Future callCourses() async {
//     _controller.latestCourses =
//         await loadCourses(lspId: '8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1');
//     _controller.lspCourses =
//         await loadCourses(lspId: '8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1');
//     _controller.learningFolderCourses = await loadUserCourseData();
//     _controller.onGoingCourses = _controller.learningFolderCourses
//         .where((course) => course.topicsStartedPercentage > 0)
//         .toList();
//     _controller.assignedCourses = _controller.learningFolderCourses
//         .where(
//             (course) => course.addedBy == 'admin' || course.addedBy == 'cohort')
//         .toList();
//     _controller.selfAddedCourses = _controller.learningFolderCourses
//         .where((course) => course.addedBy == 'self')
//         .toList();
//
//
//   }
//
//   Widget sectionHeader(String label, Function() action,
//       {bool showSeeAll = true}) {
//     return Container(
//         height: 24.sp,
//         padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               label,
//               style: TextStyle(
//                   color: textPrimary,
//                   fontSize: 18.sp,
//                   fontWeight: FontWeight.w500,
//                   height: 1.33),
//             ),
//             GestureDetector(
//               behavior: HitTestBehavior.translucent,
//               onTap: action,
//               child: Text("See all".toUpperCase(),
//                   style: TextStyle(
//                       foreground: Paint()
//                         ..shader = RadialGradient(
//                           colors: showSeeAll
//                               ? [primaryColor, gradientTwo]
//                               : [Colors.transparent, Colors.transparent],
//                           center: Alignment.center,
//                           radius: 35.sp,
//                         ).createShader(
//                             const Rect.fromLTWH(0.0, 0.0, 50.0, 24.0),
//                             textDirection: TextDirection.ltr),
//                       fontSize: 12.sp,
//                       letterSpacing: 1,
//                       fontWeight: FontWeight.w600)),
//             )
//           ],
//         ));
//   }
//
//   Widget category(
//       String icon, String label, double iconWidth, double iconHeight) {
//     return Container(
//         padding: EdgeInsets.symmetric(vertical: 0.5.sp, horizontal: 0.5.sp),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(4.sp),
//             gradient: LinearGradient(colors: [
//               secondaryColorDarkOutline,
//               secondaryColorDarkOutline.withOpacity(0.15),
//             ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//         child: Container(
//             width: 74.sp,
//             height: 74.sp,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4.sp),
//               color: secondaryColor,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                     width: 24.sp,
//                     height: 24.sp,
//                     alignment: Alignment.center,
//                     child: Image.asset(
//                       icon,
//                       height: iconHeight.sp,
//                       width: iconWidth.sp,
//                       fit: BoxFit.contain,
//                     )),
//                 Text(
//                   label,
//                   style: TextStyle(
//                       color: textPrimary,
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w500,
//                       height: 1.43),
//                 )
//               ],
//             )));
//   }
//
//   Widget language(String background, String label) {
//     return Container(
//         width: 104.sp,
//         height: 100.sp,
//         alignment: Alignment.center,
//         padding: EdgeInsets.symmetric(vertical: 2.sp),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(4.sp),
//             image: DecorationImage(
//                 image: AssetImage(background), fit: BoxFit.fill)),
//         child: Text(
//           label,
//           style: TextStyle(
//               color: textPrimary,
//               fontSize: 18.sp,
//               fontWeight: FontWeight.w500,
//               height: 1.33),
//         ));
//   }
//
//   Widget viewAll({int height = 156, int width = 156}) {
//     return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//       GestureDetector(
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const SearchScreen()));
//           },
//           child: Container(
//               padding:
//                   EdgeInsets.symmetric(vertical: 0.5.sp, horizontal: 0.5.sp),
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(4.sp),
//                   gradient: LinearGradient(colors: [
//                     secondaryColorDarkOutline,
//                     secondaryColorDarkOutline.withOpacity(0.15),
//                   ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//               child: Container(
//                   width: width.sp,
//                   height: height.sp,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: secondaryColor,
//                     borderRadius: BorderRadius.circular(4.sp),
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Transform.rotate(
//                           angle: 3.14,
//                           child: Container(
//                               width: 24.sp,
//                               height: 24.sp,
//                               alignment: Alignment.center,
//                               child: Image.asset(
//                                 "assets/images/back_arrow.png",
//                                 width: 16.sp,
//                                 height: 16.sp,
//                                 color: textPrimary,
//                               ))),
//                       SizedBox(
//                         height: 4.sp,
//                       ),
//                       Text(
//                         "View all",
//                         style: TextStyle(
//                             color: textPrimary,
//                             fontSize: 14.sp,
//                             fontWeight: FontWeight.w500),
//                       )
//                     ],
//                   )))),
//       SizedBox(
//         width: 8.sp,
//       )
//     ]);
//   }
//
//   // Future<dynamic> futureWait() async {
//   //   return Future.wait([
//   //     loadUserPreferences(),
//   //     loadUserCourseData(),
//   //     callCourses(),
//   //     loadCourses(),
//   //     // Future.delayed(const Duration(seconds: 1), () => "First Future Done"),
//   //     // Future.delayed(const Duration(seconds: 2), () => "Second Future Done"),
//   //     // Future.delayed(const Duration(seconds: 3), () => "Third Future Done"),
//   //   ]);
//   // }
//
//   @override
//   void initState() {
//     super.initState();
//     loadUserPreferences();
//     loadUserCourseData();
//     callCourses();
//     loadCourses();
//     //print(_controller.latestCourses[0]);
// //    futureWait();
//
//     //loadUserCourseData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//
//     return Container(
//       height: height,
//       padding: EdgeInsets.only(bottom: 5.sp),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 14.sp,
//             ),
//             SizedBox(
//                 width: width,
//                 height: 180.sp,
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     CarouselSlider(
//                       carouselController: carouselController,
//                       options: CarouselOptions(
//                         viewportFraction: 0.93,
//                         initialPage: 0,
//                         enableInfiniteScroll: true,
//                         reverse: false,
//                         autoPlay: true,
//                         autoPlayInterval: const Duration(seconds: 4),
//                         autoPlayAnimationDuration:
//                             const Duration(milliseconds: 2000),
//                         autoPlayCurve: Curves.easeIn,
//                         enlargeCenterPage: false,
//                         enlargeFactor: 0.3,
//                         onPageChanged: (index, reason) {
//                           setState(() {
//                             currentCarousel = index;
//                           });
//                         },
//                         scrollDirection: Axis.horizontal,
//                       ),
//                       items: [0, 1, 2, 3, 4]
//                           .map((i) => Center(
//                               child: AnimatedContainer(
//                                   curve: Curves.easeInCubic,
//                                   width: 320.sp,
//                                   height:
//                                       currentCarousel == i ? 180.sp : 164.sp,
//                                   margin:
//                                       EdgeInsets.symmetric(horizontal: 4.sp),
//                                   decoration: BoxDecoration(
//                                       borderRadius:
//                                           BorderRadius.circular(4.sp)),
//                                   clipBehavior: Clip.antiAlias,
//                                   duration: const Duration(milliseconds: 800),
//                                   child: Image.asset(
//                                     "assets/images/course_preview.png",
//                                     fit: BoxFit.fill,
//                                   ))))
//                           .toList(),
//                     ),
//                     Positioned(
//                         bottom: 12.sp,
//                         left: 144.sp,
//                         child: AnimatedSmoothIndicator(
//                           count: [0, 1, 2, 3, 4].length,
//                           effect: ExpandingDotsEffect(
//                               dotHeight: 8.sp,
//                               dotWidth: 8.sp,
//                               spacing: 8.sp,
//                               activeDotColor: const Color(0xFF22AAA1),
//                               dotColor: const Color(0x29FFFFFF)
//                               // strokeWidth: 5,
//                               ),
//                           activeIndex: currentCarousel,
//                         )),
//                   ],
//                 )),
//             SizedBox(
//               height: 14.25.sp,
//             ),
//             sectionHeader("Ongoing Courses", () {}),
//             SizedBox(
//               height: 8.sp,
//             ),
//             Container(
//                 height: 156.sp,
//                 alignment: Alignment.center,
//                 child: ListView(scrollDirection: Axis.horizontal, children: [
//                   GridView(
//                     scrollDirection: Axis.horizontal,
//                     physics:
//                         const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
//                     shrinkWrap: true,
//                     padding: EdgeInsets.only(left: 20.sp),
//                     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                         childAspectRatio: 0.23,
//                         crossAxisSpacing: 8.sp,
//                         mainAxisSpacing: 8.sp,
//                         maxCrossAxisExtent: 74.sp),
//                     children: (_controller.learningFolderCourses.isNotEmpty)
//                         ? [
//                             ..._controller.learningFolderCourses
//                                 .where((element) =>
//                                     element.completedPercentage > 0)
//                                 .map((e) => CourseListItem(
//                                       e.name,
//                                       e.owner,
//                                       "120mins Left",
//                                       e.tileImage,
//                                     )),
//                           ]
//                         : [
//                             Center(
//                               child: CircularProgressIndicator(),
//                             )
//                           ],
//                   ),
//                   SizedBox(
//                     width: 8.sp,
//                   ),
//                   viewAll()
//                 ])),
//             SizedBox(
//               height: 14.25.sp,
//             ),
//             sectionHeader("Learning Folder", () {}),
//             SizedBox(
//               height: 8.sp,
//             ),
//             Container(
//               height: 156.sp,
//               alignment: Alignment.centerLeft,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: (_controller.learningFolderCourses.isNotEmpty)
//                     ? [
//                         SizedBox(
//                           width: 20.sp,
//                         ),
//                         ..._controller.learningFolderCourses
//                             .where(
//                                 (element) => element.completedPercentage <= 0)
//                             .map((courseItem) => Row(
//                                   children: [
//                                     CourseGridItem(
//                                       courseItem.name ?? '',
//                                       courseItem.owner ?? '',
//                                       courseItem.expertiseLevel ?? '',
//                                       '1',
//                                       courseItem.tileImage ?? '',
//                                       courseItem.id ?? '',
//                                     ),
//                                     SizedBox(
//                                       width: 8.sp,
//                                     )
//                                   ],
//                                 )),
//                         viewAll()
//                       ]
//                     : [
//                         SizedBox(
//                           width: 20.sp,
//                         ),
//                         Center(child: CircularProgressIndicator()),
//                       ],
//               ),
//             ),
//             SizedBox(
//               height: 14.25.sp,
//             ),
//             sectionHeader("Latest courses", () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const NewCourseScreen()));
//             }),
//             SizedBox(
//               height: 8.sp,
//             ),
//             Container(
//               height: 156.sp,
//               alignment: Alignment.centerLeft,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: (_controller.latestCourses.isNotEmpty)
//                     ? [
//                         SizedBox(
//                           width: 20.sp,
//                         ),
//                         ..._controller.latestCourses.map((courseItem) => Row(
//                               children: [
//                                 CourseGridItem(
//                                   courseItem.name ?? '',
//                                   courseItem.owner ?? '',
//                                   courseItem.expertiseLevel ?? '',
//                                   '1',
//                                   courseItem.tileImage ?? '',
//                                   courseItem.id ?? '',
//                                 ),
//                                 SizedBox(
//                                   width: 8.sp,
//                                 )
//                               ],
//                             )),
//                         viewAll(),
//                       ]
//                     : [
//                         SizedBox(
//                           width: 20.sp,
//                         ),
//                         Center(child: CircularProgressIndicator()),
//                       ],
//               ),
//             ),
//             SizedBox(
//               height: 14.25.sp,
//             ),
//             sectionHeader("Learning space", () {}),
//             SizedBox(
//               height: 8.sp,
//             ),
//             Container(
//               height: 156.sp,
//               alignment: Alignment.centerLeft,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: (_controller.lspCourses.isNotEmpty)
//                     ? [
//                         SizedBox(
//                           width: 20.sp,
//                         ),
//                         ..._controller.lspCourses.map((courseItem) => Row(
//                               children: [
//                                 CourseGridItem(
//                                   courseItem.name ?? '',
//                                   courseItem.owner ?? '',
//                                   courseItem.expertiseLevel ?? '',
//                                   '1',
//                                   courseItem.tileImage ?? '',
//                                   courseItem.id ?? '',
//                                 ),
//                                 SizedBox(
//                                   width: 8.sp,
//                                 )
//                               ],
//                             )),
//                         viewAll()
//                       ]
//                     : [
//                         SizedBox(
//                           width: 20.sp,
//                         ),
//                         Center(child: CircularProgressIndicator()),
//                       ],
//               ),
//             ),
//             SizedBox(
//               height: 14.25.sp,
//             ),
//             sectionHeader("Multilingual courses", () {}, showSeeAll: false),
//             SizedBox(
//               height: 10.sp,
//             ),
//             Container(
//               height: 100.sp,
//               alignment: Alignment.centerLeft,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   SizedBox(
//                     width: 20.sp,
//                   ),
//                   Row(
//                     children: [
//                       language("assets/images/english_bg.png", "English"),
//                       SizedBox(
//                         width: 10.sp,
//                       )
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       language("assets/images/hindi_bg.png", "Hindi"),
//                       SizedBox(
//                         width: 10.sp,
//                       )
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       language("assets/images/arabic_bg.png", "Arabic"),
//                       SizedBox(
//                         width: 10.sp,
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 14.25.sp,
//             ),
//             sectionHeader(
//               _controller.subCatCourses1.isNotEmpty
//                   ? _controller.subCatCourses1[0].subCategory
//                   : "",
//               // _controller.subCatCourses1?[0].subCategory,
//               () {},
//             ),
//             SizedBox(
//               height: 8.sp,
//             ),
//             Container(
//               height: 156.sp,
//               alignment: Alignment.centerLeft,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: (_controller.subCatCourses1.isNotEmpty)
//                     ? [
//                         SizedBox(
//                           width: 20.sp,
//                         ),
//                         ..._controller.subCatCourses1.map((courseItem) => Row(
//                               children: [
//                                 CourseGridItem(
//                                   courseItem.name!,
//                                   courseItem.owner!,
//                                   courseItem.expertiseLevel!,
//                                   "1h 30m",
//                                   courseItem.tileImage!,
//                                   courseItem.id ?? '',
//                                 ),
//                                 SizedBox(
//                                   width: 8.sp,
//                                 )
//                               ],
//                             )),
//                         viewAll()
//                       ]
//                     : [
//                         SizedBox(
//                           width: 20.sp,
//                         ),
//                         Text(
//                           "No courses found",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//               ),
//             ),
//             SizedBox(
//               height: 14.25.sp,
//             ),
//             sectionHeader(
//               _controller.subCatCourses2.isNotEmpty
//                   ? _controller.subCatCourses2[0].subCategory
//                   : "",
//               //_controller.subCatCourses2?[0].subCategory ?? '',
//               () {},
//             ),
//             SizedBox(
//               height: 8.sp,
//             ),
//             Container(
//               height: 156.sp,
//               alignment: Alignment.centerLeft,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: (_controller.subCatCourses2.isNotEmpty)
//                     ? [
//                         SizedBox(
//                           width: 20.sp,
//                         ),
//                         ..._controller.subCatCourses2.map((courseItem) => Row(
//                               children: [
//                                 CourseGridItem(
//                                   courseItem.name ?? "",
//                                   courseItem.owner ?? "",
//                                   courseItem.expertiseLevel ?? "",
//                                   "1h 30m",
//                                   courseItem.tileImage ?? "",
//                                   courseItem.id ?? '',
//                                 ),
//                                 SizedBox(
//                                   width: 8.sp,
//                                 )
//                               ],
//                             )),
//                         viewAll()
//                       ]
//                     : [
//                         SizedBox(
//                           width: 20.sp,
//                         ),
//                         Text(
//                           "No courses found",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//               ),
//             ),
//             SizedBox(
//               height: 14.25.sp,
//             ),
//             sectionHeader(
//               _controller.subCatCourses3.isNotEmpty
//                   ? _controller.subCatCourses3[0].subCategory
//                   : "",
//               // _controller.subCatCourses3?[0].subCategory ?? '',
//               () {},
//             ),
//             SizedBox(
//               height: 8.sp,
//             ),
//             Container(
//               height: 156.sp,
//               alignment: Alignment.centerLeft,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: (_controller.subCatCourses3.isNotEmpty)
//                     ? [
//                         SizedBox(
//                           width: 20.sp,
//                         ),
//                         ..._controller.subCatCourses3.map((courseItem) => Row(
//                               children: [
//                                 CourseGridItem(
//                                   courseItem.name ?? '',
//                                   courseItem.owner ?? '',
//                                   courseItem.expertiseLevel ?? '',
//                                   "1h 30m",
//                                   courseItem.tileImage ?? '',
//                                   courseItem.id ?? '',
//                                 ),
//                                 SizedBox(
//                                   width: 8.sp,
//                                 )
//                               ],
//                             )),
//                         viewAll()
//                       ]
//                     : [
//                         SizedBox(
//                           width: 20.sp,
//                         ),
//                         Center(child: CircularProgressIndicator()),
//                       ],
//               ),
//             ),
//             SizedBox(
//               height: 14.25.sp,
//             ),
//             sectionHeader("Category", () {}),
//             SizedBox(
//               height: 8.sp,
//             ),
//             Container(
//               height: 74.sp,
//               alignment: Alignment.centerLeft,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: _controller.userPreferences.isNotEmpty
//                     ? [
//                         SizedBox(
//                           width: 20.sp,
//                         ),
//                         ..._controller.userPreferences.map((e) => Row(
//                               children: [
//                                 category("assets/images/java.png",
//                                     e.substring(0, 4), 18, 20),
//                                 SizedBox(
//                                   width: 8.sp,
//                                 )
//                               ],
//                             )),
//                         // Row(
//                         //   children: [
//                         //     category("assets/images/coding.png", "Coding", 20, 12),
//                         //     SizedBox(
//                         //       width: 8.sp,
//                         //     )
//                         //   ],
//                         // ),
//                         // Row(
//                         //   children: [
//                         //     category("assets/images/writing.png", "Writing", 18, 20),
//                         //     SizedBox(
//                         //       width: 8.sp,
//                         //     )
//                         //   ],
//                         // ),
//                         // Row(
//                         //   children: [
//                         //     category(
//                         //         "assets/images/design_icon.png", "Design", 18, 18),
//                         //     SizedBox(
//                         //       width: 8.sp,
//                         //     )
//                         //   ],
//                         // ),
//                         // Row(
//                         //   children: [
//                         //     category(
//                         //         "assets/images/design_icon.png", "Design", 18, 18),
//                         //     SizedBox(
//                         //       width: 8.sp,
//                         //     )
//                         //   ],
//                         // ),
//                         viewAll(height: 74, width: 74)
//                       ]
//                     : [],
//               ),
//             ),
//             SizedBox(
//               height: 14.25.sp,
//             ),
//             sectionHeader("Trending courses", () {}),
//             SizedBox(
//               height: 8.sp,
//             ),
//             Container(
//               width: width,
//               height: 248.sp,
//               alignment: Alignment.centerLeft,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   SizedBox(
//                     width: 20.sp,
//                   ),
//                   ...courseItems.map((courseItem) => Row(
//                         children: [
//                           CourseGridItemLarge(
//                             courseItem["courseName"],
//                             courseItem["org"],
//                             courseItem["difficulty"],
//                             courseItem["courseLength"],
//                             courseItem["preview"],
//                             showAddButton: true,
//                           ),
//                           SizedBox(
//                             width: 8.sp,
//                           )
//                         ],
//                       )),
//                   viewAll(height: 248, width: 320)
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 14.25.sp,
//             ),
//             sectionHeader("Recommended courses", () {}),
//             SizedBox(
//               height: 8.sp,
//             ),
//             Container(
//               width: width,
//               height: 248.sp,
//               alignment: Alignment.centerLeft,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   SizedBox(
//                     width: 20.sp,
//                   ),
//                   ...courseItems.map(
//                     (courseItem) => Row(
//                       children: [
//                         CourseGridItemLarge(
//                           courseItem["courseName"],
//                           courseItem["org"],
//                           courseItem["difficulty"],
//                           courseItem["courseLength"],
//                           courseItem["preview"],
//                           showAddButton: true,
//                         ),
//                         SizedBox(
//                           width: 8.sp,
//                         )
//                       ],
//                     ),
//                   ),
//                   viewAll(height: 248, width: 320)
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 14.25.sp,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
