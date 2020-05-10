import 'package:flutter/material.dart';
import 'package:managementapp/models/member.dart';
import 'package:managementapp/screens/member_screen.dart';
import 'package:managementapp/widgets/circle_profile.dart';
import 'package:managementapp/widgets/progress_circle_indicator.dart';

class MemberCard extends StatelessWidget {
  final Member member;

  const MemberCard({Key key, this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 5,
                offset: Offset(0, 5),
              )
            ],
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff00a294),
                Color(0xff01d468),
              ],
            ),
          ),
          child: Dismissible(
            key: Key(member.name),
            background: Container(
              padding: const EdgeInsets.only(left: 25),
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
            confirmDismiss: (dismissDirection) async {
              if (dismissDirection == DismissDirection.startToEnd) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return MemberScreen(member: member,);
                    },
                  ),
                );
              }

              return false;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              decoration: BoxDecoration(
                color: Color(0xfffbfafd),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: member.name,
                    child: CircleProfile(
                      image: member.image,
                      width: 50,
                      height: 50,
                      acceptSize: 15,
                      acceptRight: 0,
                      acceptTop: 2,
                      accepted: member.accepted,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        member.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        member.role,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  ProgressCircleIndicator(
                    completedPercentage: member.goalRatio,
                    radius: 30,
                    fontSize: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
