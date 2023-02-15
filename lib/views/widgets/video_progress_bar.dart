import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zicops/utils/colors.dart';

class VideoProgressBar extends StatefulWidget {
  double percentage;

  VideoProgressBar(this.percentage, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProgressBar();
  }
}

class _ProgressBar extends State<VideoProgressBar> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
        width: 300.sp,
        height: 4.sp,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
                width: 300.sp,
                height: 4.sp,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FractionallySizedBox(
                      widthFactor: widget.percentage,
                      heightFactor: 1,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                              colors: const [primaryColor, gradientTwo],
                              center: Alignment.topLeft,
                              radius: 50.5.sp),
                        ),
                      ),
                    ),
                    Container(
                      width: 36.sp,
                      height: 36.sp,
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/knob.png",
                      ),
                    )
                  ],
                )),
          ],
        ));
  }
}
