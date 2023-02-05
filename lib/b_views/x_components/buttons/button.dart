import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:scale/scale.dart';
import 'package:super_box/super_box.dart';

class Button extends StatelessWidget {
  // --------------------------------------------------------------------------
  const Button({
    @required this.text,
    @required this.icon,
    @required this.onTap,
    Key key
  }) : super(key: key);
  // --------------------------------------------------------------------------
  final String text;
  final String icon;
  final Function onTap;
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    final double _referenceLength = Scale.screenShortestSide(context);
    final double _buttonHeight = _referenceLength * 0.08;
    final double _buttonWidth = _referenceLength * 0.4;

    return SuperBox(
      height: _buttonHeight,
      width: _buttonWidth,
      verse: text,
      icon: icon,
      iconSizeFactor: 0.5,
      color: Colorz.black255,
      onTap: onTap,
    );

  }
// --------------------------------------------------------------------------
}
