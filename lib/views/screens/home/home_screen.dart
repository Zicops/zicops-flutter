import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zicops/utils/colors.dart';
import 'package:zicops/utils/dummies.dart';
import 'package:zicops/views/screens/new_course/new_course_screen.dart';
import 'package:zicops/views/screens/search/search_screen.dart';
import 'package:zicops/views/widgets/course_grid_item.dart';
import 'package:zicops/views/widgets/course_grid_item_large.dart';
import 'package:zicops/views/widgets/course_list_item_with_progress.dart';

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

  Widget viewAll({int height = 156, int width = 156}) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SearchScreen()));
          },
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
            sectionHeader("Ongoing Courses", () {}),
            SizedBox(
              height: 8.sp,
            ),
            Container(
                height: 156.sp,
                alignment: Alignment.center,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  GridView(
                    scrollDirection: Axis.horizontal,
                    physics:
                        const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 20.sp),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        childAspectRatio: 0.23,
                        crossAxisSpacing: 8.sp,
                        mainAxisSpacing: 8.sp,
                        maxCrossAxisExtent: 74.sp),
                    children: [
                      ...[1, 2, 3, 4].map((e) => CourseListItem(
                          "IT Development",
                          "Cognizent",
                          "120mins Left",
                          "assets/images/course_preview.png")),
                    ],
                  ),
                  SizedBox(
                    width: 8.sp,
                  ),
                  viewAll()
                ])),
            SizedBox(
              height: 14.25.sp,
            ),
            sectionHeader("Learning Folder", () {}),
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
                  ...courseItems.map((courseItem) => Row(
                        children: [
                          CourseGridItem(
                            courseItem["courseName"],
                            courseItem["org"],
                            courseItem["difficulty"],
                            courseItem["courseLength"],
                            courseItem["preview"],
                          ),
                          SizedBox(
                            width: 8.sp,
                          )
                        ],
                      )),
                  viewAll()
                ],
              ),
            ),
            SizedBox(
              height: 14.25.sp,
            ),
            sectionHeader("Latest courses", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NewCourseScreen()));
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
                  ...courseItems.map((courseItem) => Row(
                        children: [
                          CourseGridItem(
                            courseItem["courseName"],
                            courseItem["org"],
                            courseItem["difficulty"],
                            courseItem["courseLength"],
                            courseItem["preview"],
                          ),
                          SizedBox(
                            width: 8.sp,
                          )
                        ],
                      )),
                  viewAll()
                ],
              ),
            ),
            SizedBox(
              height: 14.25.sp,
            ),
            sectionHeader("Learning space", () {}),
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
                  ...courseItems.map((courseItem) => Row(
                        children: [
                          CourseGridItem(
                            courseItem["courseName"],
                            courseItem["org"],
                            courseItem["difficulty"],
                            courseItem["courseLength"],
                            courseItem["preview"],
                          ),
                          SizedBox(
                            width: 8.sp,
                          )
                        ],
                      )),
                  viewAll()
                ],
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
            sectionHeader("UI/UX design", () {}),
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
                  ...courseItems.map((courseItem) => Row(
                        children: [
                          CourseGridItem(
                            courseItem["courseName"],
                            courseItem["org"],
                            courseItem["difficulty"],
                            courseItem["courseLength"],
                            courseItem["preview"],
                          ),
                          SizedBox(
                            width: 8.sp,
                          )
                        ],
                      )),
                  viewAll()
                ],
              ),
            ),
            SizedBox(
              height: 14.25.sp,
            ),
            sectionHeader("Design", () {}),
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
                  ...courseItems.map((courseItem) => Row(
                        children: [
                          CourseGridItem(
                            courseItem["courseName"],
                            courseItem["org"],
                            courseItem["difficulty"],
                            courseItem["courseLength"],
                            courseItem["preview"],
                          ),
                          SizedBox(
                            width: 8.sp,
                          )
                        ],
                      )),
                  viewAll()
                ],
              ),
            ),
            SizedBox(
              height: 14.25.sp,
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
                  viewAll(height: 74, width: 74)
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
                  viewAll(height: 248, width: 320)
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
                  viewAll(height: 248, width: 320)
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
