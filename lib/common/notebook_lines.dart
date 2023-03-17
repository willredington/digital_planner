import 'package:flutter/material.dart';

class NotebookLinesWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final backgroundColor = Paint()..color = Colors.amber.shade200;

    final lineColor = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 1.0;

    final dividerColor = Paint()
      ..color = Colors.pinkAccent
      ..strokeWidth = 2.5;

    final whiteRectangle =
        Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height));

    canvas.drawRect(whiteRectangle, backgroundColor);

    const spacingFactor = 25.0;

    for (var i = 0;; i++) {
      final double y = i * (spacingFactor);
      if (y >= size.height) {
        break;
      }

      canvas.drawLine(Offset(0, y), Offset(size.width, y), lineColor);
    }

    canvas.drawLine(Offset(size.width * .05, 0),
        Offset(size.width * .05, size.height), dividerColor);
  }

  @override
  bool shouldRepaint(NotebookLinesWidget oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(NotebookLinesWidget oldDelegate) => false;
}
