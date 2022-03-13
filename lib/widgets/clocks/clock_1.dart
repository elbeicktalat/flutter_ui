import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Clock1 extends StatefulWidget {
  final double? size;
  final double? secondHandLength;
  final double? minuteHandLength;
  final double? hourHandLength;
  final double? minuteIndicatorLength;
  final double? hourIndicatorLength;
  final double? borderColorWidth;
  final double? secondHandWidth;
  final double? minuteHandWidth;
  final double? hourHandWidth;
  final double? hourIndicatorWidth;
  final double? minuteIndicatorWidth;
  final Color? bodyColor;
  final Color? borderColor;
  final Color? secondHandColor;
  final Color? minuteHandColor;
  final Color? hourHandColor;
  final Color? minuteIndicatorColor;
  final Color? hourIndicatorColor;
  final Color? centerCircleColor;

  @override
  State<Clock1> createState() => _Clock1State();

  const Clock1({
    Key? key,
    this.size = 300,
    this.secondHandLength,
    this.minuteHandLength,
    this.hourHandLength,
    this.minuteIndicatorLength,
    this.hourIndicatorLength,
    this.borderColorWidth,
    this.secondHandWidth,
    this.minuteHandWidth,
    this.hourHandWidth,
    this.hourIndicatorWidth,
    this.minuteIndicatorWidth,
    this.bodyColor,
    this.borderColor,
    this.secondHandColor,
    this.minuteHandColor,
    this.hourHandColor,
    this.minuteIndicatorColor,
    this.hourIndicatorColor,
    this.centerCircleColor,
  }) : super(key: key);
}

class _Clock1State extends State<Clock1> {
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: _ClickPainter(
            secondHandLength: widget.secondHandLength ?? widget.size! / 3.5,
            minuteHandLength: widget.minuteHandLength ?? widget.size! / 4.0,
            hourHandLength: widget.hourHandLength ?? widget.size! / 5.5,
            minuteIndicatorLength: widget.minuteIndicatorLength ?? 0.20,
            hourIndicatorLength: widget.hourIndicatorLength ?? 0.40,
            borderColorWidth: widget.borderColorWidth ?? 16.0,
            secondHandWidth: widget.secondHandWidth ?? 10.0,
            minuteHandWidth: widget.minuteHandWidth ?? 14.0,
            hourHandWidth: widget.hourHandWidth ?? 16.0,
            hourIndicatorWidth: widget.hourIndicatorWidth ?? 4.0,
            minuteIndicatorWidth: widget.minuteIndicatorWidth ?? 2.0,
            bodyColor: widget.bodyColor ?? const Color(0xFF444974),
            borderColor: widget.borderColor ?? Colors.white,
            secondHandColor: widget.secondHandColor ?? Colors.orange,
            minuteHandColor: widget.minuteHandColor ?? Colors.blue,
            hourHandColor: widget.hourHandColor ?? Colors.pink,
            minuteIndicatorColor: widget.minuteIndicatorColor ?? Colors.grey,
            hourIndicatorColor: widget.hourIndicatorColor ?? Colors.white,
            centerCircleColor: widget.centerCircleColor ?? Colors.white,
          ),
          child: Container(),
        ),
      ),
    );
  }
}

class _ClickPainter extends CustomPainter {
  final DateTime _now = DateTime.now();
  final double secondHandLength;
  final double minuteHandLength;
  final double hourHandLength;
  final double minuteIndicatorLength;
  final double hourIndicatorLength;
  final double borderColorWidth;
  final double secondHandWidth;
  final double minuteHandWidth;
  final double hourHandWidth;
  final double hourIndicatorWidth;
  final double minuteIndicatorWidth;
  final Color bodyColor;
  final Color borderColor;
  final Color secondHandColor;
  final Color minuteHandColor;
  final Color hourHandColor;
  final Color minuteIndicatorColor;
  final Color hourIndicatorColor;
  final Color centerCircleColor;

