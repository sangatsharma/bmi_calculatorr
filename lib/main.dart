import 'package:flutter/material.dart';
import 'HomePage.dart';

const Color activeColor = Colors.white38;
const Color inActiveColor = Colors.white10;
const Color activeText = Colors.white;
const Color inActiveText = Colors.white;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
