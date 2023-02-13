import 'package:abotube/b_views/x_components/bars/app_bar/abo_tube_app_bar.dart';
import 'package:abotube/services/theme/abo_tube_colors.dart';
import 'package:flutter/material.dart';
import 'package:scale/scale.dart';
import 'package:abotube/b_views/a_screens/a_main_screen/a_main_screen.dart';

class NavBarBox extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const NavBarBox({
    @required this.children,
    Key key
  }) : super(key: key);

  final List<Widget> children;
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    final double _screenWidth = Scale.screenWidth(context);

    return SizedBox(
      width: _screenWidth,
      height: Layout.navBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          /// LINE
          const BarLine(),

        Container(
          width: _screenWidth,
          height: AboTubeAppBar.appbarClearHeight,
          color: AboTubeTheme.blackLight,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: children,
          ),
        ),

        ]
      ),
    );

  }
  /// --------------------------------------------------------------------------
}
