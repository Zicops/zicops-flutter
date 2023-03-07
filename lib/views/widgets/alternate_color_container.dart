import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

class AlternateColorContainer extends StatelessWidget {
  List<Map<String, dynamic>> items;
  AlternateColorContainer(this.items, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...items.mapIndexed((index, item) => Container(
              height: 48.sp,
              padding: EdgeInsets.symmetric(horizontal: 8.sp),
              alignment: Alignment.center,
              color: (index + 1) % 2 == 0 ? secondaryColorDark : secondaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item['title']!,
                    style: TextStyle(fontSize: 16.sp, color: textPrimary, height: 1.5),
                  ),
                  Text(item['value']!, style: TextStyle(fontSize: 16.sp, color: item['value_color'] ?? textPrimary, height: 1.5))
                ],
              ),
            ))
      ],
    );
  }
}
