import 'package:flutter/material.dart';

class CircleIndicator extends StatelessWidget {
  final int count;
  final int current;

  const CircleIndicator({Key key, this.count, this.current}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (var i = 0; i < count; i++)
          i == current ? gradientDot() : normalDot()
      ],
    );
  }

  Widget gradientDot() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient:
              LinearGradient(colors: [Color(0xff00a294), Color(0xff01d468)])),
    );
  }

  Widget normalDot() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        color: Colors.grey,
      ),
    );
  }
}
