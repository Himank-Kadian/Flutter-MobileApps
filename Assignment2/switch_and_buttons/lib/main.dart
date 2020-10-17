import 'package:flutter/material.dart';
import 'first_page.dart';
/**
 * @author: Himank Kadian
 * @version: 2020-OCT-17
 */
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0B1034),
        // the 0xFF is the transparency, then 0B Red, 10 Green, 34 Blue
        scaffoldBackgroundColor: Color(0xFF0B1034),
      ),
      //main page navigates to first page
      home: MyFirstPage(),
    );
  }
}
