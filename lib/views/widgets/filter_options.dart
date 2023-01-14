import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

Widget filterOptions(String label, String parent, Map<String, List> filterList,
    StateSetter setModalState,
    ) {
  isChecked() {
    return filterList[parent] != null && filterList[parent]!.contains(label);
  }

  return GestureDetector(
      onTap: () {
        setModalState(() {
          if (filterList[parent] != null) {
            if (filterList[parent]!.contains(label)) {
              filterList[parent]!.remove(label);
            } else {
              filterList[parent]!.add(label);
            }
          }
        });
      },
      child: SizedBox(
          height: 48.sp,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 24.sp,
                  height: 24.sp,
                  padding: EdgeInsets.all(3.sp),
                  child: Checkbox(
                    activeColor: primaryColor,
                    side: BorderSide(color: textGrey2, width: 2.sp),
                    checkColor: Colors.black,
                    value: isChecked(),
                    onChanged: (bool? value) {
                      setModalState(() {
                        if (filterList[parent] != null) {
                          if (filterList[parent]!.contains(label)) {
                            filterList[parent]!.remove(label);
                          } else {
                            filterList[parent]!.add(label);
                          }
                        }
                      });
                    },
                  )),
              SizedBox(
                width: 15.sp,
              ),
              Expanded(child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.43,
                    letterSpacing: 1,
                    color: isChecked() ? textPrimary : textGrey2),
              )),
            ],
          )));
}
