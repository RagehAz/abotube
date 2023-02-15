// ignore_for_file: constant_identifier_names
import 'dart:ui';
import 'package:flutter/material.dart';

class AboTubeTheme {
  // --------------------------------------------------------------------------

  const AboTubeTheme();

  // -----------------------------------------------------------------------------

  /// COLORS

  // --------------------
  static const Color youtubeColorRGB = Color.fromRGBO(255, 0, 0, 1);
  static const Color youtubeColor = Color(0xFFff0000);
  static const Color youtubeColorDark = Color(0xff8f0a0a);
  static const Color youtubeColorLight = Color(0xFFff3333);
  static const Color youtubeColorLighter = Color(0xFFff6666);
  static const Color youtubeColorLightest = Color(0xFFff9999);
  // --------------------
  /// BLACK
  static const Color blackDark = Color(0xFF000000);

  static const Color blackLight = Color.fromRGBO(15, 15, 15, 1);
  /// GREY
  static const Color greyDark = Color.fromRGBO(24, 24, 24, 1);
  static const Color greyMid = Color.fromRGBO(32, 32, 32, 1);
  static const Color greyLight = Color.fromRGBO(62, 62, 62, 1);
  /// WHITE
  static const Color youTubeWhite = Color(0xFFf1f1f1);
  // -----------------------------------------------------------------------------

  /// ICONS PATH

  // --------------------
  static const String _iconsPath = 'assets/icons';
  // -----------------------------------------------------------------------------

  /// SVG ICONS

  // --------------------
  static const String abotube_logo = '$_iconsPath/abotube_logo.svg';
  static const String abotube_logo_black_name = '$_iconsPath/abotube_logo_black_name.svg';
  static const String abotube_logo_white_box = '$_iconsPath/abotube_logo_white_box.svg';
  static const String abotube_logo_white_name = '$_iconsPath/abotube_logo_white_name.svg';
  // -----------------------------------------------------------------------------

  /// PNG ICONS

  // --------------------
  static const String abotube__raster_logo = '$_iconsPath/abotube_raster_logo.png';
  static const String abotube_raster_logo_white = '$_iconsPath/abotube_raster_logo_white.png';
  // -----------------------------------------------------------------------------

  /// FONTS PATH

  // --------------------
  static const String _fontsPath = 'assets/fonts';
  // -----------------------------------------------------------------------------

  /// FONTS

  // --------------------
  /// FONTS
  static const String youtubeFont = '$_fontsPath/trade_gothic_lt_bold_condensed_no_20.ttf';
  // -----------------------------------------------------------------------------
}
