import 'package:flutter/material.dart';
import 'package:managementapp/models/data.dart';
import 'package:managementapp/models/member.dart';
import 'package:managementapp/widgets/member_card.dart';

class TeamScreen extends StatelessWidget {
  var data = [
    Member.fromJson(memberData[0]),
    Member.fromJson(memberData[1]),
    Member.fromJson(memberData[2]),
    Member.fromJson(memberData[3]),
    Member.fromJson(memberData[4]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: <Widget>[
              Text(
                'Your dream team',
                style: Theme.of(context).appBarTheme.textTheme.title,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Group of 5 will make it happen.',
                style: Theme.of(context).appBarTheme.textTheme.subtitle,
              )
            ],
          ),
        ),
        body: ListView.builder(
          itemBuilder: (_, index) {
            return MemberCard(
              member: data[index],
            );
          },
          itemCount: data.length,
        ));
  }
}
