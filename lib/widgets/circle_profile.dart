import 'package:flutter/material.dart';

class CircleProfile extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final bool accepted;
  final double acceptRight;
  final double acceptTop;
  final double acceptSize;

  const CircleProfile(
      {Key key,
      this.image,
      this.width,
      this.height,
      this.accepted,
      this.acceptRight,
      this.acceptTop,
      this.acceptSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(80),
              border: Border.all(
                color: Colors.grey,
                width: 2,
              )),
        ),
        accepted
            ? Positioned(
                top: acceptTop,
                right: acceptRight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: Color(0xff01d468),
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: acceptSize,
                  ),
                ),
              )
            : SizedBox()
      ],
    );
  }
}
