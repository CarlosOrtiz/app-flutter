import 'package:flutter/material.dart';
import 'others/EasyJsonParse/JsonParceDemo.dart';

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
          primarySwatch: Colors.blue,
        ),
        home: JsonParseDemo());
  }
}
