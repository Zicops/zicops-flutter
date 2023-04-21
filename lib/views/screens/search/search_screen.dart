import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zicops/blocs/home/home_bloc.dart';
import 'package:zicops/repositories/home_repository.dart';
import 'package:zicops/utils/dummies.dart';
import 'package:zicops/views/screens/home/home_screen.dart';
import 'package:zicops/views/screens/search/widgets/bookmark_list_item.dart';
import 'package:zicops/views/screens/search/widgets/search_course_list_item.dart';

import '../../../utils/colors.dart';
import '../../widgets/filter_bottom_modal.dart';

class SearchScreen extends StatefulWidget {
  final String? language;
  const SearchScreen(this.language, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchScreen();
  }
}

class _SearchScreen extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFN = FocusNode();
  bool isSearchCompleted = false;

  List<String> suggestedSearch = [
    "UI Design",
    "UI/UX Design",
    "UI Development",
    "Technology",
    "Language"
  ];
  List<String> recentSearch = [
    "Recent Search",
    "Recent Search",
    "Recent Search"
  ];

  Map<String, List> filterList = {
    "type": [],
    "expertise": [],
    "language": [],
    "category": []
  };

  Widget searchResultItem(String label, List courses,
      {bool isExpanded = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              color: textGrey2,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              height: 1.43),
        ),
        SizedBox(
          height: 4.sp,
        ),
        isExpanded
            ? Expanded(
                child: ListView(
                children: [
                  ...courses.map(
                    (courseItem) => SearchCourseListItem(
                        courseItem["courseName"],
                        courseItem["org"],
                        courseItem["difficulty"],
                        courseItem["courseLength"],
                        courseItem["preview"]),
                  )
                ],
              ))
            : SizedBox(
                height: 148.sp,
                child: Column(
                  children: [
                    ...courses.map(
                      (courseItem) => SearchCourseListItem(
                          courseItem["courseName"],
                          courseItem["org"],
                          courseItem["difficulty"],
                          courseItem["courseLength"],
                          courseItem["preview"]),
                    )
                  ],
                ),
              )
      ],
    );
  }

  Future<bool> _onWillPop() async {
    if (searchFN.hasFocus) {
      searchFN.unfocus();
      return false;
    }
    return true;
  }

  formatSuggestedSearch() {}

  @override
  void initState() {
    searchFN.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    searchFN.removeListener(() {});

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocProvider(
        create: (context) => HomeBloc(homeRepository: HomeRepository())
          ..add(SearchRequested(
              searchQuery: searchController.text, language: selectedLanguage)),
        child: Container(
          child: WillPopScope(
              onWillPop: _onWillPop,
              child: Scaffold(
                backgroundColor: secondaryColorDark,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(48.sp),
                  child: AppBar(
                    elevation: 0,
                    backgroundColor: secondaryColor,
                    leading: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          if (Navigator.canPop(context)) Navigator.pop(context);
                        },
                        child: Padding(
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
                        )),
                    leadingWidth: 40.sp,
                    title: Container(
                      height: 48.sp,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                            height: 24.sp,
                            alignment: Alignment.center,
                            child: TextField(
                              controller: searchController,
                              focusNode: searchFN,
                              cursorColor: textPrimary,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0.sp, horizontal: 0),
                                  border: InputBorder.none,
                                  isDense: true,
                                  hintText: "Search",
                                  hintStyle: TextStyle(color: neutral)),
                              style: GoogleFonts.poppins(
                                  color: textPrimary,
                                  fontSize: 16.sp,
                                  height: 1.5,
                                  decoration: TextDecoration.none),
                              onChanged: (val) {
                                setState(() {
                                  searchController.text = val;
                                  searchController.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset:
                                              searchController.text.length));
                                });
                              },
                              onSubmitted: (val) {
                                setState(() {
                                  isSearchCompleted = val.isNotEmpty;
                                });
                              },
                            ),
                          )),
                          Row(
                            children: [
                              searchFN.hasFocus &&
                                      searchController.text.isNotEmpty
                                  ? GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        setState(() {
                                          searchController.clear();
                                        });
                                      },
                                      child: AnimatedContainer(
                                        width: 24.sp,
                                        height: 48.sp,
                                        alignment: Alignment.center,
                                        duration:
                                            const Duration(milliseconds: 700),
                                        child: Image.asset(
                                          "assets/images/cross.png",
                                          width: 14.sp,
                                          height: 14.sp,
                                          color: textPrimary,
                                        ),
                                      ))
                                  : GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        filterBottomSheet(
                                            context,
                                            height - 40.sp,
                                            width,
                                            filterList, () {
                                          Navigator.pop(context);
                                        }, () {
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: AnimatedContainer(
                                        width: 24.sp,
                                        height: 48.sp,
                                        alignment: Alignment.center,
                                        duration:
                                            const Duration(milliseconds: 700),
                                        child: Image.asset(
                                          "assets/images/filter.png",
                                          width: 18.sp,
                                          height: 12.sp,
                                          color: textPrimary,
                                        ),
                                      )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                body: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(
                            left: 20.sp, right: 20.sp, top: 12.sp),
                        child: !isSearchCompleted
                            ? searchResultItem("Suggested Courses", courseItems,
                                isExpanded: true)
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                        text: "Showing results for",
                                        style: TextStyle(
                                            color: textGrey2,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            height: 1.43),
                                        children: [
                                          TextSpan(
                                            text:
                                                " \"${searchController.text}\"",
                                            style: TextStyle(
                                                color: textPrimary,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                height: 1.43),
                                          )
                                        ]),
                                  ),
                                  SizedBox(
                                    height: 8.sp,
                                  ),
                                  Expanded(
                                      child: ListView(
                                    children: [
                                      searchResultItem("Self paced",
                                          courseItems.sublist(0, 2)),

                                      SizedBox(
                                        height: 8.sp,
                                      ),
                                      Divider(
                                        color: lightGrey,
                                        height: 1.sp,
                                        thickness: 1.sp,
                                      ),
                                      //Classroom
                                      SizedBox(
                                        height: 8.sp,
                                      ),
                                      searchResultItem("Classroom",
                                          courseItems.sublist(0, 2)),
                                      SizedBox(
                                        height: 8.sp,
                                      ),
                                      Divider(
                                        color: lightGrey,
                                        height: 1.sp,
                                        thickness: 1.sp,
                                      ),
                                      //Exams
                                      SizedBox(
                                        height: 8.sp,
                                      ),
                                      searchResultItem(
                                          "Exams", courseItems.sublist(0, 2)),
                                      SizedBox(
                                        height: 8.sp,
                                      ),
                                      Divider(
                                        color: lightGrey,
                                        height: 1.sp,
                                        thickness: 1.sp,
                                      ),
                                      //Labs
                                      SizedBox(
                                        height: 8.sp,
                                      ),
                                      searchResultItem(
                                          "Labs", courseItems.sublist(0, 2)),
                                      SizedBox(
                                        height: 8.sp,
                                      ),
                                      Divider(
                                        color: lightGrey,
                                        height: 1.sp,
                                        thickness: 1.sp,
                                      ),
                                      //Bookmarks
                                      SizedBox(
                                        height: 8.sp,
                                      ),

                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Bookmarks",
                                            style: TextStyle(
                                                color: textGrey2,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                height: 1.43),
                                          ),
                                          SizedBox(
                                            height: 4.sp,
                                          ),
                                          Column(
                                            children: [
                                              ...courseItems.sublist(0, 2).map(
                                                    (courseItem) =>
                                                        BookmarkListItem(
                                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
                                                            "04:57",
                                                            courseItem[
                                                                "preview"]),
                                                  )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.sp,
                                      ),
                                      Divider(
                                        color: lightGrey,
                                        height: 1.sp,
                                        thickness: 1.sp,
                                      ),
                                      SizedBox(
                                        height: 8.sp,
                                      ),
                                    ],
                                  ))
                                ],
                              )),
                    if (searchFN.hasFocus)
                      GestureDetector(
                          onTap: () {
                            searchFN.unfocus();
                          },
                          child: AnimatedContainer(
                            color: Colors.black.withOpacity(0.74),
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.bounceIn,
                            child: Column(
                              children: [
                                ...searchController.text.isNotEmpty
                                    ? [
                                        ...suggestedSearch
                                            .where((element) => element
                                                        .length >=
                                                    searchController.text.length
                                                ? element
                                                        .substring(
                                                            0,
                                                            searchController
                                                                .text.length)
                                                        .toLowerCase() ==
                                                    searchController.text
                                                        .toLowerCase()
                                                : false)
                                            .toList()
                                      ].map((item) => GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            searchController.text = item;
                                            isSearchCompleted = true;
                                            searchFN.unfocus();
                                          });
                                        },
                                        child: Container(
                                          height: 48.sp,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: secondaryColor,
                                              border: Border.all(
                                                  color: secondaryColor,
                                                  width: 0)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 56.sp,
                                              ),
                                              Text.rich(TextSpan(
                                                text: item.substring(
                                                    0,
                                                    searchController
                                                        .text.length),
                                                children: [
                                                  TextSpan(
                                                      text: item.substring(
                                                          searchController
                                                              .text.length),
                                                      style: TextStyle(
                                                          color: neutral,
                                                          fontSize: 14.sp,
                                                          height: 1.43))
                                                ],
                                                style: TextStyle(
                                                    color: textPrimary,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.43),
                                              ))
                                            ],
                                          ),
                                        )))
                                    : [...recentSearch].map(
                                        (item) => GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                searchController.text = item;
                                                isSearchCompleted = true;
                                                searchFN.unfocus();
                                              });
                                            },
                                            child: Container(
                                              height: 48.sp,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: secondaryColor,
                                                  border: Border.all(
                                                      color: secondaryColor,
                                                      width: 0)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 16.sp,
                                                  ),
                                                  Container(
                                                    width: 24.sp,
                                                    height: 24.sp,
                                                    alignment: Alignment.center,
                                                    child: Image.asset(
                                                      "assets/images/clock.png",
                                                      width: 20.sp,
                                                      height: 20.sp,
                                                      color: neutral,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 16.sp,
                                                  ),
                                                  Text(
                                                    item,
                                                    style: TextStyle(
                                                        color: textPrimary,
                                                        fontSize: 14.sp,
                                                        height: 1.43),
                                                  )
                                                ],
                                              ),
                                            )),
                                      )
                              ],
                            ),
                          ))
                  ],
                ),
              )),
        ));
  }
}
