import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static const backgroundColor = Colors.black87;

  static Color iconColor = Colors.grey.withOpacity(.20);

  static List<Color> gridColors = [
    Colors.orangeAccent,
    Colors.pinkAccent,
    Colors.yellowAccent,
    Colors.redAccent,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.indigoAccent,
    Colors.purpleAccent,
  ];

  static TextStyle headerTitle = GoogleFonts.lato(
      color: Colors.white.withOpacity(.80),
      fontSize: 36,
      fontWeight: FontWeight.w900,
      letterSpacing: 1.5);

  static const TextStyle titleTextStyle = TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w900,
      overflow: TextOverflow.ellipsis,
      letterSpacing: 1);

  static TextStyle dateTextStyle = GoogleFonts.lato(
      color: Colors.black.withOpacity(.30), letterSpacing: 1.5, fontSize: 15);

  static TextStyle contentTextBlack = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w300,
      overflow: TextOverflow.ellipsis);
  static TextStyle contentTextWhite = GoogleFonts.lato(
    fontSize: 18,
    height: 1.5,
    color: Colors.white.withOpacity(.80),
    fontWeight: FontWeight.w300,
  );
}
