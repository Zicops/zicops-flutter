import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

class ExpansionContainer extends StatefulWidget {
  String label;
  Widget expanded;
  ExpansionContainer(this.label, this.expanded, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ExpansionContainer();
  }
}

class _ExpansionContainer extends State<ExpansionContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isOpen = false;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 400),
        reverseDuration: const Duration(milliseconds: 800));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320.sp,
        padding: EdgeInsets.symmetric(vertical: 0.5.sp, horizontal: 0.5.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.sp),
            gradient: LinearGradient(colors: [
              secondaryColorDarkOutline,
              secondaryColorDarkOutline.withOpacity(0.15),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Container(
            width: 320.sp,
            padding: EdgeInsets.symmetric(vertical: 0.5.sp, horizontal: 0.5.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.sp),
                color: secondaryColor),
            child: Column(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      isOpen = !isOpen;
                    });
                    isOpen ? controller.forward() : controller.reverse();
                  },
                  child: Container(
                    height: 48.sp,
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.sp, vertical: 14.sp),
                    alignment: Alignment.center,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.label,
                              style: TextStyle(
                                  color: textPrimary,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                  height: 1.43)),
                          Container(
                              width: 24.sp,
                              height: 24.sp,
                              alignment: Alignment.center,
                              child: Transform.rotate(
                                  angle: isOpen ? 22 : 0,
                                  child: Image.asset(
                                    "assets/images/down_arrow_filled.png",
                                    width: 12.sp,
                                    height: 8.sp,
                                    color: isOpen ? primaryColor : textPrimary,
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
              ],
            )));
  }
}
