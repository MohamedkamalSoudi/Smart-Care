import 'package:flutter/material.dart';

class CustomWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paintFill0 = Paint()
      ..shader = LinearGradient(
        colors: [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 226, 244, 253),
          Color.fromARGB(255, 136, 190, 238)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0016667, size.height * 0.9991429);
    path_0.lineTo(size.width * 1.0013333, size.height * 1.0028571);
    path_0.lineTo(size.width * 1.0013333, size.height * 0.6128571);
    path_0.quadraticBezierTo(size.width * 0.4605833, size.height * 0.8047857,
        size.width * 0.3590000, size.height * 0.6622857);
    path_0.quadraticBezierTo(size.width * 0.2743333, size.height * 0.5579286,
        size.width * -0.0023333, size.height * 0.6448571);
    path_0.lineTo(size.width * -0.0016667, size.height * 0.9991429);
    path_0.close();
    canvas.drawPath(path_0, paintFill0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}