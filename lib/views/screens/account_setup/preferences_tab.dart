import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:zicops/views/screens/account_setup/models/category.dart';
import 'package:zicops/views/screens/home/home.dart';

import '../../../graphql_api.graphql.dart';
import '../../../main.dart';
import '../../../models/user/user_account_profile_pref.dart';
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
  bool isLoading = false;

  List<AllCatMainModel> catMainList = [];

  HashMap<String, String> catSubCatMap = HashMap<String, String>();

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
    // Category(54, "Interactive Design", 1),
  ];
  List<Category> roughWork = [];

  //Map catSubCatMap = {};

  Future catMainLoading() async {
    setState(() {
      isLoading = true;
    });
    final allCatMainResult = await courseQClient.client()?.execute(
        AllCatMainQuery(
            variables: AllCatMainArguments(
                lsp_ids: ['8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1'])));

    //print(result?.data?.allCatMain![4]?.name);

    //display subcategories for every category

    // final subCatMainResult = await courseQClient.client()?.execute(
    //     AllSubCatByCatIdQuery(
    //         variables: AllSubCatByCatIdArguments(
    //             catId: allCatMainResult?.data?.allCatMain![0]?.id)));
    // print(subCatMainResult?.data?.allSubCatByCatId?.);

    // for (int e in subCatMainResult?.data?.allSubCatMain!.asMap().keys ?? []) {
    //   print(subCatMainResult?.data?.allSubCatMain![e]?.catId);
    // }

    // AllCatMainModel allCatMainModel = AllCatMainModel(
    //   allCatMainResult?.data?.allCatMain![0]?.id,
    //   allCatMainResult?.data?.allCatMain![0]?.name,
    //   allCatMainResult?.data?.allCatMain![0]?.description,
    //   allCatMainResult?.data?.allCatMain![0]?.imageUrl,
    //   allCatMainResult?.data?.allCatMain![0]?.code,
    //   allCatMainResult?.data?.allCatMain![0]?.createdAt,
    //   allCatMainResult?.data?.allCatMain![0]?.updatedAt,
    //   allCatMainResult?.data?.allCatMain![0]?.isActive,
    // );

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

      // print(catMainList[i]?.name);
      i++;
    }

