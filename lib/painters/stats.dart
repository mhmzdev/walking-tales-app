import 'package:flutter/material.dart';

class StatsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2291667, size.height * 0.8750000);
    path_0.arcToPoint(Offset(size.width * 0.1250000, size.height * 0.7708333),
        radius:
            Radius.elliptical(size.width * 0.1041667, size.height * 0.1041667),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 0.1250000, size.height * 0.06250000);
    path_0.arcToPoint(Offset(size.width * 0.06250000, 0),
        radius: Radius.elliptical(
            size.width * 0.06250000, size.height * 0.06250000),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 0.06250000, 0);
    path_0.arcToPoint(Offset(0, size.height * 0.06250000),
        radius: Radius.elliptical(
            size.width * 0.06250000, size.height * 0.06250000),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(0, size.height * 0.7708333);
    path_0.arcToPoint(Offset(size.width * 0.2291667, size.height),
        radius:
            Radius.elliptical(size.width * 0.2291667, size.height * 0.2291667),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 0.9375000, size.height);
    path_0.arcToPoint(Offset(size.width, size.height * 0.9375000),
        radius: Radius.elliptical(
            size.width * 0.06250000, size.height * 0.06250000),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width, size.height * 0.9375000);
    path_0.arcToPoint(Offset(size.width * 0.9375000, size.height * 0.8750000),
        radius: Radius.elliptical(
            size.width * 0.06250000, size.height * 0.06250000),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.8125000, size.height * 0.7500000);
    path_1.arcToPoint(Offset(size.width * 0.8750000, size.height * 0.6875000),
        radius: Radius.elliptical(
            size.width * 0.06250000, size.height * 0.06250000),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.lineTo(size.width * 0.8750000, size.height * 0.4375000);
    path_1.arcToPoint(Offset(size.width * 0.7500000, size.height * 0.4375000),
        radius: Radius.elliptical(
            size.width * 0.06250000, size.height * 0.06250000),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.lineTo(size.width * 0.7500000, size.height * 0.6875000);
    path_1.arcToPoint(Offset(size.width * 0.8125000, size.height * 0.7500000),
        radius: Radius.elliptical(
            size.width * 0.06250000, size.height * 0.06250000),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.3125000, size.height * 0.7500000);
    path_2.arcToPoint(Offset(size.width * 0.3750000, size.height * 0.6875000),
        radius: Radius.elliptical(
            size.width * 0.06250000, size.height * 0.06250000),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_2.lineTo(size.width * 0.3750000, size.height * 0.4375000);
    path_2.arcToPoint(Offset(size.width * 0.2500000, size.height * 0.4375000),
        radius: Radius.elliptical(
            size.width * 0.06250000, size.height * 0.06250000),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_2.lineTo(size.width * 0.2500000, size.height * 0.6875000);
    path_2.arcToPoint(Offset(size.width * 0.3125000, size.height * 0.7500000),
        radius: Radius.elliptical(
            size.width * 0.06250000, size.height * 0.06250000),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.5625000, size.height * 0.7500000);
    path_3.arcToPoint(Offset(size.width * 0.6250000, size.height * 0.6875000),
        radius: Radius.elliptical(
            size.width * 0.06250000, size.height * 0.06250000),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_3.lineTo(size.width * 0.6250000, size.height * 0.2291667);
    path_3.arcToPoint(Offset(size.width * 0.5000000, size.height * 0.2291667),
        radius: Radius.elliptical(
            size.width * 0.06250000, size.height * 0.06250000),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_3.lineTo(size.width * 0.5000000, size.height * 0.6875000);
    path_3.arcToPoint(Offset(size.width * 0.5625000, size.height * 0.7500000),
        radius: Radius.elliptical(
            size.width * 0.06250000, size.height * 0.06250000),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_3.close();

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
