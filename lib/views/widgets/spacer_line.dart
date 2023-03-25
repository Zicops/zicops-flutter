import 'package:flutter/cupertino.dart';

import '../../utils/colors.dart';

class SpacerLine extends StatelessWidget {
  final double width;
  final double height;
  const SpacerLine(this.width, this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: lightGrey,
    );
  }
}
