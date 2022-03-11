import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AnalogClock extends StatefulWidget {
  const AnalogClock({ Key? key }) : super(key: key);

  @override
  State<AnalogClock> createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  late Timer _timer;
  
  @override
  void initState() {
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) { 
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: ClockPainter()
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var time = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var o = Offset(size.width / 2, size.height / 2);
    var r = min(o.dx, o.dy);

    var fill = Paint()
    ..color = Color.fromARGB(255, 253, 253, 253);

    var stroke = Paint()
    ..color = Color.fromARGB(255, 202, 170, 122)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 8;

    var centerCircle = Paint()
    ..color = Colors.black87;

    var secHand = Paint()
    ..shader = RadialGradient(colors: [Colors.black87, Colors.black]).createShader(Rect.fromCircle(center: o, radius: r))
    ..color = Colors.black87
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

    var minHand = Paint()
    ..shader = RadialGradient(colors: [Colors.black87, Colors.black]).createShader(Rect.fromCircle(center: o, radius: r))
    ..color = Colors.black87
    ..style = PaintingStyle.stroke
    ..strokeWidth = 6;

    var hourHand = Paint()
    ..shader = RadialGradient(colors: [Colors.black87, Colors.black]).createShader(Rect.fromCircle(center: o, radius: r))
    ..color = Colors.black87
    ..style = PaintingStyle.stroke
    ..strokeWidth = 8;

    p2Base(baseRadius) => (rate, deg) => Offset(o.dx + baseRadius * rate * cos(deg * pi / 180), o.dy + baseRadius * rate  * sin(deg * pi / 180));
    var p2 = p2Base(0.8 * r);
    canvas.drawCircle(o, r, fill);
    canvas.drawCircle(o, r, stroke);
    canvas.drawLine(o, p2(1.0, time.second * 6 - 90), secHand);
    canvas.drawLine(o, p2(1.0, (time.minute + time.second / 60) * 6 - 90), minHand);
    canvas.drawLine(o, p2(0.7, (time.hour + time.minute / 60 + time.second / 3600) * 30 - 90), hourHand);
    canvas.drawCircle(o, 8, centerCircle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}