import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iqfareez\'s Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: GoogleFonts.sourceSansPro().fontFamily,
      ),
      home: MyHomePage(),
    );
  }
}
