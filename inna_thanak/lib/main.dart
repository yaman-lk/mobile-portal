import 'package:flutter/material.dart';
import 'package:inna_thanak/Screens/Users/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF192A56),
      ),
      home: HomeScreen(),
    );
  }
}
