import 'package:flutter/material.dart';

class ProgressLineIndicator extends StatefulWidget {
  final int completedPercentage;
  final double strokeWidth;
  final double width;

  const ProgressLineIndicator(
      {Key key, this.completedPercentage,this.strokeWidth, this.width})
      : super(key: key);

  @override
  _ProgressCircleIndicatorState createState() =>
      _ProgressCircleIndicatorState();
}

class _ProgressCircleIndicatorState extends State<ProgressLineIndicator>
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
            setState(() {});
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
    return Container(
      width: widget.width,
      child: CustomPaint(
        foregroundPainter: ProgressLinePainter(
          defaultColor: Colors.grey[300],
          percentageCompletedCircleColor: Colors.green,
          completedPercentage: (widget.completedPercentage * _animation.value),
          strokeWidth: widget.strokeWidth
        ),
      ),
    );
  }
}

class ProgressLinePainter extends CustomPainter {
  Color defaultColor;
  Color percentageCompletedCircleColor;
  double completedPercentage;
  double strokeWidth;

  ProgressLinePainter({
    this.defaultColor,
    this.percentageCompletedCircleColor,
    this.completedPercentage,
    this.strokeWidth,
  });

  getInnerPaint(Color color) {
    return Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color;
  }

  getPaint(Color color) {
    return Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint defaultPaint = getInnerPaint(defaultColor);
    Paint progressPaint = getPaint(percentageCompletedCircleColor);

    final gradient = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        tileMode: TileMode.repeated,
        colors: [
          Color(0xff01d468),
          Color(0xff00a294),
          Color(0xff01d468),
        ]);

    canvas.drawLine(Offset(0,0), Offset(size.width, 0), defaultPaint);
    progressPaint.shader = gradient.createShader(Rect.fromLTRB(0, 0, size.width, 0));
    canvas.drawLine(Offset(0,0), Offset(size.width / 100 * completedPercentage, 0), progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
