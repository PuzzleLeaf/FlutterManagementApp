import 'dart:math';

import 'package:flutter/material.dart';

class ProgressCircleIndicator extends StatefulWidget {
  final int completedPercentage;
  final double radius;
  final double fontSize;

  const ProgressCircleIndicator(
      {Key key, this.completedPercentage, this.radius, this.fontSize})
      : super(key: key);

  @override
  _ProgressCircleIndicatorState createState() =>
      _ProgressCircleIndicatorState();
}

class _ProgressCircleIndicatorState extends State<ProgressCircleIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .chain(CurveTween(curve: Curves.decelerate))
        .animate(_animationController)
          ..addListener(() {
            setState(() {

            });
          });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: ProgressCirclePainter(
        defaultCircleColor: Colors.grey[300],
        percentageCompletedCircleColor: Colors.green,
        completedPercentage: (widget.completedPercentage * _animation.value),
        circleWidth: 6,
        radius: widget.radius,
      ),
      child: Container(
        width: widget.radius * 2,
        height: widget.radius * 2,
        child: Center(
          child: Text(
            '${(widget.completedPercentage * _animation.value).round()}',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: widget.fontSize),
          ),
        ),
      ),
    );
  }
}

class ProgressCirclePainter extends CustomPainter {
  Color defaultCircleColor;
  Color percentageCompletedCircleColor;
  double completedPercentage;
  double circleWidth;
  double radius;

  ProgressCirclePainter(
      {this.defaultCircleColor,
      this.percentageCompletedCircleColor,
      this.completedPercentage,
      this.circleWidth,
      this.radius});

  getInnerPaint(Color color) {
    return Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleWidth - 2
      ..color = Colors.grey;
  }

  getPaint(Color color) {
    return Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleWidth;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint defaultCirclePaint = getInnerPaint(defaultCircleColor);
    Paint progressCirclePaint = getPaint(percentageCompletedCircleColor);

    final gradient = SweepGradient(
        startAngle: pi * 1.5,
        endAngle: pi * 3.5,
        tileMode: TileMode.repeated,
        colors: [
          Color(0xff01d468),
          Color(0xff00a294),
          Color(0xff01d468),
        ]);

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, defaultCirclePaint);

    progressCirclePaint.shader =
        gradient.createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        2 * pi * 0.01 * completedPercentage, false, progressCirclePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
