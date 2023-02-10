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
    @required this.worksPerfect,
    Key key
  }) : super(key: key);
  // --------------------------------------------------------------------------
  final String icon;
  final String text;
  final Function onTap;
  final bool worksPerfect;
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --------------------
    const double _buttonHeight = 40;
    final double _referenceLength = Scale.screenShortestSide(context);
    final double _buttonWidth = _referenceLength * 0.7;
    // --------------------
    return SizedBox(
      width: Scale.screenWidth(context),
      height: _buttonHeight + 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          /// TEST STATE
          SuperBox(
            width: _buttonHeight / 2,
            height: _buttonHeight / 2,
            icon: worksPerfect ? Iconz.check : Iconz.xSmall,
            iconColor: worksPerfect ? Colorz.green255 : Colorz.red255,
            iconSizeFactor: 0.5,
            bubble: false,
            margins: 10,
          ),

          SuperBox(
            height: _buttonHeight,
            width: _buttonWidth,
            text: text,
            color: Colorz.black200,
            icon: icon,
            iconSizeFactor: 0.5,
            textScaleFactor: 1.4,
            textMaxLines: 2,
            textCentered: false,
            onTap: onTap,
          ),

          /// BALANCE SIZED BOX
          const SizedBox(
            width: _buttonHeight / 2,
            height: _buttonHeight / 2,
          ),

        ],
      ),
    );
  }
  // --------------------------------------------------------------------------
}
