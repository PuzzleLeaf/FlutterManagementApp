import 'package:flutter/material.dart';
import 'package:managementapp/models/member.dart';
import 'package:managementapp/widgets/circle_indicator.dart';
import 'package:managementapp/widgets/circle_profile.dart';
import 'package:managementapp/widgets/progress_circle_indicator.dart';
import 'package:managementapp/widgets/progress_line_indicator.dart';

class MemberScreen extends StatefulWidget {
  final Member member;

  const MemberScreen({Key key, this.member}) : super(key: key);

  @override
  _MemberScreenState createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  PageController _goalPageController;
  int _goalPageCurrent = 0;

  @override
  void initState() {
    super.initState();
    _goalPageController = PageController(viewportFraction: 0.9);
  }

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(colors: [
      Color(0xff00a294),
      Color(0xff01d468),
    ]).createShader(Rect.fromLTWH(0, 0, 150, 300));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffbfafd),
        centerTitle: true,
        title: Column(
          children: <Widget>[
            Text(
              widget.member.name,
              style: Theme.of(context).appBarTheme.textTheme.title,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.member.role,
              style: Theme.of(context).appBarTheme.textTheme.subtitle,
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
                color: Color(0xfffbfafd),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(80),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Hero(
                      tag: widget.member.name,
                      child: CircleProfile(
                        image: widget.member.image,
                        width: 120,
                        height: 120,
                        acceptSize: 20,
                        acceptTop: 10,
                        acceptRight: 5,
                        accepted: widget.member.accepted,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    widget.member.accepted
                        ? Text(
                            'Accepted!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                foreground: Paint()..shader = linearGradient),
                          )
                        : Text(
                            'Not Accepted',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[500]),
                          ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    ProgressCircleIndicator(
                      completedPercentage: widget.member.goalRatio,
                      radius: 55,
                      fontSize: 30,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '* personal goals ratio',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Personal goals',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'See all >',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100,
                  child: PageView.builder(
                    controller: _goalPageController,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[400],
                                blurRadius: 5,
                                offset: Offset(0, 5),
                              )
                            ]),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'iOS ARKit 2',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text('3/5')
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ProgressLineIndicator(
                              completedPercentage: (3 / 5 * 100).toInt(),
                              width: MediaQuery.of(context).size.width * 0.8,
                              strokeWidth: 5,
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: 5,
                    onPageChanged: (page) {
                      setState(() {
                        _goalPageCurrent = page;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                CircleIndicator(
                  count: 5,
                  current: _goalPageCurrent,
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Current tasks',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Calendar >',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 180,
                  child: PageView.builder(
                    controller: _goalPageController,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[400],
                                blurRadius: 5,
                                offset: Offset(0, 5),
                              )
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    color: Colors.greenAccent,
                                  ),
                                  child: Icon(
                                    Icons.arrow_upward,
                                    color: Colors.green,
                                    size: 18,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'TIS-12',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[300],
                                  ),
                                  child: Text(
                                    'In progress',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Mobile app UX Review',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.watch_later,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                                Text(
                                  '26-04 (Friday)',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Text(
                                  '14 comments',
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: 5,
                    onPageChanged: (page) {
                      setState(() {
                        _goalPageCurrent = page;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                CircleIndicator(
                  count: 5,
                  current: _goalPageCurrent,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
