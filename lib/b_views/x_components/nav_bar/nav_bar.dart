import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:scale/scale.dart';
import 'package:video_translator/b_views/x_components/buttons/nav_bar_button.dart';
import 'package:video_translator/b_views/x_components/layout/layout.dart';
import 'package:video_translator/services/navigation/routing.dart';

class NavBar extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const NavBar({Key key}) : super(key: key);
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    final double _screenWidth = Scale.screenWidth(context);
    // final double _viewHeight = Layout.getViewHeight();

    return Container(
      width: _screenWidth,
      height: Layout.navBarHeight,
      color: Colorz.white20,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: const <Widget>[

          /// LAB SCREEN
          NavBarButton(
            icon: Iconz.bxPropertiesOff,
            route: Routing.homeRoute,
          ),

          /// LAB SCREEN
          NavBarButton(
            route: Routing.labRoute,
            icon: Iconz.lab,
          ),

          /// TRANSLATOR SCREEN
          NavBarButton(
            route: Routing.translator,
            icon: Iconz.language,
          ),

        ],
      ),
    );
  }

  /// --------------------------------------------------------------------------
}
