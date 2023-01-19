import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor:const Color(0xFFc2284c),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: const Color(0xFFF5F5F5),
    fontFamily: GoogleFonts.nunito().toString(),
    textTheme: TextTheme(
        headline1: TextStyle(
          color: const Color(0xFFc2284c),
          fontWeight: FontWeight.bold,
          fontSize: 30,
          fontFamily: GoogleFonts.nunito().toString()
        ),
        headline2: TextStyle(
          color: const Color(0xFFc2284c),
          fontWeight: FontWeight.bold,
          fontSize: 20,
           fontFamily: GoogleFonts.nunito().toString(),
        ),
        headline3: TextStyle(
         // color: Color(0xFFc2284c),
         color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
           fontFamily: GoogleFonts.nunito().toString(),
        ),
        headline4: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
           fontFamily: GoogleFonts.nunito().toString(),
        ),
        headline5: TextStyle(
          color: const Color(0xFFc2284c),
          fontWeight: FontWeight.bold,
          fontSize: 12,
           fontFamily: GoogleFonts.nunito().toString(),
        ),
        headline6: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 12,
           fontFamily: GoogleFonts.nunito().toString(),
        ),
        bodyText1: TextStyle(
          color: Colors.black12,
          fontWeight: FontWeight.normal,
          fontSize: 10,
           fontFamily: GoogleFonts.nunito().toString(),
        ),
        bodyText2: TextStyle(
          color:const Color(0xFFc2284c),
          fontWeight: FontWeight.normal,
          fontSize: 10,
           fontFamily: GoogleFonts.nunito().toString(),
        )),
  );
}