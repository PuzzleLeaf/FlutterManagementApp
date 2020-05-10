import 'package:flutter/material.dart';
import 'package:managementapp/screens/team_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Management App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffe9EBF1),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.grey,
          ),
          color: Colors.transparent,
          elevation: 0.0,
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.black,
              fontSize: 20,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
            ),
            subtitle: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            )
          )
        )
      ),
      home: TeamScreen()
    );
  }
}
