import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();
  static const int _mcgpalette0PrimaryValue = 0xFFFF2D9A;
  static const Color primary = Color(_mcgpalette0PrimaryValue);
  static const Color white = Color(0xFFFFFFFF);
  static const Color orange = Color(0xFFF5B544);

  static const Color grey = Color(0xff979797);
  static const Color greyF3 = Color(0xFFF5F5F6);
  static const Color greyF4 = Color(0xFF898E96);
  static const Color greyEf = Color(0xFFCCCDCE);
  static const Color greyF5 = Color(0xFFF2F4F7);
  static const Color greyF6 = Color(0xFF898E96);
  

  static const Color dark = Color(0xff1a1a1a);
  static const Color darkGrey = Color(0xff7F7F7F);
  static const Color pinButtonColor = Color(0xffEFEFF1);
  static const Color whiteFc = Color(0xFFFCFCFC);
  static const Color greyBackFc = Color(0xFFF6F6F6);

  static const Color inputColor = Color(0xfff6f6f6);
  static const Color lightGreen = Color(0xffE7FCF0);
  static const Color lightRed = Color(0xffFFF0EC);
  static const Color red = Color(0xffFC440F);
  static const Color textColor = Color(0xff404040);
  static const Color canvasColor = Color(0xffFAFAFA);
  static const Color bgColor2 = Color.fromARGB(255, 237, 237, 237);

  static const Color lightBlue = Color(0xffE9F7FE);
  static const Color pink = Color(0xFFF9F2EC);
  static const Color violet = Color(0xFFF0EDFB);
  static const Color greyTextOrderInfo = Color(0xFF9DA4B1);
  static Color blackTextOrderInfo = const Color(0xFF091B3D);
  static Color backIconCard = const Color(0xFF9DA4B1);
  static Color linesOrderInfo = const Color(0xFFEFEFEF);

  static const MaterialColor mcgpalette0 =
      MaterialColor(_mcgpalette0PrimaryValue, <int, Color>{
    50: Color(0xFFEAF3E8),
    100: Color(0xFFCAE0C5),
    200: Color(0xFFA7CC9F),
    300: Color(0xFF83B778),
    400: Color(0xFF69A75B),
    500: Color(_mcgpalette0PrimaryValue),
    600: Color(0xFF479038),
    700: Color(0xFF3D8530),
    800: Color(0xFF357B28),
    900: Color(0xFF256A1B),
  });

  static Color getRandomColor(int i) {
    return <Color>[
      pink,
      lightBlue,
      violet,
    ][i % 3];
  }
}
