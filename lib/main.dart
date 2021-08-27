import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karma/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.openSansTextTheme(),
          appBarTheme: AppBarTheme(color: Color(0xffFF8400)),
          primarySwatch: Colors.orange,
        ),
        home: SplashScreen());
  }
}
