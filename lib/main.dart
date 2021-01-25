import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iqfareez Portfolio',
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          textTheme: GoogleFonts.sourceSansProTextTheme()),
      home: MyHomePage(),
    );
  }
}
