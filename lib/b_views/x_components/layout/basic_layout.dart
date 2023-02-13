import 'package:abotube/b_views/x_components/bars/app_bar/abo_tube_app_bar.dart';
import 'package:abotube/services/theme/abo_tube_colors.dart';
import 'package:flutter/material.dart';

class BasicLayout extends StatelessWidget {
  // -----------------------------------------------------------------------------
  const BasicLayout({
    @required this.body,
    Key key
  }) : super(key: key);
  // -----------------------------------------------------------------------------
  final Widget body;
  // -----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return SafeArea(

        child: Scaffold(
          appBar: AboTubeAppBar.getBackAppBar(),

          /// INSETS
          resizeToAvoidBottomInset: false, /// if false : prevents keyboard from pushing pyramids up / bottom sheet
          // resizeToAvoidBottomPadding: false,
          backgroundColor: AboTubeTheme.blackLight,

          body: body,
        ),
        );

  }
  // -----------------------------------------------------------------------------
}
