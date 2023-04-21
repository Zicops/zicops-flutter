import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:zicops/views/screens/account_setup/models/category.dart';

import '../../../controllers/mutation_controller.dart';
import '../../../utils/colors.dart';
import '../home/home.dart';

class PrimarySubCategoryScreen extends StatefulWidget {
  final List<Category> subCategories;
  //final List<Category> categories;
  const PrimarySubCategoryScreen(this.subCategories, {Key? key})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _PrimarySubCategoryScreen();
  }
}

class _PrimarySubCategoryScreen extends State<PrimarySubCategoryScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _searchController = TextEditingController();
  late final PanelController _panelController;

  List<Category> categories = [
    // Category(0, "Finance & Accounting", '0'),
    // Category(1, "Design", '1'),
    // Category(2, "Technology", '2'),
    // Category(3, "Architecture", '3'),
    // Category(4, "Project Management", '4'),
    // Category(5, "Soft Skills", '5'),
    // Category(6, "Language", '6'),
  ];

  // List<Category> subCategories = [
  //   Category(50, "UX Design", 1),
  //   Category(51, "Graphics Design", 1),
  //   Category(52, "Mobile Design", 1),
  //   Category(53, "App Design", 1),
  //   Category(54, "Technology Design", 2),
  //   Category(55, "Technology UX", 2),
  //   Category(56, " Architecture Design", 3),
  //   Category(57, "English", 6),
  //   Category(58, "German", 6),
  //   Category(59, "French", 6),
  // ];

  String? userId = '';
  String? userLspId = '';

  Future getUserIdAndUserLspId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString('userId');
    userLspId = sharedPreferences.getString('userLspId');
    return [userId, userLspId];
  }

  List<int> filter = [];
  List<Category> filteredSubCategories = [];
  List<Category> filteredCategories = [];
  int selectedSubCategory = -1;
  String selectedPrimarySubCat = '';

  updateFilterCategory(int id) {
    if (filter.contains(id)) {
      filter.remove(id);
    } else {
      filter.add(id);
    }
  }

  checkIfSelectedFilter(int id) {
    return filter.contains(id);
  }

  setFilteredCategories() {
    filteredSubCategories =
        widget.subCategories.where((cat) => filter.contains(cat.id)).toList();
  }

  final List<FocusNode> _focusNodes = [FocusNode()];

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.removeListener(() {});
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    _panelController = PanelController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // showModal(500);
    });
    filteredSubCategories = widget.subCategories;
    getUserIdAndUserLspId();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
          key: _scaffoldKey,
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
                child: Text("Select primary sub-category",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: textPrimary)),
              ),
            ),
          ),
          body: SlidingUpPanel(
              minHeight: 88.sp,
              maxHeight: 88.sp,
              color: Colors.transparent,
              controller: _panelController,
              panel: Container(
                  padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                      border: Border.all(color: lightGrey)),
                  child: InkWell(
                    onTap: () {
                      for (int i = 0; i < widget.subCategories.length; i++) {
                        if (widget.subCategories[i].category.toLowerCase() ==
                            selectedPrimarySubCat.toLowerCase()) {
                          addUserPreference(userId!, userLspId,
                              widget.subCategories[i].category, true);
                        } else {
                          addUserPreference(userId!, userLspId,
                              widget.subCategories[i].category, false);
                        }
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                    child: Ink(
                      child: Container(
                        alignment: Alignment.center,
                        height: 48.sp,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: selectedSubCategory != -1
                                    ? Colors.transparent
                                    : lightGrey),
                            gradient: selectedSubCategory != -1
                                ? const LinearGradient(
                                    colors: [primaryColor, gradientTwo])
                                : const LinearGradient(
                                    colors: [secondaryColor, secondaryColor]),
                            borderRadius: BorderRadius.circular(4.sp)),
                        child: Text(
                          'Save'.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: selectedSubCategory != -1
                                  ? secondaryColor
                                  : textGrey2,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              letterSpacing: 2,
                              height: 1.72),
                        ),
                      ),
                    ),
                  )),
              body: CustomScrollView(slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: secondaryColor,
                          padding: EdgeInsets.only(
                              left: 20.sp,
                              right: 20.sp,
                              top: 8.sp,
                              bottom: 16.sp),
                          child: SizedBox(
                              height: 48.sp,
                              child: TextField(
                                controller: _searchController,
                                focusNode: _focusNodes[0],
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                _focusNodes[0].hasFocus || _searchController.text.isNotEmpty
                                                    ? secondaryColorDarkOutline
                                                    : lightGrey),
                                        borderRadius:
                                            BorderRadius.circular(4.sp)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: lightGrey),
                                        borderRadius:
                                            BorderRadius.circular(4.sp)),
                                    filled: true,
                                    fillColor: _focusNodes[0].hasFocus
                                        ? secondaryColorDark
                                        : secondaryColorLight,
                                    prefixIcon: Container(
                                        width: 24.sp,
                                        height: 24.sp,
                                        margin: EdgeInsets.only(
                                            top: 12.sp,
                                            bottom: 12.sp,
                                            left: 16.sp,
                                            right: 12.sp),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.5.sp,
                                            vertical: 3.5.sp),
                                        child: Image.asset(
                                          "assets/images/search.png",
                                          color: _focusNodes[0].hasFocus
                                              ? textPrimary
                                              : textGrey,
                                        )),
                                    prefixIconConstraints: const BoxConstraints(
                                        minHeight: 24, minWidth: 24),
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet<void>(
                                            // context and builder are
                                            // required properties in this widget
                                            context: context,
                                            backgroundColor: secondaryColorDark,
                                            shape: const RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: lightGrey),
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(16),
                                                    topLeft:
                                                        Radius.circular(16))),
                                            constraints: BoxConstraints(
                                                maxHeight: 474.sp),
                                            isScrollControlled: true,

                                            builder: (BuildContext context) {
                                              return StatefulBuilder(builder:
                                                  (BuildContext context,
                                                      StateSetter
                                                          setModalState) {
                                                return Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          height: 4.sp,
                                                          width: 36.sp,
                                                          alignment:
                                                              Alignment.center,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 8.sp,
                                                                  bottom:
                                                                      16.sp),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  secondaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4)),
                                                        ),
                                                        Container(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              "Filter",
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyle(
                                                                  color:
                                                                      textPrimary,
                                                                  fontSize:
                                                                      18.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            )),
                                                        SizedBox(
                                                          height: 15.sp,
                                                        ),
                                                        Flexible(
                                                            child: ListView(
                                                          children: [
                                                            ...categories.map(
                                                                (cat) =>
                                                                    SizedBox(
                                                                        height: 48
                                                                            .sp,
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              cat.category!.toUpperCase(),
                                                                              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, height: 1.33, letterSpacing: 1, color: checkIfSelectedFilter(cat.id) ? textPrimary : textGrey2),
                                                                            ),
                                                                            Container(
                                                                                width: 24.sp,
                                                                                height: 24.sp,
                                                                                padding: EdgeInsets.all(3.sp),
                                                                                child: Checkbox(
                                                                                    activeColor: primaryColor,
                                                                                    side: BorderSide(color: textPrimary, width: 2.sp),
                                                                                    checkColor: Colors.black,
                                                                                    value: checkIfSelectedFilter(cat.id),
                                                                                    onChanged: (val) {
                                                                                      setModalState(() {
                                                                                        updateFilterCategory(cat.id);
                                                                                      });
                                                                                    }))
                                                                          ],
                                                                        )))
                                                          ],
                                                        )),
                                                        SizedBox(
                                                          height: 20.sp,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      filteredCategories =
                                                                          categories;
                                                                    });
                                                                    setModalState(
                                                                        () {
                                                                      filter =
                                                                          [];
                                                                    });
                                                                  },
                                                                  child: Container(
                                                                      height: 36.sp,
                                                                      alignment: Alignment.center,
                                                                      margin: const EdgeInsets.only(right: 12),
                                                                      decoration: BoxDecoration(border: Border.all(color: lightGrey), borderRadius: BorderRadius.circular(4.sp)),
                                                                      child: Text(
                                                                        "Reset"
                                                                            .toUpperCase(),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          fontSize:
                                                                              14.sp,
                                                                          color:
                                                                              primaryColor,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          letterSpacing:
                                                                              2,
                                                                        ),
                                                                      ))),
                                                            ),
                                                            Expanded(
                                                                child: InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  setFilteredCategories();
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                height: 36.sp,
                                                                decoration: BoxDecoration(
                                                                    gradient:
                                                                        const LinearGradient(
                                                                            colors: [
                                                                          primaryColor,
                                                                          gradientTwo
                                                                        ]),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4)),
                                                                child: Text(
                                                                  'Apply'
                                                                      .toUpperCase(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: GoogleFonts.poppins(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          14.sp,
                                                                      letterSpacing:
                                                                          2),
                                                                ),
                                                              ),
                                                            )),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 20.sp,
                                                        )
                                                      ],
                                                    ));
                                              });
                                            },
                                          );
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                                width: 24.sp,
                                                height: 24.sp,
                                                margin: EdgeInsets.only(
                                                    top: 12.sp,
                                                    bottom: 12.sp,
                                                    left: 16,
                                                    right: 12),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 3.5.sp,
                                                    vertical: 3.5.sp),
                                                child: Image.asset(
                                                  "assets/images/filter.png",
                                                  color: _focusNodes[0].hasFocus
                                                      ? textPrimary
                                                      : textGrey,
                                                )),
                                            if (filter.isNotEmpty &&
                                                filteredCategories.length !=
                                                    categories.length)
                                              Positioned(
                                                right: 10.sp,
                                                top: 15.sp,
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color(
                                                              0xFFEA4040)),
                                                  width: 6.sp,
                                                  height: 6.sp,
                                                ),
                                              )
                                          ],
                                        )),
                                    suffixIconConstraints: const BoxConstraints(
                                        minHeight: 24, minWidth: 24),
                                    hintText: "Search Category/Sub-Category",
                                    hintStyle: GoogleFonts.poppins(
                                        fontSize: 16.sp,
                                        color: textGrey,
                                        height: 1.5)),
                                cursorColor: textPrimary,
                                style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    color: textGrey,
                                    height: 1.5),
                                onChanged: (val) {
                                  setState(() {
                                    filteredSubCategories = widget.subCategories
                                        .where((cat) => cat.category!
                                            .toLowerCase()
                                            .contains(val.toLowerCase()))
                                        .toList();
                                  });
                                },
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.sp, vertical: 12.sp),
                          child: Text(
                            "selected sub-categories".toUpperCase(),
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: textGrey2,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                height: 1.34),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.sp),
                          child: Wrap(
                            spacing: 0,
                            runSpacing: 12,
                            children: [
                              ...filteredSubCategories.map(
                                (cat) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedSubCategory = cat.id;
                                        selectedPrimarySubCat = cat.category;
                                      });
                                    },
                                    child: Container(
                                        height: 40.sp,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.sp, vertical: 12.sp),
                                        margin:
                                            const EdgeInsets.only(right: 12),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: selectedSubCategory ==
                                                        cat.id
                                                    ? primaryColor
                                                    : lightGrey),
                                            borderRadius:
                                                BorderRadius.circular(2.sp)),
                                        child: Text(
                                          cat.category!.toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              color:
                                                  selectedSubCategory == cat.id
                                                      ? primaryColor
                                                      : textPrimary,
                                              fontWeight: FontWeight.w600,
                                              height: 1.14,
                                              letterSpacing: 2),
                                        ))),
                              ),
                            ],
                          ),
                        ),
                      ]),
                )
              ])));
    });
  }
}
