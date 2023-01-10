import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/utils/colors.dart';

class ProgressBar extends StatefulWidget {
  double percentage;

  ProgressBar(this.percentage, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProgressBar();
  }
}

class _ProgressBar extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Expanded(child: Container(
            height: 4.sp,
            alignment: Alignment.centerLeft,
            color: const Color(0xE6101012),
            child: FractionallySizedBox(
              widthFactor: widget.percentage,
              heightFactor: 1,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [primaryColor, gradientTwo])),
              ),
            )))
      ],
    );
  }
}