//    print(catMainList.length);

    for (int i = 0; i < catMainList.length; i++) {
      categories.add(
        Category(
          i,
          catMainList[i].name!,
          catMainList[i].id,
        ),
      );
      //   print(catMainList[i].name);
    }

    // for (int i = 0; i < categories.length; i++) {
    //   final subCatMainResult = await courseQClient.client()?.execute(
    //       AllSubCatByCatIdQuery(
    //           variables: AllSubCatByCatIdArguments(
    //               catId: categories[i].id.toString())));
    //   List<SubCatMainModel> subCatMainList = [];
    //   for (int j
    //       in subCatMainResult?.data?.allSubCatByCatId!.asMap().keys ?? []) {
    //     subCatMainList.add(
    //       SubCatMainModel(
    //         subCatMainResult?.data?.allSubCatByCatId![j]?.catId,
    //         subCatMainResult?.data?.allSubCatByCatId![j]?.id,
    //         subCatMainResult?.data?.allSubCatByCatId![j]?.name,
    //         subCatMainResult?.data?.allSubCatByCatId![j]?.description,
    //         subCatMainResult?.data?.allSubCatByCatId![j]?.imageUrl,
    //         subCatMainResult?.data?.allSubCatByCatId![j]?.code,
    //         subCatMainResult?.data?.allSubCatByCatId![j]?.createdAt,
    //         subCatMainResult?.data?.allSubCatByCatId![j]?.updatedAt,
    //         subCatMainResult?.data?.allSubCatByCatId![j]?.isActive,
    //       ),
    //     );
    //   }
    //   catSubCatMap[categories[i].id.toString()] = subCatMainList;
    // }

    final subCatMainResult = await courseQClient.client()?.execute(
        AllSubCatMainQuery(
            variables: AllSubCatMainArguments(
                lsp_ids: ['8ca0d540-aebc-5cb9-b7e0-a2f400b0e0c1'])));

    //add all subcat to list
    for (int i in subCatMainResult?.data?.allSubCatMain!.asMap().keys ?? []) {
      roughWork.add(Category(i, subCatMainResult?.data?.allSubCatMain![i]?.name,
          subCatMainResult?.data?.allSubCatMain![i]?.id));
    }

    for (int i = 0; i < catMainList.length; i++) {
      List<SubCatMainModel> subCatMainList = [];
      for (int j in subCatMainResult?.data?.allSubCatMain!.asMap().keys ?? []) {
        if (catMainList[i].id ==
            subCatMainResult?.data?.allSubCatMain![j]!.catId) {
          subCategories.add(Category(
              j,
              subCatMainResult?.data?.allSubCatMain![j]?.name,
              subCatMainResult?.data?.allSubCatMain![j]?.id));
          subCatMainList.add(SubCatMainModel(
            subCatMainResult?.data?.allSubCatMain![j]?.catId,
            subCatMainResult?.data?.allSubCatMain![j]?.id,
            subCatMainResult?.data?.allSubCatMain![j]?.name,
            subCatMainResult?.data?.allSubCatMain![j]?.description,
            subCatMainResult?.data?.allSubCatMain![j]?.imageUrl,
            subCatMainResult?.data?.allSubCatMain![j]?.code,
            subCatMainResult?.data?.allSubCatMain![j]?.createdAt,
            subCatMainResult?.data?.allSubCatMain![j]?.updatedAt,
            subCatMainResult?.data?.allSubCatMain![j]?.isActive,
          ));
        }
      }
      String subCat = jsonEncode(subCatMainList);
      catSubCatMap[catMainList[i].id.toString()] = subCat;
      //subCategories = getSubCategry(catMainList[i].id.toString());

      // subCategories.add(Category(
      //     i, subCatMainList[i].name!, subCatMainList[i].catId.toString()));
    }
    print(catSubCatMap.toString());
  }

  List<String> catIdList = [];
  List<int> filter = [];
  List<Category> filteredCategories = [];
  List<int> selectedCategories = [];
  List<String> selectedCategoriesList = [];
  List<Category> selectedSubCategories = [];

  getSubCategry(String id) {}

  updateSelectCategory(int id, double height) {
    if (selectedCategories.contains(id)) {
      selectedCategories.remove(id);
    } else {
      selectedCategories.add(id);
    }
  }

  updateSubCategoryList(String catID) {
    if (selectedCategoriesList.contains(catID)) {
      selectedCategoriesList.remove(catID);
    } else {
      selectedCategoriesList.add(catID);
    }
    setState(() {
      subCategories = [];
      for (var i = 0; i < selectedCategoriesList.length; i++) {
        print(selectedCategoriesList[i]);
        print(selectedCategoriesList);
        print(catSubCatMap[selectedCategoriesList[i].toString()]);
        var json_var =
            jsonDecode(catSubCatMap[selectedCategoriesList[i].toString()]!);
        for (int j = 0; j < json_var.length; j++) {
          subCategories.add(Category(
              j, json_var[j]['name'], json_var[j]['catId'].toString()));
        }
      }
    });
  }

  updateFilterCategory(int id) {
    print('hello filter');
    print(filter);
    if (filter.contains(id)) {
      filter.remove(id);
    } else {
      filter.add(id);
    }
  }

  updateSelectSubCategory(Category cat) {
    if (selectedSubCategories.contains(cat)) {
      selectedSubCategories.remove(cat);
    } else {
      if (selectedSubCategories.length < 5) {
        selectedSubCategories.add(cat);
      }
    }
    if (selectedSubCategories.length > 5) {
      Fluttertoast.showToast(
          msg: "No more sub-categories can be selected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }
  }

  checkIfSelectedFilter(int id) {
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
    catMainLoading();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
          key: _scaffoldKey,
          body: SlidingUpPanel(
              minHeight: isKeyboardVisible ? 0 : 165,
              maxHeight: isKeyboardVisible
                  ? 0
                  : selectedCategories.isNotEmpty
                      ? height * 0.65
                      : 165,
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
                      const EdgeInsets.only(left: 20, right: 20, bottom: 40),
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
                        height: 4,
                        width: 36,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 8, bottom: 16),
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(4)),
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
                                    const Text(
                                      "Selected Sub-Categories",
                                      style: TextStyle(
                                          color: textPrimary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Select ${5 - selectedSubCategories.length} more sub categories(${selectedSubCategories.length})",
                                      style: const TextStyle(
                                          color: textGrey, fontSize: 14),
                                    )
                                  ],
                                ),
                                openSubCatModal
                                    ? Image.asset("assets/images/up_arrow.png",
                                        width: 16, height: 16)
                                    : Image.asset(
                                        "assets/images/down_arrow.png",
                                        width: 16,
                                        height: 16,
                                      )
                              ])),
                      openSubCatModal && selectedCategories.isNotEmpty
                          ? Flexible(
                              child: ListView(
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                ...selectedSubCategories.map((cat) => Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          cat.category.toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: checkIfSelectedSubCat(cat)
                                                  ? textPrimary
                                                  : textGrey),
                                        ),
                                        Checkbox(
                                            value: checkIfSelectedSubCat(cat),
                                            onChanged: (val) {
                                              setState(() {
                                                setState(() {
                                                  updateSelectSubCategory(cat);
                                                });
                                              });
                                            })
                                      ],
                                    )))
                              ],
                            ))
                          : const Text(""),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  )),
              footer: Container(
                  width: width,
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Row(
                    children: [
                      selectedSubCategories.length == 5
                          ? Expanded(
                              child: InkWell(
                              onTap: () {
                                for (int i = 0;
                                    i < selectedSubCategories.length;
                                    i++) {
                                  print(selectedSubCategories[i].category);
                                }
                                return;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeScreen()),
                                );
                              },
                              child: Ink(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 48,
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                          colors: [primaryColor, gradientTwo]),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Text(
                                    'Save'.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        letterSpacing: 2),
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
                                      height: 48,
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(right: 12),
                                      decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Text(
                                        "Select Sub-Categories".toUpperCase(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: const Color(0xFF919191),
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 2,
                                        ),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          child: SizedBox(
                              height: 48,
                              child: TextField(
                                controller: _searchController,
                                focusNode: _focusNodes[0],
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: lightGrey),
                                        borderRadius: BorderRadius.circular(4)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: lightGrey),
                                        borderRadius: BorderRadius.circular(4)),
                                    filled: true,
                                    fillColor: secondaryColorLight,
                                    prefixIcon: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: ImageIcon(
                                          const AssetImage(
                                              "assets/images/search.png"),
                                          color: _focusNodes[0].hasFocus
                                              ? textPrimary
                                              : textGrey,
                                          size: 18,
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
                                                maxHeight: height * 0.7),
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
                                                          height: 4,
                                                          width: 36,
                                                          alignment:
                                                              Alignment.center,
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                            top: 8,
                                                            bottom: 16,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                secondaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              4,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        22),
                                                            child: const Text(
                                                              "Filter",
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyle(
                                                                  color:
                                                                      textPrimary,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            )),
                                                        Flexible(
                                                            child: ListView(
                                                          children: [
                                                            ...categories.map((cat) =>
                                                                Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            10),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          cat.category
                                                                              .toString()
                                                                              .toUpperCase(),
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w600,
                                                                              color: checkIfSelectedFilter(cat.id) ? textPrimary : textGrey),
                                                                        ),
                                                                        Checkbox(
                                                                            value:
                                                                                checkIfSelectedFilter(cat.id),
                                                                            onChanged: (val) {
                                                                              setModalState(() {
                                                                                updateFilterCategory(cat.id);
                                                                              });
                                                                            })
                                                                      ],
                                                                    )))
                                                          ],
                                                        )),
                                                        const SizedBox(
                                                          height: 20,
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
                                                                      height: 36,
                                                                      alignment: Alignment.center,
                                                                      margin: const EdgeInsets.only(right: 12),
                                                                      decoration: BoxDecoration(border: Border.all(color: lightGrey), borderRadius: BorderRadius.circular(4)),
                                                                      child: Text(
                                                                        "Reset"
                                                                            .toUpperCase(),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          fontSize:
                                                                              14,
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
                                                                height: 36,
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
                                                                          14,
                                                                      letterSpacing:
                                                                          2),
                                                                ),
                                                              ),
                                                            )),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        )
                                                      ],
                                                    ));
                                              });
                                            },
                                          );
                                        },
                                        child: Stack(
                                          children: [
                                            Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12),
                                                child: ImageIcon(
                                                  const AssetImage(
                                                      "assets/images/filter.png"),
                                                  color: _focusNodes[0].hasFocus
                                                      ? textPrimary
                                                      : textGrey,
                                                  size: 18,
                                                )),
                                            if (filter.isNotEmpty)
                                              Positioned(
                                                right: 10,
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color(
                                                              0xFFEA4040)),
                                                  width: 6,
                                                  height: 6,
                                                ),
                                              )
                                          ],
                                        )),
                                    suffixIconConstraints: const BoxConstraints(
                                        minHeight: 24, minWidth: 24),
                                    hintText: "Search Category/Sub-Category",
                                    hintStyle: const TextStyle(
                                        fontSize: 16, color: textGrey)),
                                cursorColor: textPrimary,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          child: Text(
                            "Categories".toUpperCase(),
                            style: const TextStyle(
                                fontSize: 12,
                                color: textGrey,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Wrap(
                            spacing: 0,
                            runSpacing: 12,
                            children: [
                              ...filteredCategories.map(
                                (cat) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      updateSelectCategory(cat.id, height);
                                      updateSubCategoryList(
                                          filteredCategories[cat.id]
                                              .parentCategory
                                              .toString());
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 10),
                                    margin: const EdgeInsets.only(right: 12),
                                    color: selectedCategories.contains(cat.id)
                                        ? primaryColor
                                        : secondaryColor,
                                    child: Text(
                                      cat.category.toString().toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color:
                                            selectedCategories.contains(cat.id)
                                                ? secondaryColorDark
                                                : textPrimary,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        selectedCategories.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                child: Text(
                                  "Sub-Categories".toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: textGrey,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1),
                                ),
                              )
                            : const Text(""),
                        selectedCategories.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 385),
                                child: Wrap(
                                  spacing: 0,
                                  runSpacing: 12,
                                  children: [
                                    ...subCategories.map(
                                      (cat) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              updateSelectSubCategory(cat);
                                            });
                                          },
                                          child: Container(
                                              height: 40,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 10),
                                              margin: const EdgeInsets.only(
                                                  right: 12),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                color: selectedSubCategories
                                                        .contains(cat)
                                                    ? primaryColor
                                                    : textGrey,
                                              )),
                                              child: Text(
                                                cat.category
                                                    .toString()
                                                    .toUpperCase(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: selectedSubCategories
                                                            .contains(cat)
                                                        ? textPrimary
                                                        : textGrey,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 2),
                                              ))),
                                    ),
                                  ],
                                ),
                              )
                            : const Text(""),
                      ]),
                )
              ])));
    });
  }
}