  _ClickPainter({
    required this.secondHandLength,
    required this.minuteHandLength,
    required this.hourHandLength,
    required this.minuteIndicatorLength,
    required this.hourIndicatorLength,
    required this.borderColorWidth,
    required this.secondHandWidth,
    required this.minuteHandWidth,
    required this.hourHandWidth,
    required this.hourIndicatorWidth,
    required this.minuteIndicatorWidth,
    required this.bodyColor,
    required this.borderColor,
    required this.secondHandColor,
    required this.minuteHandColor,
    required this.hourHandColor,
    required this.minuteIndicatorColor,
    required this.hourIndicatorColor,
    required this.centerCircleColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawClockBody(canvas, size);
    _drawHourHand(canvas, size);
    _drawMinuteHand(canvas, size);
    _drawSecondsHand(canvas, size);
    _drawCenterCircle(canvas, size);
    _drawMinuteIndicators(canvas, size);
    _drawHourIndicators(canvas, size);
  }

  void _drawClockBody(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY);
    Offset center = Offset(centerX, centerY);
    Paint fillPaint = Paint()..color = bodyColor;
    Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderColorWidth;
    canvas.drawCircle(center, radius - 40, fillPaint);
    canvas.drawCircle(center, radius - 40, borderPaint);
  }

  void _drawCenterCircle(Canvas canvas, Size size) {
    Offset offset = Offset(size.width / 2, size.height / 2);
    Paint paint = Paint()..color = centerCircleColor;
    canvas.drawCircle(offset, 18.0, paint);
  }

  void _drawSecondsHand(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);
    Offset offset = Offset(
      centerX + secondHandLength * cos(_now.second * 6 * pi / 180),
      centerY + secondHandLength * sin(_now.second * 6 * pi / 180),
    );
    Paint paint = Paint();
    paint.color = secondHandColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = secondHandWidth;
    paint.strokeCap = StrokeCap.round;
    canvas.drawLine(center, offset, paint);
  }

  void _drawMinuteHand(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);
    Offset offset = Offset(
      centerX + minuteHandLength * cos(_now.minute * 6 * pi / 180),
      centerY + minuteHandLength * sin(_now.minute * 6 * pi / 180),
    );
    Paint paint = Paint();
    paint.color = minuteHandColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = minuteHandWidth;
    paint.strokeCap = StrokeCap.round;
    canvas.drawLine(center, offset, paint);
  }

  void _drawHourHand(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);
    Offset offset = Offset(
      centerX +
          hourHandLength * cos((_now.hour * 30 + _now.minute * 0.5) * pi / 180),
      centerY +
          hourHandLength * sin((_now.hour * 30 + _now.minute * 0.5) * pi / 180),
    );
    Paint paint = Paint();
    paint.color = hourHandColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = hourHandWidth;
    paint.strokeCap = StrokeCap.round;
    canvas.drawLine(center, offset, paint);
  }

  void _drawHourIndicators(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY);
    Paint paint = Paint()
      ..color = hourIndicatorColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = hourIndicatorWidth
      ..strokeCap = StrokeCap.round;
    for (double i = 0; i < 360; i += 30) {
      var x1 = centerX + radius * cos(i * pi / 180);
      var y1 = centerY + radius * sin(i * pi / 180);
      var x2 = centerX + (radius - 18) * cos(i * pi / 180);
      var y2 = centerY + (radius - 18) * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }
  }

  void _drawMinuteIndicators(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY);
    Paint paint = Paint()
      ..color = minuteIndicatorColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = minuteIndicatorWidth
      ..strokeCap = StrokeCap.round;
    for (double i = 0; i < 360; i += 6) {
      var x1 = centerX + (radius - 20) * cos(i * pi / 180);
      var y1 = centerY + (radius - 20) * sin(i * pi / 180);
      var x2 = centerX + (radius - 8) * cos(i * pi / 180);
      var y2 = centerY + (radius - 8) * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
