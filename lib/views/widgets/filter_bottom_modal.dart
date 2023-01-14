import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import 'expansion_container.dart';
import 'filter_options.dart';

filterBottomSheet(BuildContext context, double maxHeight, double width,
    Map<String, List> filterList, Function() onReset, Function() onApply) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: secondaryColor,
    shape: const RoundedRectangleBorder(
        side: BorderSide(color: lightGrey),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(16), topLeft: Radius.circular(16))),
    isScrollControlled: true,
    constraints: BoxConstraints(minHeight: 0, maxHeight: maxHeight),
    builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
        return Stack(alignment: Alignment.center, children: [
          SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4.sp,
                width: 36.sp,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 8.sp, bottom: 16.sp),
                decoration: BoxDecoration(
                    color: secondaryColorDark,
                    borderRadius: BorderRadius.circular(4)),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Filter",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: textPrimary,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.33),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: 24.sp,
                            height: 24.sp,
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/cross.png",
                              width: 14.sp,
                              height: 14.sp,
                            )),
                      )
                    ],
                  )),
              SizedBox(
                height: 15.sp,
              ),
              ExpansionContainer(
                  "type",
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: Column(children: [
                        ...[
                          "Self-paced",
                          "Classrooms",
                          "Events",
                          "Labs",
                          "Test series"
                        ].map(
                          (e) => filterOptions(e, filterList.keys.toList()[0],
                              filterList, setModalState),
                        )
                      ]))),
              ExpansionContainer(
                  "Expertise",
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: Column(children: [
                        ...["Beginner", "Intermediate", "Competent"].map(
                          (e) => filterOptions(e, filterList.keys.toList()[0],
                              filterList, setModalState),
                        )
                      ]))),
              ExpansionContainer(
                  "Language",
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: Column(children: [
                        ...["English", "Hindi", "Bengali", "Marathi", "Tamil"].map(
                          (e) => filterOptions(e, filterList.keys.toList()[0],
                              filterList, setModalState),
                        )
                      ]))),
              ExpansionContainer(
                  "Category",
                  Column(children: [
                    ...[1, 2, 3].map((e) => ExpansionContainer(
                          "Design",
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.sp),
                              color: secondaryColorDark,
                              child: Column(children: [
                                ...["UI design", "Industrial design", "UX design", "Graphic design"]
                                    .map(
                                  (e) => filterOptions(
                                    e,
                                    filterList.keys.toList()[0],
                                    filterList,
                                    setModalState,
                                  ),
                                )
                              ])),
                          isSubTab: true,
                        ))
                  ])),
              SizedBox(
                height: 76.sp,
              ),
            ],
          )),
          Positioned(
              bottom: 0,
              child: Container(
                  width: width,
                  height: 76.sp,
                  alignment: Alignment.center,
                  color: secondaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                            onTap: onReset,
                            child: Container(
                                height: 36.sp,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(right: 12),
                                decoration: BoxDecoration(
                                    border: Border.all(color: lightGrey),
                                    borderRadius: BorderRadius.circular(4.sp)),
                                child: Text(
                                  "Reset".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2,
                                  ),
                                ))),
                      ),
                      Expanded(
                          child: InkWell(
                        onTap: onApply,
                        child: Container(
                          alignment: Alignment.center,
                          height: 36.sp,
                          decoration: BoxDecoration(
                              gradient: RadialGradient(
                                  colors: const [primaryColor, gradientTwo],
                                  center: Alignment.topLeft,
                                  radius: 10.sp),
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            'Apply'.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                letterSpacing: 2),
                          ),
                        ),
                      )),
                    ],
                  )))
        ]);
      });
    },
  );
}
