import 'package:flutter/material.dart';
import 'package:sca_mentee/views/screens/home_screen.dart';
import 'package:stacked/stacked.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScren(),
    );
  }
}
