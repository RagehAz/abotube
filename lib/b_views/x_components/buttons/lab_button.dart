import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:scale/scale.dart';
import 'package:super_box/super_box.dart';

class LabButton extends StatelessWidget {
  // --------------------------------------------------------------------------
  const LabButton({
    @required this.text,
    @required this.icon,
    @required this.onTap,
    Key key
  }) : super(key: key);
  // --------------------------------------------------------------------------
  final String icon;
  final String text;
  final Function onTap;
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --------------------
    const double _buttonHeight = 50;
    final double _referenceLength = Scale.screenShortestSide(context);
    final double _buttonWidth = _referenceLength * 0.7;
    // --------------------
    return SuperBox(
      height: _buttonHeight,
      width: _buttonWidth,
      text: text,
      color: Colorz.black200,
      icon: icon,
      iconSizeFactor: 0.6,
      margins: 5,
      textCentered: false,
      onTap: onTap,
    );
  }
  // --------------------------------------------------------------------------
}
