import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../utils/colors.dart';

class ModulesDropDown extends StatefulWidget {
  ModulesDropDown(
      {Key? key,
      this.dropdownList = const [
        "Module 1",
        "Module 2",
        "Module 3",
        "Module 4"
      ],
      this.showTitle = true,
      this.borderRadius = 4})
      : super(key: key);
  List dropdownList;
  bool showTitle;
  double borderRadius;
  @override
  State<StatefulWidget> createState() {
    return _ModulesDropDown();
  }
}

class _ModulesDropDown extends State<ModulesDropDown>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  List modules = ["Module 1", "Module 2", "Module 3", "Module 4"];
  String selectedModule = "";
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    selectedModule = widget.dropdownList[0];

    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 400),
        reverseDuration: const Duration(milliseconds: 800));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showTitle)
          SizedBox(
              height: 24.sp,
              child: Text(
                "Modules".toUpperCase(),
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: textGrey2,
                    letterSpacing: 1),
              )),
        if (widget.showTitle)
          SizedBox(
            height: 4.sp,
          ),
        Column(
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    isOpen ? controller.reverse() : controller.forward();
                    isOpen = !isOpen;
                  });
                },
                child: Container(
                    width: 320.sp,
                    height: 48.sp,
                    padding: EdgeInsets.symmetric(
                        vertical: 0.5.sp, horizontal: 0.5.sp),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius.sp),
                        gradient: LinearGradient(
                            colors: [
                              secondaryColorDarkOutline,
                              secondaryColorDarkOutline.withOpacity(0.15),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp),
                        decoration: BoxDecoration(
                            color:
                                isOpen ? secondaryColorLight : secondaryColor,
                            borderRadius: BorderRadius.only(
                                topLeft:
                                    Radius.circular(widget.borderRadius.sp),
                                topRight:
                                    Radius.circular(widget.borderRadius.sp),
                                bottomLeft: Radius.circular(isOpen ? 0 : 4.sp),
                                bottomRight:
                                    Radius.circular(isOpen ? 0 : 4.sp))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedModule,
                              style: TextStyle(
                                  fontSize: 16.sp, color: textPrimary),
                            ),
                            Container(
                                width: 24.sp,
                                height: 24.sp,
                                alignment: Alignment.center,
                                child: Transform.rotate(
                                    angle: isOpen ? 22 : 0,
                                    child: Image.asset(
                                      "assets/images/down_arrow.png",
                                      width: 12.sp,
                                      height: 8.sp,
                                      color:
                                          isOpen ? primaryColor : textPrimary,
                                    ))),
                          ],
                        )))),
            SizeTransition(
                sizeFactor: CurvedAnimation(
                  curve: Curves.easeInOut,
                  parent: controller,
                ),
                child: Container(
                    width: 320.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(4.sp),
                            bottomLeft: Radius.circular(4.sp))),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        ...modules.map(
                          (module) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedModule = module;
                                  isOpen = false;
                                });
                                controller.reverse();
                              },
                              child: Column(children: [
                                Divider(
                                    height: 0.5.sp,
                                    thickness: 0.5.sp,
                                    color: lightGrey),
                                Container(
                                  height: 48.sp,
                                  color: secondaryColor,
                                  alignment: Alignment.center,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 13.sp),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 24.sp,
                                        height: 24.sp,
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          "assets/images/modules.png",
                                          width: 18.sp,
                                          height: 20.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.sp,
                                      ),
                                      Text(
                                        module,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: textPrimary),
                                      ),
                                      const Spacer(),
                                      if (selectedModule == module)
                                        Container(
                                          width: 24.sp,
                                          height: 24.sp,
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            "assets/images/checkmark.png",
                                            width: 18.sp,
                                            height: 14.sp,
                                            color: textPrimary,
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                                Divider(
                                    height: 0.5.sp,
                                    thickness: 0.5.sp,
                                    color: lightGrey),
                              ])),
                        ),
                      ],
                    ))),
          ],
        )
      ],
    );
  }
}
