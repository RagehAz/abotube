import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:scale/scale.dart';
import 'package:video_translator/b_views/x_components/layout/layout.dart';

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

    return Container(
      width: _screenWidth,
      height: Layout.navBarHeight,
      color: Colorz.white20,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: children,
      ),
    );

  }
  /// --------------------------------------------------------------------------
}
