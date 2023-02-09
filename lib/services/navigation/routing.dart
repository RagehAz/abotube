import 'package:flutter/material.dart';
import 'package:video_translator/b_views/a_screens/x_lab_screen.dart';
import 'package:video_translator/services/navigation/navigators.dart';
import 'package:video_translator/b_views/a_screens/b_home_screen.dart';

class Routing {
  // -----------------------------------------------------------------------------

  const Routing();

  // -----------------------------------------------------------------------------

  /// ROUTE NAMES

  // --------------------
  static const String homeRoute = '/home';
  static const String labRoute = '/lab';
  static const String terms = '/terms';
  static const String privacy = '/privacy';
  // -----------------------------------------------------------------------------

  /// ROUTER

  // --------------------
  /// TESTED : WORKS PERFECT
  static Route<dynamic> allRoutes(RouteSettings settings) {

    switch (settings.name) {

    /// HOME
      case homeRoute:
        return Nav.fadeToScreen(const HomeScreen(), settings);
        break;
    /// LAB
      case labRoute:
        return Nav.fadeToScreen(const LabScreen(), settings);
        break;

    // /// TERMS
    //   case terms:
    //     return Nav.fadeToScreen(const TermsScreen(), settings);
    //     break;
    // /// PRIVACY
    //   case privacy:
    //     return Nav.fadeToScreen(const PrivacyScreen(), settings);
    //     break;

    }
    return Nav.fadeToScreen(const HomeScreen(), settings);
  }
  // -----------------------------------------------------------------------------

  /// MAP

  // --------------------
  static Map<String, Widget Function(BuildContext)> routesMap = {
    homeRoute: (context) => const HomeScreen(),
    labRoute: (context) => const LabScreen(),
    // terms: (context) => const TermsScreen(),
    // privacy: (context) => const PrivacyScreen(),
  };
  // -----------------------------------------------------------------------------
}
