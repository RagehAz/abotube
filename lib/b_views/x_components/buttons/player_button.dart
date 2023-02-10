import 'package:flutter/material.dart';
import 'package:super_box/super_box.dart';

class PlayerButton extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const PlayerButton({
    @required this.icon,
    @required this.onTap,
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  final String icon;
  final Function onTap;
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return SuperBox(
      height: 50,
      width: 50,
      icon: icon,
      iconSizeFactor: 0.7,
      margins: 5,
      onTap: onTap,
    );

  }
  /// --------------------------------------------------------------------------
}
