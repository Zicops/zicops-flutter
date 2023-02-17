import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/utils/colors.dart';

class ProgressBar extends StatefulWidget {
  double width;
  double percentage;

  ProgressBar(this.width, this.percentage, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProgressBar();
  }
}

class _ProgressBar extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

         Container(
          width: widget.width.sp,
            height: 4.sp,
            alignment: Alignment.centerLeft,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: const Color(0xE6101012),
              borderRadius: BorderRadius.circular(4.sp)
            ),
            child: FractionallySizedBox(
              widthFactor: widget.percentage > 0? widget.percentage: 0,
              heightFactor: 1,
              child:   DecoratedBox(
                decoration: BoxDecoration(
                    gradient:
                    RadialGradient(
                        colors: const [primaryColor, gradientTwo],
                        center: Alignment.topLeft,
                        radius: 50.5.sp),
                ),
              ),
            ))
      ],
    );
  }
}
