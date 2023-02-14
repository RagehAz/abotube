import 'package:flutter/material.dart';
import 'package:abotube/b_views/a_screens/a_main_screen/pages/b_translator_page.dart';
import 'package:abotube/b_views/a_screens/a_main_screen/pages/x_lab_page.dart';
import 'package:abotube/b_views/a_screens/a_main_screen/pages/c_downoader_page.dart';
import 'package:abotube/services/navigation/navigators.dart';
import 'package:abotube/b_views/a_screens/a_main_screen/pages/a_home_page.dart';

class Routing {
  // -----------------------------------------------------------------------------

  const Routing();

  // -----------------------------------------------------------------------------

  /// ROUTE NAMES

  // --------------------
  static const String homeRoute = '/home';
  static const String labRoute = '/lab';
  static const String translator = '/translator';
  static const String youtubeWebpage = '/youtubeWebpage';
  // -----------------------------------------------------------------------------

  /// ROUTER

  // --------------------
  /// TESTED : WORKS PERFECT
  static Route<dynamic> allRoutes(RouteSettings settings) {

    switch (settings.name) {

    /// HOME
      case homeRoute:
        return Nav.fadeToScreen(const HomePage(), settings);
        break;
    /// LAB
      case labRoute:
        return Nav.fadeToScreen(const LabPage(), settings);
        break;
    /// TRANSLATOR
      case translator:
        return Nav.fadeToScreen(const TranslatorPage(), settings);
        break;
    /// TRANSLATOR
      case youtubeWebpage:
        return Nav.fadeToScreen(const DownloaderPage(), settings);
        break;


    }
    return Nav.fadeToScreen(const HomePage(), settings);
  }
  // -----------------------------------------------------------------------------

  /// MAP

  // --------------------
  static Map<String, Widget Function(BuildContext)> routesMap = {
    // homeRoute: (context) => const HomeScreen(),
    // labRoute: (context) => const LabPage(),
    // translator: (context) => const TranslatorPage(),
    // youtubeWebpage: (context) => const YoutubeWebPage(),
  };
  // -----------------------------------------------------------------------------
}
