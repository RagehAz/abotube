import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:abotube/b_views/x_components/buttons/nav_bar_button.dart';
import 'package:abotube/b_views/x_components/nav_bar/nav_bar_box.dart';
import 'package:abotube/services/navigation/routing.dart';

class NavBar extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const NavBar({
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return const NavBarBox(
      children: <Widget>[

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

        /// YOUTUBE WEB PAGE
        NavBarButton(
          route: Routing.youtubeWebpage,
          icon: Iconz.comWebsite,
        ),

      ],
    );

  }
  /// --------------------------------------------------------------------------
}
