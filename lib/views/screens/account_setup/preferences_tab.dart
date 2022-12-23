import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zicops/views/screens/account_setup/models/category.dart';
import 'package:zicops/views/screens/home/home.dart';

import '../../../utils/colors.dart';

class PreferencesTabScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PreferencesTabScreen();
  }
}

class _PreferencesTabScreen extends State<PreferencesTabScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Category> categories = [
    Category(0, "Finance & Accounting", null),
    Category(1, "Design", null),
    Category(2, "Technology", null),
    Category(3, "Architecture", null),
    Category(4, "Project Management", null),
    Category(5, "Soft Skills", null),
    Category(6, "Language", null)
  ];
  List<Category> subCategories = [
    Category(50, "UX Design", 1),
    Category(51, "Graphics Design", 1),
    Category(52, "Mobile Design", 1),
    Category(53, "App Design", 1),
    Category(54, "Interactive Design", 1),
  ];

  List<int> filter = [];
  List<Category> filteredCategories = [];
  List<int> selectedCategories = [];
  List<Category> selectedSubCategories = [];

  bool openSubCatModal = false;

  final TextEditingController _searchController = TextEditingController();

  updateSelectCategory(int id, double height) {
    if (selectedCategories.contains(id)) {
      selectedCategories.remove(id);
    } else {
      selectedCategories.add(id);
    }
    showModal(height);
  }

  updateFilterCategory(int id) {
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

  showModal(double height){
    if (selectedCategories.isNotEmpty) {
      showModalBottomSheet<void>(
        // context and builder are
        // required properties in this widget
        context: context,
        backgroundColor: secondaryColorDark,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: lightGrey),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16))),

        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
                return Container(
                    height: openSubCatModal ? height * 0.8 : 185,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                              setModalState(() {
                                openSubCatModal = !openSubCatModal;
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
                        openSubCatModal
                            ? Flexible(
                            child: ListView(
                              children: [
                                const SizedBox(
                                  height: 26,
                                ),
                                ...subCategories.map((cat) => Padding(
                                    padding: const EdgeInsets.only(bottom: 35),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          cat.category,
                                          style:  TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: checkIfSelectedSubCat(cat)?textPrimary:textGrey),
                                        ),
                                        Checkbox(
                                            value: checkIfSelectedSubCat(cat),
                                            onChanged: (val) {
                                              setState(() {
                                                setModalState(() {
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
                          height: 20,
                        ),
                        Row(
                          children: [
                            selectedSubCategories.length == 5
                                ? Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const HomeScreen()),
                                    );
                                  },
                                  child: Ink(
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(colors: [
                                            primaryColor,
                                            gradientTwo
                                          ]),
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
                                    setModalState(() {
                                      openSubCatModal = true;
                                    });
                                  },
                                  child: Container(
                                      height: 48,
                                      alignment: Alignment.center,
                                      margin:
                                      const EdgeInsets.only(right: 12),
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
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ));
              });
        },
      );
    }

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
    ;
    filteredCategories = categories;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        key: _scaffoldKey,
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                color: secondaryColorDark,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: SizedBox(
                    height: 48,
                    child: TextField(
                      controller: _searchController,
                      focusNode: _focusNodes[0],
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: lightGrey),
                              borderRadius: BorderRadius.circular(4)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: lightGrey),
                              borderRadius: BorderRadius.circular(4)),
                          filled: true,
                          fillColor: secondaryColorLight,
                          prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: ImageIcon(
                                const AssetImage("assets/images/search.png"),
                                color: _focusNodes[0].hasFocus
                                    ? textPrimary
                                    : textGrey,
                                size: 18,
                              )),
                          prefixIconConstraints:
                              const BoxConstraints(minHeight: 24, minWidth: 24),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                showModalBottomSheet<void>(
                                  // context and builder are
                                  // required properties in this widget
                                  context: context,
                                  backgroundColor: secondaryColorDark,
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(color: lightGrey),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(16),
                                          topLeft: Radius.circular(16))),
                                  constraints:
                                      BoxConstraints(maxHeight: height * 0.7),
                                  isScrollControlled: true,

                                  builder: (BuildContext context) {
                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setModalState) {
                                      return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
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

                                               Container(
                                                alignment: Alignment.topLeft,
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical: 22),
                                                  child: const Text(
                                                    "Filter",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(

                                                        color: textPrimary,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )),
                                              Flexible(
                                                  child: ListView(
                                                children: [
                                                  ...categories.map((cat) =>
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 32),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                cat.category
                                                                    .toUpperCase(),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: checkIfSelectedFilter(
                                                                            cat.id)
                                                                        ? textPrimary
                                                                        : textGrey),
                                                              ),
                                                              Checkbox(
                                                                  value: checkIfSelectedFilter(
                                                                      cat.id),
                                                                  onChanged:
                                                                      (val) {
                                                                    setModalState(
                                                                        () {
                                                                      updateFilterCategory(
                                                                          cat.id);
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
                                                          setState(() {
                                                            filteredCategories =
                                                                categories;
                                                          });
                                                          setModalState(() {
                                                            filter = [];
                                                          });
                                                        },
                                                        child: Container(
                                                            height: 36,
                                                            alignment: Alignment.center,
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 12),
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color:
                                                                        lightGrey)),
                                                            child: Text(
                                                              "Reset"
                                                                  .toUpperCase(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontSize: 14,
                                                                color:
                                                                    primaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                                      Navigator.pop(context);
                                                    },
                                                    child: Ink(
                                                      decoration:
                                                          const BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                              primaryColor,
                                                              gradientTwo
                                                            ]),
                                                      ),
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 36,
                                                        child: Text(
                                                          'Apply'.toUpperCase(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 14,
                                                                  letterSpacing:
                                                                      2),
                                                        ),
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
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: ImageIcon(
                                    const AssetImage(
                                        "assets/images/filter.png"),
                                    color: _focusNodes[0].hasFocus
                                        ? textPrimary
                                        : textGrey,
                                    size: 18,
                                  ))),
                          suffixIconConstraints:
                              const BoxConstraints(minHeight: 24, minWidth: 24),
                          hintText: "Search Category/Sub-Category",
                          hintStyle:
                              const TextStyle(fontSize: 16, color: textGrey)),
                      cursorColor: textPrimary,
                      onChanged: (val) {
                        setState(() {
                          filteredCategories = categories
                              .where((cat) => cat.category
                                  .toLowerCase()
                                  .contains(val.toLowerCase()))
                              .toList();
                        });
                      },
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  spacing: 0,
                  runSpacing: 12,
                  children: [
                    ...filteredCategories.map(
                      (cat) => GestureDetector(
                          onTap: () {
                            setState(() {
                              updateSelectCategory(cat.id, height);
                            });
                          },
                          child: Container(
                              height: 40,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                              margin: const EdgeInsets.only(right: 12),
                              color: selectedCategories.contains(cat.id)
                                  ? primaryColor
                                  : secondaryColor,
                              child: Text(
                                cat.category.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: selectedCategories.contains(cat.id)
                                        ? secondaryColorDark
                                        : textPrimary,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2),
                              ))),
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
                        style: const TextStyle(fontSize: 12, color: textGrey,fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      ),
                    )
                  : const Text(""),
              selectedCategories.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Wrap(
                        spacing: 0,
                        runSpacing: 12,
                        children: [
                          ...subCategories.map(
                            (cat) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showModal(height);
                                    updateSelectSubCategory(cat);
                                  });
                                },
                                child: Container(
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                    margin: const EdgeInsets.only(right: 12),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: selectedSubCategories
                                                    .contains(cat)
                                                ? primaryColor
                                                : textGrey,
                                            )),
                                    child: Text(
                                      cat.category.toUpperCase(),
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
        ]));
  }
}
