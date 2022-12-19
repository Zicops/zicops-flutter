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
    if (selectedCategories.isNotEmpty) {
      showModalBottomSheet<void>(
        // context and builder are
        // required properties in this widget
        context: context,
        backgroundColor: secondaryColorDark,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16))),

        isScrollControlled: true,
        isDismissible: false,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
            return Container(
                height: openSubCatModal ? height * 0.8 : 250,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 22),
                        child: GestureDetector(
                            onTap: () {
                              setModalState(() {
                                openSubCatModal = !openSubCatModal;
                              });
                            },
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Selected Sub-Categories",
                                        style: TextStyle(
                                            color: textPrimary, fontSize: 18),
                                      ),
                                      Text(
                                        "Select 5 more sub categories(${selectedSubCategories.length})",
                                        style: const TextStyle(
                                            color: textPrimary, fontSize: 16),
                                      )
                                    ],
                                  ),
                                  openSubCatModal
                                      ? Image.asset(
                                          "assets/images/up_arrow.png",
                                          width: 20,
                                          height: 20)
                                      : Image.asset(
                                          "assets/images/down_arrow.png",
                                          width: 20,
                                          height: 20,
                                        )
                                ]))),
                    openSubCatModal
                        ? Flexible(
                            child: ListView(
                            children: [
                              ...subCategories.map((cat) => Padding(
                                  padding: const EdgeInsets.only(bottom: 35),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        cat.category,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: textGrey),
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
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [primaryColor, gradientTwo]),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
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
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.all(12),
                                        margin:
                                            const EdgeInsets.only(right: 12),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: textPrimary)),
                                        child: Text(
                                          "Select Sub-Categories".toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: textPrimary,
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
      if(selectedSubCategories.length < 5) {
        selectedSubCategories.add(cat);
      }
    }
    if (selectedSubCategories.length >= 5) {
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

  @override
  void initState() {
    super.initState();
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
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: textGrey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      filled: true,
                      prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: ImageIcon(
                            AssetImage("assets/images/search.png"),
                            color: textGrey,
                            size: 24,
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
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 22),
                                              child: Text(
                                                "Filter",
                                                style: TextStyle(
                                                    color: textPrimary,
                                                    fontSize: 18),
                                              )),
                                          Flexible(
                                              child: ListView(
                                            children: [
                                              ...categories.map((cat) =>
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 35),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            cat.category,
                                                            style: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color:
                                                                    textGrey),
                                                          ),
                                                          Checkbox(
                                                              value:
                                                                  checkIfSelectedFilter(
                                                                      cat.id),
                                                              onChanged: (val) {
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
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12),
                                                        margin: const EdgeInsets
                                                            .only(right: 12),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    textPrimary)),
                                                        child: Text(
                                                          "Reset".toUpperCase(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 14,
                                                            color: primaryColor,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            letterSpacing: 2,
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
                                                    gradient: LinearGradient(
                                                        colors: [
                                                          primaryColor,
                                                          gradientTwo
                                                        ]),
                                                  ),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 12),
                                                    child: Text(
                                                      'Apply'.toUpperCase(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 14,
                                                              letterSpacing: 2),
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
                          child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: ImageIcon(
                                AssetImage("assets/images/filter.png"),
                                color: textGrey,
                                size: 24,
                              ))),
                      suffixIconConstraints:
                          const BoxConstraints(minHeight: 24, minWidth: 24),
                      hintText: "Search Category/Sub-Category"),
                  cursorColor: textGrey,
                  onChanged: (val) {
                    setState(() {
                      filteredCategories = categories
                          .where((cat) => cat.category
                              .toLowerCase()
                              .contains(val.toLowerCase()))
                          .toList();
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  "Categories".toUpperCase(),
                  style: TextStyle(fontSize: 12, color: textGrey),
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
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(right: 12),
                              color: selectedCategories.contains(cat.id)
                                  ? primaryColor
                                  : secondaryColor,
                              child: Text(
                                cat.category.toUpperCase(),
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: selectedCategories.contains(cat.id)
                                        ? Colors.black
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
                        style: const TextStyle(fontSize: 12, color: textGrey),
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
                                    updateSelectSubCategory(cat);
                                  });
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(12),
                                    margin: const EdgeInsets.only(right: 12),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: selectedSubCategories
                                                    .contains(cat)
                                                ? primaryColor
                                                : textGrey,
                                            width: selectedSubCategories
                                                    .contains(cat)
                                                ? 2
                                                : 1)),
                                    child: Text(
                                      cat.category.toUpperCase(),
                                      style: GoogleFonts.poppins(
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
