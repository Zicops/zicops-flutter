import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

import 'package:zicops/utils/colors.dart';

class SemiCircleProgressBar extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final circleStrokeWidth = 15.sp;
    final bgColor = secondaryColor;
    final progressColor = Color(0xFF03DAC5);
    final mainProgress = 60;
    final tickProgress = 80;
    Offset center  = new Offset(size.width/2, size.height);
    double radius  = math.min(size.width/2,size.height/2);
    double arcAngle = math.pi * (mainProgress/100);

    Paint progressBlack = new Paint()
      ..color = secondaryColorDark
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleStrokeWidth;

    // progress ellipse
    canvas.drawArc(
      new Rect.fromCircle(center: center,radius: radius),
      -math.pi,
      math.pi,
      false,
      progressBlack,
    );




    Paint progressPaint = new Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleStrokeWidth;

    // progress ellipse
    canvas.drawArc(
      new Rect.fromCircle(center: center,radius: radius),
      -math.pi,
      arcAngle,
      false,
      progressPaint,
    );

    // red tick

    Paint redTick = Paint()
      ..color = Color(0xFFF14358)
      ..strokeWidth=circleStrokeWidth;

    final tickerAngle = (math.pi * (tickProgress/100) )- math.pi;

    canvas.translate(size.width/2, size.height);

    final tx = (radius+circleStrokeWidth/2)*math.cos(tickerAngle);
    final ty = (radius+circleStrokeWidth/2)*math.sin(tickerAngle);
    final p1 = Offset(-0,-10);
    final p2 = Offset(tx,ty);

    canvas.drawLine(p1,p2, redTick);




    // Forgeround ellipse to hide red ticker

    Paint foregroundCircle = new Paint()
      ..color = bgColor
      ..strokeWidth = circleStrokeWidth;

    final fgCircleDia = 2*radius-circleStrokeWidth;

    canvas.drawArc(
      Rect.fromCenter(center: Offset(0,0), width:fgCircleDia, height:fgCircleDia),
      -math.pi,
      math.pi,
      false,
      foregroundCircle,
    );

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}