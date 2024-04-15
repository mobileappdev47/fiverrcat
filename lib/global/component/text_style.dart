import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../imports.dart';

enum PcTextSize {
  b1,
  sh2,
  button,
  caption,

}

class PcTextStyle {
  static Function _fontFamily = GoogleFonts.ibmPlexSans;

  static Map<int, FontWeight> _defaultFontWeight = {
    100: FontWeight.w100,
    200: FontWeight.w200,
    300: FontWeight.w300,
    400: FontWeight.w300,
    500: FontWeight.w400,
    600: FontWeight.w500,
    700: FontWeight.w600,
    800: FontWeight.w700,
    900: FontWeight.w800,
  };

  static Map<PcTextSize, double> _defaultTextSize = {

    PcTextSize.sh2: 15,
    PcTextSize.b1: 16,

    PcTextSize.button: 13,
    PcTextSize.caption: 12,

  };


  static final Map<PcTextSize, double> _defaultLetterSpacing = {

    PcTextSize.sh2: 0.15,
    PcTextSize.b1: 0.15,

    PcTextSize.button: 0.15,
    PcTextSize.caption: 0.15,

  };


  static TextStyle getStyle({TextStyle? textStyle,
    int fontWeight = 500,
    bool muted = false,
    bool xMuted = false,
    double letterSpacing = 0.15,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize}) {
    double? finalFontSize = fontSize ?? textStyle!.fontSize;

    Color? finalColor;
    if (color == null) {
      Color themeColor = AppTheme.pcBlue1;
      finalColor = xMuted
          ? themeColor.withAlpha(160)
          : (muted ? themeColor.withAlpha(200) : themeColor);
    } else {
      finalColor = xMuted
          ? color.withAlpha(160)
          : (muted ? color.withAlpha(200) : color);
    }

    return _fontFamily(
        fontSize: finalFontSize,
        fontWeight: _defaultFontWeight[fontWeight] ?? FontWeight.w400,
        letterSpacing: letterSpacing,
        color: finalColor,
        decoration: decoration,
        height: height,
        wordSpacing: wordSpacing);
  }



  static TextStyle b1(
      {TextStyle? textStyle,
        int fontWeight = 500,
        bool muted = false,
        bool xMuted = false,
        double? letterSpacing,
        Color? color,
        TextDecoration decoration = TextDecoration.none,
        double? height,
        double wordSpacing = 0,
        double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[PcTextSize.b1],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
        letterSpacing ?? _defaultLetterSpacing[PcTextSize.b1] ?? 0.15,
        fontWeight: fontWeight,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }
  static TextStyle caption(
      {TextStyle? textStyle,
        int fontWeight = 400,
        bool muted = false,
        bool xMuted = false,
        double? letterSpacing = 0,
        Color? color,
        TextDecoration decoration = TextDecoration.none,
        double? height,
        double wordSpacing = 0,
        double? fontSize}) {
    return getStyle(
        fontSize: fontSize ?? _defaultTextSize[PcTextSize.caption],
        color: color,
        height: height,
        muted: muted,
        letterSpacing:
        letterSpacing ?? _defaultLetterSpacing[PcTextSize.caption] ?? 0.15,
        fontWeight: fontWeight,
        decoration: decoration,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
        xMuted: xMuted);
  }

  static void changeFontFamily(Function fontFamily) {
    PcTextStyle._fontFamily = fontFamily;
  }

  static void changeDefaultFontWeight(Map<int, FontWeight> defaultFontWeight) {
    PcTextStyle._defaultFontWeight = defaultFontWeight;
  }

  static void changeDefaultTextSize(Map<PcTextSize, double> defaultTextSize) {
    PcTextStyle._defaultTextSize = defaultTextSize;
  }

  static Map<PcTextSize, double> get defaultTextSize => _defaultTextSize;

  static Map<PcTextSize, double> get defaultLetterSpacing =>
      _defaultLetterSpacing;



  static Map<int, FontWeight> get defaultFontWeight => _defaultFontWeight;

}