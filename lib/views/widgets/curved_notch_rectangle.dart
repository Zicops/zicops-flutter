import 'dart:ui' as ui;
import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class CNRCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.4155116,size.height*0.2680625);
    path_0.cubicTo(size.width*0.4030407,size.height*0.1322312,size.width*0.3830698,0,size.width*0.3576802,0);
    path_0.lineTo(size.width*0.08139535,0);
    path_0.cubicTo(size.width*0.03644186,0,0,size.height*0.2238571,0,size.height*0.5000000);
    path_0.cubicTo(0,size.height*0.7761429,size.width*0.03644186,size.height,size.width*0.08139535,size.height);
    path_0.lineTo(size.width*0.9186047,size.height);
    path_0.cubicTo(size.width*0.9635581,size.height,size.width,size.height*0.7761429,size.width,size.height*0.5000000);
    path_0.cubicTo(size.width,size.height*0.2238571,size.width*0.9635581,0,size.width*0.9186047,0);
    path_0.lineTo(size.width*0.6423198,0);
    path_0.cubicTo(size.width*0.6169331,0,size.width*0.5969593,size.height*0.1322314,size.width*0.5844884,size.height*0.2680625);
    path_0.cubicTo(size.width*0.5676715,size.height*0.4512161,size.width*0.5352907,size.height*0.5803571,size.width*0.5000000,size.height*0.5803571);
    path_0.cubicTo(size.width*0.4647093,size.height*0.5803571,size.width*0.4323285,size.height*0.4512161,size.width*0.4155116,size.height*0.2680625);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width*0.4155116,size.height*0.2680625);
    path_1.cubicTo(size.width*0.4030407,size.height*0.1322312,size.width*0.3830698,0,size.width*0.3576802,0);
    path_1.lineTo(size.width*0.08139535,0);
    path_1.cubicTo(size.width*0.03644186,0,0,size.height*0.2238571,0,size.height*0.5000000);
    path_1.cubicTo(0,size.height*0.7761429,size.width*0.03644186,size.height,size.width*0.08139535,size.height);
    path_1.lineTo(size.width*0.9186047,size.height);
    path_1.cubicTo(size.width*0.9635581,size.height,size.width,size.height*0.7761429,size.width,size.height*0.5000000);
    path_1.cubicTo(size.width,size.height*0.2238571,size.width*0.9635581,0,size.width*0.9186047,0);
    path_1.lineTo(size.width*0.6423198,0);
    path_1.cubicTo(size.width*0.6169331,0,size.width*0.5969593,size.height*0.1322314,size.width*0.5844884,size.height*0.2680625);
    path_1.cubicTo(size.width*0.5676715,size.height*0.4512161,size.width*0.5352907,size.height*0.5803571,size.width*0.5000000,size.height*0.5803571);
    path_1.cubicTo(size.width*0.4647093,size.height*0.5803571,size.width*0.4323285,size.height*0.4512161,size.width*0.4155116,size.height*0.2680625);
    path_1.close();

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Color(0xff242630).withOpacity(1.0);
    canvas.drawPath(path_1,paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width*0.5844884,size.height*0.2680625);
    path_2.lineTo(size.width*0.5857529,size.height*0.2724500);
    path_2.lineTo(size.width*0.5844884,size.height*0.2680625);
    path_2.close();
    path_2.moveTo(size.width*0.08139535,size.height*0.008928571);
    path_2.lineTo(size.width*0.3576802,size.height*0.008928571);
    path_2.lineTo(size.width*0.3576802,size.height*-0.008928571);
    path_2.lineTo(size.width*0.08139535,size.height*-0.008928571);
    path_2.lineTo(size.width*0.08139535,size.height*0.008928571);
    path_2.close();
    path_2.moveTo(size.width*0.001453488,size.height*0.5000000);
    path_2.cubicTo(size.width*0.001453488,size.height*0.2287893,size.width*0.03724477,size.height*0.008928571,size.width*0.08139535,size.height*0.008928571);
    path_2.lineTo(size.width*0.08139535,size.height*-0.008928571);
    path_2.cubicTo(size.width*0.03563924,size.height*-0.008928571,size.width*-0.001453488,size.height*0.2189268,size.width*-0.001453488,size.height*0.5000000);
    path_2.lineTo(size.width*0.001453488,size.height*0.5000000);
    path_2.close();
    path_2.moveTo(size.width*0.08139535,size.height*0.9910714);
    path_2.cubicTo(size.width*0.03724477,size.height*0.9910714,size.width*0.001453488,size.height*0.7712107,size.width*0.001453488,size.height*0.5000000);
    path_2.lineTo(size.width*-0.001453488,size.height*0.5000000);
    path_2.cubicTo(size.width*-0.001453488,size.height*0.7810732,size.width*0.03563924,size.height*1.008929,size.width*0.08139535,size.height*1.008929);
    path_2.lineTo(size.width*0.08139535,size.height*0.9910714);
    path_2.close();
    path_2.moveTo(size.width*0.9186047,size.height*0.9910714);
    path_2.lineTo(size.width*0.08139535,size.height*0.9910714);
    path_2.lineTo(size.width*0.08139535,size.height*1.008929);
    path_2.lineTo(size.width*0.9186047,size.height*1.008929);
    path_2.lineTo(size.width*0.9186047,size.height*0.9910714);
    path_2.close();
    path_2.moveTo(size.width*0.9985465,size.height*0.5000000);
    path_2.cubicTo(size.width*0.9985465,size.height*0.7712107,size.width*0.9627558,size.height*0.9910714,size.width*0.9186047,size.height*0.9910714);
    path_2.lineTo(size.width*0.9186047,size.height*1.008929);
    path_2.cubicTo(size.width*0.9643605,size.height*1.008929,size.width*1.001453,size.height*0.7810732,size.width*1.001453,size.height*0.5000000);
    path_2.lineTo(size.width*0.9985465,size.height*0.5000000);
    path_2.close();
    path_2.moveTo(size.width*0.9186047,size.height*0.008928571);
    path_2.cubicTo(size.width*0.9627558,size.height*0.008928571,size.width*0.9985465,size.height*0.2287893,size.width*0.9985465,size.height*0.5000000);
    path_2.lineTo(size.width*1.001453,size.height*0.5000000);
    path_2.cubicTo(size.width*1.001453,size.height*0.2189268,size.width*0.9643605,size.height*-0.008928571,size.width*0.9186047,size.height*-0.008928571);
    path_2.lineTo(size.width*0.9186047,size.height*0.008928571);
    path_2.close();
    path_2.moveTo(size.width*0.6423198,size.height*0.008928571);
    path_2.lineTo(size.width*0.9186047,size.height*0.008928571);
    path_2.lineTo(size.width*0.9186047,size.height*-0.008928571);
    path_2.lineTo(size.width*0.6423198,size.height*-0.008928571);
    path_2.lineTo(size.width*0.6423198,size.height*0.008928571);
    path_2.close();
    path_2.moveTo(size.width*0.5832209,size.height*0.2636768);
    path_2.cubicTo(size.width*0.5666366,size.height*0.4443018,size.width*0.5347151,size.height*0.5714286,size.width*0.5000000,size.height*0.5714286);
    path_2.lineTo(size.width*0.5000000,size.height*0.5892857);
    path_2.cubicTo(size.width*0.5358634,size.height*0.5892857,size.width*0.5687035,size.height*0.4581321,size.width*0.5857529,size.height*0.2724500);
    path_2.lineTo(size.width*0.5832209,size.height*0.2636768);
    path_2.close();
    path_2.moveTo(size.width*0.5000000,size.height*0.5714286);
    path_2.cubicTo(size.width*0.4652849,size.height*0.5714286,size.width*0.4333634,size.height*0.4443018,size.width*0.4167791,size.height*0.2636768);
    path_2.lineTo(size.width*0.4142471,size.height*0.2724482);
    path_2.cubicTo(size.width*0.4312965,size.height*0.4581304,size.width*0.4641366,size.height*0.5892857,size.width*0.5000000,size.height*0.5892857);
    path_2.lineTo(size.width*0.5000000,size.height*0.5714286);
    path_2.close();
    path_2.moveTo(size.width*0.6423198,size.height*-0.008928571);
    path_2.cubicTo(size.width*0.6160843,size.height*-0.008928571,size.width*0.5957384,size.height*0.1273452,size.width*0.5832209,size.height*0.2636768);
    path_2.lineTo(size.width*0.5857529,size.height*0.2724500);
    path_2.cubicTo(size.width*0.5981802,size.height*0.1371177,size.width*0.6177791,size.height*0.008928571,size.width*0.6423198,size.height*0.008928571);
    path_2.lineTo(size.width*0.6423198,size.height*-0.008928571);
    path_2.close();
    path_2.moveTo(size.width*0.3576802,size.height*0.008928571);
    path_2.cubicTo(size.width*0.3822209,size.height*0.008928571,size.width*0.4018198,size.height*0.1371175,size.width*0.4142471,size.height*0.2724482);
    path_2.lineTo(size.width*0.4167791,size.height*0.2636768);
    path_2.cubicTo(size.width*0.4042616,size.height*0.1273452,size.width*0.3839157,size.height*-0.008928571,size.width*0.3576802,size.height*-0.008928571);
    path_2.lineTo(size.width*0.3576802,size.height*0.008928571);
    path_2.close();

    Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
    paint_2_fill.shader = ui.Gradient.linear(Offset(size.width*0.5000000,0), Offset(size.width*0.5000000,size.height), [Color(0xff596A6A).withOpacity(1),Color(0xff596A6A).withOpacity(0.15)], [0,1]);
    canvas.drawPath(path_2,paint_2_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Add this CustomPaint widget to the Widget Tree