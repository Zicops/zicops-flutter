import 'package:flutter/cupertino.dart';

import '../../utils/colors.dart';

class SpacerLine extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets margin;
  const SpacerLine(this.width, this.height, this.margin, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: lightGrey,
      margin: margin,
    );
  }
}
