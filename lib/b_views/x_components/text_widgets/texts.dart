import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:scale/scale.dart';
import 'package:super_text/super_text.dart';

class SmallText extends StatelessWidget {
  // -----------------------------------------------------------------------------
  const SmallText(
      this.text,
      {
        Key key
      }) : super(key: key);
  // -----------------------------------------------------------------------------
  final String text;
  // -----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return SuperText(
      text: text,
      weight: FontWeight.w100,
      italic: true,
      maxLines: 10,
      margins: const EdgeInsets.symmetric(horizontal: 25),
      textHeight: 30,
    );

  }
// -----------------------------------------------------------------------------
}

class MediumText extends StatelessWidget {
  // -----------------------------------------------------------------------------
  const MediumText(
      this.text,
      {
        Key key
      }) : super(key: key);
  // -----------------------------------------------------------------------------
  final String text;
  // -----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return SuperText(
      boxWidth: Scale.screenWidth(context),
      text: text,
      weight: FontWeight.w200,
      centered: false,
      margins: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
      maxLines: 100,
      font: BldrsThemeFonts.fontEnglishBody,
      textHeight: 30,
    );

  }
// -----------------------------------------------------------------------------
}

class BigText extends StatelessWidget {
// -----------------------------------------------------------------------------
  const BigText(
      this.text,
      {
        Key key
      }) : super(key: key);
// -----------------------------------------------------------------------------
  final String text;
// -----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return SuperText(
      boxWidth: Scale.screenWidth(context),
      text: text,
      weight: FontWeight.w600,
      textHeight: 45,
      centered: false,
      maxLines: 2,
      italic: true,
      textColor: Colorz.yellow125,
      margins: const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 20),
      font: BldrsThemeFonts.fontEnglishHeadline,
    );
  }
// -----------------------------------------------------------------------------
}
