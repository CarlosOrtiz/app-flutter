import 'package:flutter/material.dart';
import 'others/EasyJsonParse/JsonParceDemo.dart';
import 'others/EasyJsonParse/Signup.dart';

void main() {
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Family",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Poppins",
        ),
        home: JsonParseDemo());
  }
}
