import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vect;

class WelCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height, w = size.width;
    final path = Path();
    final paint = Paint()
      ..color = Colors.yellow[700]!
      // ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    final h1 = size.height - 120, w1 = size.width - 60;
    final center = Offset(w / 2, h / 2);
    final rect1 = Rect.fromCenter(center: center, width: w1, height: h1);
    final rect2 = Rect.fromCenter(center: center, width: w, height: h);

    path.moveTo(w, h / 2);
    path.lineTo(w - 60, h / 2);
    path.addArc(rect1, vect.radians(0), vect.radians(360));
    path.lineTo(w, h * .5);
    path.addArc(rect2, vect.radians(0), vect.radians(360));
    path.close();
    canvas.drawPath(path, paint);

    // final h = size.height, w = size.width;
    // final paint = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 40
    //   ..color = Colors.yellow[700]!;
    // canvas.drawCircle(Offset(w / 2, h / 2), 80, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class WelCircleClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final h = size.height, w = size.width;
    final path = Path();
    final h1 = size.height - 120, w1 = size.width - 120;
    final center = Offset(w / 2, h / 2);
    final rect1 = Rect.fromCenter(center: center, width: w1, height: h1);
    final rect2 = Rect.fromCenter(center: center, width: w, height: h);

    path.moveTo(w, h / 2);
    path.lineTo(w - 60, h / 2);
    path.addArc(rect1, vect.radians(0), vect.radians(360));
    path.lineTo(w, h * .5);
    path.addArc(rect2, vect.radians(0), vect.radians(-360));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
