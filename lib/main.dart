import 'package:flutter/material.dart';
import 'package:questions/layout.dart';
import 'package:questions/writen_answer.dart';

import 'layoutscreen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'اسئلة حسان',


      home: Layout(),
    );
  }
}
