import 'package:flutter/material.dart';

class HomeIconPainter extends CustomPainter {
  static Size size(double width) => Size(width, width);
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9166667, size.height * 0.8333333);
    path_0.lineTo(size.width * 0.9166667, size.height * 0.5072500);
    path_0.cubicTo(
        size.width * 0.9166708,
        size.height * 0.4845625,
        size.width * 0.9120417,
        size.height * 0.4621167,
        size.width * 0.9030625,
        size.height * 0.4412792);
    path_0.cubicTo(
        size.width * 0.8940833,
        size.height * 0.4204458,
        size.width * 0.8809500,
        size.height * 0.4016633,
        size.width * 0.8644583,
        size.height * 0.3860833);
    path_0.lineTo(size.width * 0.5572500, size.height * 0.09575000);
    path_0.cubicTo(
        size.width * 0.5417792,
        size.height * 0.08112208,
        size.width * 0.5212917,
        size.height * 0.07297125,
        size.width * 0.5000000,
        size.height * 0.07297125);
    path_0.cubicTo(
        size.width * 0.4787083,
        size.height * 0.07297125,
        size.width * 0.4582208,
        size.height * 0.08112208,
        size.width * 0.4427500,
        size.height * 0.09575000);
    path_0.lineTo(size.width * 0.1355417, size.height * 0.3860833);
    path_0.cubicTo(
        size.width * 0.1190508,
        size.height * 0.4016633,
        size.width * 0.1059146,
        size.height * 0.4204458,
        size.width * 0.09693750,
        size.height * 0.4412792);
    path_0.cubicTo(
        size.width * 0.08796000,
        size.height * 0.4621167,
        size.width * 0.08333083,
        size.height * 0.4845625,
        size.width * 0.08333333,
        size.height * 0.5072500);
    path_0.lineTo(size.width * 0.08333333, size.height * 0.8333333);
    path_0.cubicTo(
        size.width * 0.08333333,
        size.height * 0.8554333,
        size.width * 0.09211292,
        size.height * 0.8766292,
        size.width * 0.1077412,
        size.height * 0.8922583);
    path_0.cubicTo(
        size.width * 0.1233692,
        size.height * 0.9078875,
        size.width * 0.1445654,
        size.height * 0.9166667,
        size.width * 0.1666667,
        size.height * 0.9166667);
    path_0.lineTo(size.width * 0.8333333, size.height * 0.9166667);
    path_0.cubicTo(
        size.width * 0.8554333,
        size.height * 0.9166667,
        size.width * 0.8766292,
        size.height * 0.9078875,
        size.width * 0.8922583,
        size.height * 0.8922583);
    path_0.cubicTo(
        size.width * 0.9078875,
        size.height * 0.8766292,
        size.width * 0.9166667,
        size.height * 0.8554333,
        size.width * 0.9166667,
        size.height * 0.8333333);
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.08333333;
    paint0Stroke.color = const Color(0xffC1C1C1).withOpacity(1.0);
    paint0Stroke.strokeCap = StrokeCap.round;
    paint0Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.transparent;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
