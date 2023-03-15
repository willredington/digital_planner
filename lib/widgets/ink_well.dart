import 'package:flutter/material.dart' hide Ink;
import 'package:google_mlkit_digital_ink_recognition/google_mlkit_digital_ink_recognition.dart';

class InkWellWidget extends StatefulWidget {
  const InkWellWidget({super.key});

  @override
  State<InkWellWidget> createState() => _InkWellWidgetState();
}

class _InkWellWidgetState extends State<InkWellWidget> {
  final DigitalInkRecognizerModelManager _modelManager =
      DigitalInkRecognizerModelManager();

  static const _languageCode = 'en-US';

  final DigitalInkRecognizer _digitalInkRecognizer =
      DigitalInkRecognizer(languageCode: _languageCode);

  final Ink _ink = Ink();

  @override
  void dispose() {
    _digitalInkRecognizer.close();
    super.dispose();
  }

  _onReset() {
    setState(() {
      _ink.strokes.clear();
    });
  }

  Future<void> _onRecognizeText() async {
    var isDownloaded = await _modelManager.isModelDownloaded(_languageCode);

    if (!isDownloaded) {
      await _modelManager.downloadModel(_languageCode);
    }

    var results = await _digitalInkRecognizer.recognize(_ink);

    // first result is what algorithm thinks is most accurate
    if (results.isNotEmpty) {
      print('I think its this: ${results.first.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    var canRecognize = _ink.strokes.isNotEmpty;

    return SafeArea(
        child: Column(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: canRecognize ? _onRecognizeText : null,
                  child: const Text("Recognize Text")),
              ElevatedButton(onPressed: _onReset, child: const Text("Reset"))
            ],
          )),
      Expanded(
          child: GestureDetector(
        onPanStart: (DragStartDetails details) {
          print('creating new stroke');
          _ink.strokes.add(Stroke());
        },
        onPanUpdate: (DragUpdateDetails details) {
          print('update stroke');
          setState(() {
            if (_ink.strokes.isNotEmpty) {
              _ink.strokes.last.points.add(StrokePoint(
                x: details.localPosition.dx,
                y: details.localPosition.dy,
                t: DateTime.now().millisecondsSinceEpoch,
              ));
            }
          });
        },
        onPanEnd: (DragEndDetails details) {
          print('stroke end');
          // setState(() => _ink.strokes.clear());
        },
        child: CustomPaint(
          painter: Signature(ink: _ink),
          size: Size.infinite,
        ),
      )),
    ]));
  }
}

class Signature extends CustomPainter {
  Ink ink;

  Signature({required this.ink});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    for (final stroke in ink.strokes) {
      for (int i = 0; i < stroke.points.length - 1; i++) {
        final p1 = stroke.points[i];
        final p2 = stroke.points[i + 1];
        canvas.drawLine(Offset(p1.x.toDouble(), p1.y.toDouble()),
            Offset(p2.x.toDouble(), p2.y.toDouble()), paint);
      }
    }
  }

  @override
  bool shouldRepaint(Signature oldDelegate) => true;
}
