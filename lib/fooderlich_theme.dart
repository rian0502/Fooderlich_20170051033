import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooderlichTheme{
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
    headline1: GoogleFonts.openSans(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
    headline2: GoogleFonts.openSans(color: Colors.black, fontSize: 21, fontWeight: FontWeight.w700),
    headline3: GoogleFonts.openSans(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
    headline6: GoogleFonts.openSans(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
  );
  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
    headline1: GoogleFonts.openSans(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
    headline2: GoogleFonts.openSans(color: Colors.white, fontSize: 21, fontWeight: FontWeight.w700),
    headline3: GoogleFonts.openSans(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
    headline6: GoogleFonts.openSans(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
  );
  static ThemeData light(){
    return ThemeData(
      primarySwatch: Colors.amber,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      dividerColor: Colors.white54,
      textTheme: lightTextTheme,
    );
  }
  static ThemeData dark(){
    return ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      dividerColor: Colors.black12,
      textTheme: darkTextTheme,
    );
  }
}