import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const Layout({
    @required this.child,
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  final Widget child;
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      /// INSETS
      resizeToAvoidBottomInset: false, /// if false : prevents keyboard from pushing pyramids up / bottom sheet
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Colorz.skyDarkBlue,

      body: child,
    );

  }
  /// --------------------------------------------------------------------------
}
