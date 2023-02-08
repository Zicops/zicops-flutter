import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:zicops/views/screens/account_setup/models/category.dart';
import 'package:zicops/views/screens/home/home.dart';
import 'package:zicops/controllers/mutation_controller.dart';
import '../../../graphql_api.graphql.dart';
import '../../../main.dart';
import '../../../models/user/user_account_profile_pref.dart';
import '../../../models/user/user_details_model.dart';
import '../../../utils/colors.dart';

class PreferencesTabScreen extends StatefulWidget {
  const PreferencesTabScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PreferencesTabScreen();
  }
}

class _PreferencesTabScreen extends State<PreferencesTabScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _searchController = TextEditingController();
  late final PanelController _panelController;
  bool openSubCatModal = false;

  List<Category> categories = [
    // Category(0, "Finance & Accounting", null),
    // Category(1, "Design", null),
    // Category(2, "Technology", null),
    // Category(3, "Architecture", null),
    // Category(4, "Project Management", null),
    // Category(5, "Soft Skills", null),
    // Category(6, "Language", null)
  ];
  List<Category> subCategories = [
    // Category(50, "UX Design", 1),
    // Category(51, "Graphics Design", 1),
    // Category(52, "Mobile Design", 1),
    // Category(53, "App Design", 1),
    // Category(54, "Technology Design", 2),
    // Category(55, "Technology UX", 2),
    // Category(56, " Architecture Design", 3),
    // Category(57, "English", 6),
    // Category(58, "German", 6),
    // Category(59, "French", 6),
  ];

  List<String> filter = [];
  List<Category> filteredCategories = [];
  String selectedCategories = '-1';
  List<Category> selectedSubCategories = [];

  List<AllCatMainModel> catMainList = [];
  List<SubCatMainModel> subCatMainList = [];

  String userId = '';
  String? lspId = '';
  String? userLspId = '';

  Future catSubCatLoading() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonDetails =
        jsonDecode(sharedPreferences.getString('user')!);
    var user = UserDetailsModel.fromJson(jsonDetails);
    if (jsonDetails.isNotEmpty) {
      setState(() {
        userId = user.id!;
      });
    }
    lspId = sharedPreferences.getString('lspId');
    userLspId = sharedPreferences.getString('userLspId');
    print('lspId: $lspId');

    //All Cat Details

    final allCatMainResult = await courseQClient.client()?.execute(
        AllCatMainQuery(
            variables: AllCatMainArguments(
                lsp_ids: ['8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1'])));

    for (int i in allCatMainResult?.data?.allCatMain!.asMap().keys ?? []) {
      setState(() {
        catMainList.add(
          AllCatMainModel(
            allCatMainResult?.data?.allCatMain![i]?.id,
            allCatMainResult?.data?.allCatMain![i]?.name,
            allCatMainResult?.data?.allCatMain![i]?.description,
            allCatMainResult?.data?.allCatMain![i]?.imageUrl,
            allCatMainResult?.data?.allCatMain![i]?.code,
            allCatMainResult?.data?.allCatMain![i]?.createdAt,
            allCatMainResult?.data?.allCatMain![i]?.updatedAt,
            allCatMainResult?.data?.allCatMain![i]?.isActive,
          ),
        );
      });
      i++;
    }
    for (int i = 0; i < catMainList.length; i++) {
      categories.add(
        Category(
          catMainList[i].id!,
          catMainList[i].name!,
          i.toString(),
        ),
      );
    }
    print(categories.length);

    final subCatMainResult = await courseQClient.client()?.execute(
        AllSubCatMainQuery(
            variables: AllSubCatMainArguments(
                lsp_ids: ['8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1'])));
    for (int i in subCatMainResult?.data?.allSubCatMain!.asMap().keys ?? []) {
      setState(() {
        subCatMainList.add(
          SubCatMainModel(
            subCatMainResult?.data?.allSubCatMain![i]?.catId,
            subCatMainResult?.data?.allSubCatMain![i]?.id,
            subCatMainResult?.data?.allSubCatMain![i]?.name,
            subCatMainResult?.data?.allSubCatMain![i]?.description,
            subCatMainResult?.data?.allSubCatMain![i]?.imageUrl,
            subCatMainResult?.data?.allSubCatMain![i]?.code,
            subCatMainResult?.data?.allSubCatMain![i]?.createdAt,
            subCatMainResult?.data?.allSubCatMain![i]?.updatedAt,
            subCatMainResult?.data?.allSubCatMain![i]?.isActive,
          ),
        );
      });
      i++;
    }

    for (int i = 0; i < subCatMainList.length; i++) {
      subCategories.add(
        Category(
          i.toString(),
          subCatMainList[i].name!,
          subCatMainList[i].catId,
        ),
      );
    }
  }

  updateSelectCategory(String? id) {
    selectedCategories = id!;
  }

  updateFilterCategory(String? id) {
    if (filter.contains(id)) {
      filter.remove(id);
    } else {
      filter.add(id!);
    }
  }

  updateSelectSubCategory(Category cat) {
    if (selectedSubCategories.contains(cat)) {
      selectedSubCategories.remove(cat);
    } else {
      selectedSubCategories.add(cat);
    }
  }

  checkIfSelectedFilter(String? id) {
    return filter.contains(id);
  }

  checkIfSelectedSubCat(Category cat) {
    return selectedSubCategories.contains(cat);
  }

  setFilteredCategories() {
    filteredCategories =
        categories.where((cat) => filter.contains(cat.id)).toList();
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
    filteredCategories = categories;
    catSubCatLoading();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
          key: _scaffoldKey,
          body: SlidingUpPanel(
              minHeight: isKeyboardVisible ? 0 : 165.sp,
              maxHeight: isKeyboardVisible
                  ? 0
                  : selectedCategories != -1
                      ? height * 0.65
                      : 165.sp,
              color: Colors.transparent,
              controller: _panelController,
              backdropEnabled: openSubCatModal,
              onPanelOpened: () {
                setState(() {
                  openSubCatModal = true;
                });
              },
              onPanelClosed: () {
                setState(() {
                  openSubCatModal = false;
                });
              },
              panel: Container(
                  padding:
                      EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 40.sp),
                  decoration: BoxDecoration(
                      color: secondaryColorDark,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                      border: Border.all(color: lightGrey)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 4.sp,
                        width: 36,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 8.sp, bottom: 16.sp),
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(4.sp)),
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              _panelController.isPanelOpen
                                  ? _panelController.close()
                                  : _panelController.open();
                            });
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Selected Sub-Categories",
                                      style: TextStyle(
                                          color: textPrimary,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Select ${5 - selectedSubCategories.length > 0 ? 5 - selectedSubCategories.length : ""} more sub categories(${selectedSubCategories.length})",
                                      style: TextStyle(
                                          color: const Color(0xFF919191),
                                          fontSize: 14.sp),
                                    )
                                  ],
                                ),
                                openSubCatModal
                                    ? Container(
                                        height: 24.sp,
                                        width: 24.sp,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6.sp, vertical: 8.sp),
                                        child: Image.asset(
                                          "assets/images/up_arrow.png",
                                        ))
                                    : Container(
                                        height: 24.sp,
                                        width: 24.sp,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6.sp, vertical: 8.sp),
                                        child: Image.asset(
                                          "assets/images/down_arrow.png",
                                        )),
                              ])),
                      openSubCatModal && selectedCategories != -1
                          ? Flexible(
                              child: ListView(
                              children: [
                                SizedBox(
                                  height: 16.sp,
                                ),
                                ...selectedSubCategories.map((cat) => SizedBox(
                                    height: 48.sp,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          cat.category.toString(),
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: checkIfSelectedSubCat(cat)
                                                  ? textPrimary
                                                  : textGrey),
                                        ),
                                        Container(
                                            width: 24.sp,
                                            height: 24.sp,
                                            padding: EdgeInsets.all(3.sp),
                                            child: Checkbox(
                                                activeColor: primaryColor,
                                                side: BorderSide(
                                                    color: textPrimary,
                                                    width: 2.sp),
                                                checkColor: Colors.black,
                                                value:
                                                    checkIfSelectedSubCat(cat),
                                                onChanged: (val) {
                                                  setState(() {
                                                    setState(() {
                                                      updateSelectSubCategory(
                                                          cat);
                                                    });
                                                  });
                                                }))
                                      ],
                                    )))
                              ],
                            ))
                          : const SizedBox.shrink(),
                      SizedBox(
                        height: 24.sp,
                      ),
                    ],
                  )),
              footer: Container(
                  width: width - 40.sp,
                  color: secondaryColorDark,
                  padding: EdgeInsets.only(bottom: 20.sp),
                  margin: EdgeInsets.symmetric(horizontal: 20.sp),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      selectedSubCategories.length >= 5
                          ? Expanded(
                              child: InkWell(
                              onTap: () {
                                addUserPreference(userId, userLspId,
                                    selectedSubCategories[0].category, true);
                                for (int i = 1;
                                    i < selectedSubCategories.length;
                                    i++) {
                                  print(selectedSubCategories[i].category);
                                  addUserPreference(userId, userLspId,
                                      selectedSubCategories[i].category, false);
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
                                      gradient: const LinearGradient(
                                          colors: [primaryColor, gradientTwo]),
                                      borderRadius:
                                          BorderRadius.circular(4.sp)),
                                  child: Text(
                                    'Save'.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        letterSpacing: 2,
                                        height: 1.72),
                                  ),
                                ),
                              ),
                            ))
                          : Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _panelController.open();
                                    });
                                  },
                                  child: Container(
                                      height: 48.sp,
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(right: 12),
                                      decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(4.sp)),
                                      child: Text(
                                        "Select Sub-Category".toUpperCase(),
                                        style: GoogleFonts.poppins(
                                            fontSize: 14.sp,
                                            color: const Color(0xFF919191),
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 2,
                                            height: 1.72),
                                      ))),
                            ),
                    ],
                  )),
              body: CustomScrollView(slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: secondaryColorDark,
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
                                                                              cat.category.toString().toUpperCase(),
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
                                    filteredCategories = categories
                                        .where((cat) => cat.category
                                            .toString()
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
                            "Categories".toUpperCase(),
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: textGrey,
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
                              ...filteredCategories.map(
                                (cat) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        updateSelectCategory(cat.id);
                                      });
                                    },
                                    child: Container(
                                        height: 40.sp,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.sp, vertical: 12.sp),
                                        margin:
                                            const EdgeInsets.only(right: 12),
                                        decoration: BoxDecoration(
                                            color: selectedCategories == cat.id
                                                ? primaryColor
                                                : secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(2.sp)),
                                        child: Text(
                                          cat.category.toString().toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              color:
                                                  selectedCategories == cat.id
                                                      ? secondaryColorDark
                                                      : textPrimary,
                                              fontWeight: FontWeight.w600,
                                              height: 1.14,
                                              letterSpacing: 2),
                                        ))),
                              ),
                            ],
                          ),
                        ),
                        selectedCategories != -1
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.sp, vertical: 12.sp),
                                child: Text(
                                  "Sub-Categories".toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: textGrey,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                      height: 1.34),
                                ),
                              )
                            : const Text(""),
                        selectedCategories != -1
                            ? Padding(
                                padding: EdgeInsets.only(
                                    left: 20.sp, right: 20.sp, bottom: 385.sp),
                                child: Wrap(
                                  spacing: 0,
                                  runSpacing: 12,
                                  children: [
                                    ...subCategories
                                        .where((element) =>
                                            element.parentCategory ==
                                            selectedCategories)
                                        .map(
                                          (cat) => GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  updateSelectSubCategory(cat);
                                                });
                                              },
                                              child: Container(
                                                  height: 40.sp,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 12.sp),
                                                  margin: const EdgeInsets.only(
                                                      right: 12),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color:
                                                            selectedSubCategories
                                                                    .contains(
                                                                        cat)
                                                                ? primaryColor
                                                                : textGrey,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2)),
                                                  child: Text(
                                                    cat.category
                                                        .toString()
                                                        .toUpperCase(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color:
                                                            selectedSubCategories
                                                                    .contains(
                                                                        cat)
                                                                ? textPrimary
                                                                : textGrey,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 1.14,
                                                        letterSpacing: 2),
                                                  ))),
                                        ),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                      ]),
                )
              ])));
    });
  }
}
