//Copy this CustomPainter code to the Bottom of the File
import 'package:flutter/material.dart';

class OutLinedRoundedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.02582257;
    paint0Stroke.color = const Color(0xff8870E6).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01291129, size.height * 0.04015056,
                size.width * 0.9741774, size.height * 0.9196989),
            bottomRight: Radius.circular(size.width * 0.1526447),
            bottomLeft: Radius.circular(size.width * 0.1526447),
            topLeft: Radius.circular(size.width * 0.1526447),
            topRight: Radius.circular(size.width * 0.1526447)),
        paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff000000).withOpacity(0.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01291129, size.height * 0.04015056,
                size.width * 0.9741774, size.height * 0.9196989),
            bottomRight: Radius.circular(size.width * 0.1526447),
            bottomLeft: Radius.circular(size.width * 0.1526447),
            topLeft: Radius.circular(size.width * 0.1526447),
            topRight: Radius.circular(size.width * 0.1526447)),
        paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.01309525, size.height * 0.5000000);
    path_1.cubicTo(
        size.width * 0.005862932,
        size.height * 0.5000000,
        size.width * -0.00005370596,
        size.height * 0.4823099,
        size.width * 0.0005163349,
        size.height * 0.4605910);
    path_1.cubicTo(
        size.width * 0.002029254,
        size.height * 0.4029448,
        size.width * 0.006853103,
        size.height * 0.3464228,
        size.width * 0.01480512,
        size.height * 0.2935734);
    path_1.cubicTo(
        size.width * 0.02456264,
        size.height * 0.2287252,
        size.width * 0.03880496,
        size.height * 0.1709021,
        size.width * 0.05657934,
        size.height * 0.1239745);
    path_1.cubicTo(
        size.width * 0.07435360,
        size.height * 0.07704655,
        size.width * 0.09524948,
        size.height * 0.04209561,
        size.width * 0.1178696,
        size.height * 0.02146023);
    path_1.cubicTo(
        size.width * 0.1363040,
        size.height * 0.004643099,
        size.width * 0.1555369,
        size.height * -0.002350013,
        size.width * 0.1747051,
        size.height * 0.0006925044);
    path_1.cubicTo(
        size.width * 0.1819275,
        size.height * 0.001838871,
        size.width * 0.1869725,
        size.height * 0.02182923,
        size.width * 0.1860242,
        size.height * 0.04342861);
    path_1.lineTo(size.width * 0.1860242, size.height * 0.04342861);
    path_1.cubicTo(
        size.width * 0.1850754,
        size.height * 0.06502811,
        size.width * 0.1784898,
        size.height * 0.08002622,
        size.width * 0.1712628,
        size.height * 0.07920163);
    path_1.cubicTo(
        size.width * 0.1558038,
        size.height * 0.07743789,
        size.width * 0.1403240,
        size.height * 0.08341405,
        size.width * 0.1254602,
        size.height * 0.09697378);
    path_1.cubicTo(
        size.width * 0.1064098,
        size.height * 0.1143529,
        size.width * 0.08881091,
        size.height * 0.1437892,
        size.width * 0.07384132,
        size.height * 0.1833112);
    path_1.cubicTo(
        size.width * 0.05887214,
        size.height * 0.2228344,
        size.width * 0.04687713,
        size.height * 0.2715320,
        size.width * 0.03865935,
        size.height * 0.3261481);
    path_1.cubicTo(
        size.width * 0.03224761,
        size.height * 0.3687604,
        size.width * 0.02825056,
        size.height * 0.4142083,
        size.width * 0.02680342,
        size.height * 0.4606073);
    path_1.cubicTo(
        size.width * 0.02612686,
        size.height * 0.4822999,
        size.width * 0.02032753,
        size.height * 0.5000000,
        size.width * 0.01309525,
        size.height * 0.5000000);
    path_1.lineTo(size.width * 0.01309525, size.height * 0.5000000);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xffC470E6).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xffC470E6).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1461891, size.height * 0.001254705,
                size.width * 0.2390671, size.height * 0.07779172),
            bottomRight: Radius.circular(size.width * 0.01291129),
            bottomLeft: Radius.circular(size.width * 0.01291129),
            topLeft: Radius.circular(size.width * 0.01291129),
            topRight: Radius.circular(size.width * 0.01291129)),
        paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
