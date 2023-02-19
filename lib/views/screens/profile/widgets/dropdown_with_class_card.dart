import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/views/widgets/modules_dropdown.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dummies.dart';
import '../../../widgets/main_tab.dart';
import 'dropdown_list_item.dart';

class DropdownWithListCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DropdownWithListCard();
  }
}

class _DropdownWithListCard extends State<DropdownWithListCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 0.5.sp, horizontal: 0.5.sp),
        margin: EdgeInsets.symmetric(horizontal: 20.sp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.sp),
            gradient: LinearGradient(colors: [
              secondaryColorDarkOutline,
              secondaryColorDarkOutline.withOpacity(0.15),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Container(
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(4.sp),
            ),
            child: Column(
              children: [
                ModulesDropDown(
                  // dropdownList: ['Assigned', 'Inprogress', 'Completed'],
                  showTitle: false,
                ),
                Divider(
                  height: 1.sp,
                  thickness: 1.sp,
                  color: lightGrey,
                ),
                ...courseItems.sublist(0, 4).map((e) =>
                    listItem(e['preview'], e['courseName'], e['difficulty'])),
                Container(
                  height: 36.sp,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 16.sp),
                  child: Text(
                    "See All".toUpperCase(),
                    style: TextStyle(
                        fontSize: 14.sp, color: textGrey2, letterSpacing: 2),
                  ),
                )
              ],
            )));
  }
}
