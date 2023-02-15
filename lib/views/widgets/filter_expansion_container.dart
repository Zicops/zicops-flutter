import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

class FilterExpansionContainer extends StatefulWidget {
  String label;
  Widget expanded;
  bool isSubTab;
  bool isOpen;
  Function() onTap;

  FilterExpansionContainer(this.label, this.expanded, this.isOpen, this.onTap,
      {this.isSubTab = false,
      Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ExpansionContainer();
  }
}

class _ExpansionContainer extends State<FilterExpansionContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 800)
    );
    widget.isOpen ? controller.forward() : controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        widget.isSubTab
            ? const SizedBox.shrink()
            : Divider(
                color: lightGrey,
                height: 1.sp,
                thickness: 1.sp,
              ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: widget.onTap
          ,
          child: Container(
            height: 48.sp,
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 12.sp),
            alignment: Alignment.center,
            child: widget.isSubTab
                ? Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Container(
                        width: 24.sp,
                        height: 24.sp,
                        alignment: Alignment.center,
                        child: Transform.rotate(
                            angle: widget.isOpen ? 22 : 0,
                            child: Image.asset(
                              "assets/images/down_arrow_filled.png",
                              width: 10.sp,
                              height: 5.sp,
                              color: widget.isOpen ? primaryColor : textPrimary,
                            ))),
                    SizedBox(
                      width: 15.sp,
                    ),
                    Container(
                        height: 20.sp,
                        child: Text(widget.label,
                            style: TextStyle(
                                color: textGrey2,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                height: 1.43))),
                  ])
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text(widget.label.toUpperCase(),
                            style: TextStyle(
                                color: textGrey2,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                height: 1.43)),
                        Container(
                            width: 24.sp,
                            height: 24.sp,
                            alignment: Alignment.center,
                            child: Transform.rotate(
                                angle: widget.isOpen ? 22 : 0,
                                child: Image.asset(
                                  "assets/images/down_arrow.png",
                                  width: 12.sp,
                                  height: 8.sp,
                                  color: widget.isOpen ? primaryColor : textPrimary,
                                ))),
                      ]),
          ),
        ),
        SizeTransition(
            sizeFactor: CurvedAnimation(
              curve: Curves.easeInOut,
              parent: controller,
            ),
            child: widget.expanded),
        widget.isSubTab
            ? const SizedBox.shrink()
            : Divider(
                color: lightGrey,
                height: 1.sp,
                thickness: 1.sp,
              ),
      ],
    );
  }
}
