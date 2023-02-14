import 'package:abotube/b_views/a_screens/a_main_screen/pages/a_home_page.dart';
import 'package:abotube/b_views/a_screens/a_main_screen/pages/b_translator_page.dart';
import 'package:abotube/b_views/a_screens/a_main_screen/pages/c_downoader_page.dart';
import 'package:abotube/b_views/a_screens/a_main_screen/pages/x_lab_page.dart';
import 'package:abotube/b_views/x_components/buttons/tab_button.dart';
import 'package:abotube/b_views/x_components/layout/view_page.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';

class AboTubeTabs {
  // -----------------------------------------------------------------------------

  const AboTubeTabs();

  // -----------------------------------------------------------------------------

    /// ALL TABS

  // --------------------
  static const String homeTabTitle = 'Home';
  static const String translatorTabTitle = 'Translator';
  static const String downloader = 'Downloader';
  static const String labPageTitle = 'Lab';
  // --------------------
  static const List<Widget> allTabs = <Widget>[

    /// HOME
    Tab(
      iconMargin: EdgeInsets.zero,
      child: TabButton(
        text: homeTabTitle,
        icon: Iconz.bxPropertiesOff,
        iconSizeFactor: 1,
      ),
    ),

    /// TRANSLATOR
    Tab(
      iconMargin: EdgeInsets.zero,
      child: TabButton(
        text: translatorTabTitle,
        icon: Iconz.plus,
        iconSizeFactor: 0.5,
      ),
    ),

    /// DOWNLOADER
    Tab(
      iconMargin: EdgeInsets.zero,
      child: TabButton(
        text: downloader,
        icon: Iconz.comYoutube,
        iconSizeFactor: 0.5,
        colorize: true,
      ),
    ),

    /// LAB
    Tab(
      iconMargin: EdgeInsets.zero,
      child: TabButton(
        text: labPageTitle,
        icon: Iconz.lab,
        iconSizeFactor: 0.5,
      ),
    ),


  ];
  // --------------------
  static const List<Widget> allViews = <Widget>[

    /// HOME
    ViewPage(
      title: homeTabTitle,
      child: HomePage(),
    ),

    /// TRANSLATOR
    ViewPage(
      title: translatorTabTitle,
      child: TranslatorPage(),
    ),

    /// DOWNLOADER
    ViewPage(
      title: downloader,
      child: DownloaderPage(),
    ),

    /// LAB
    ViewPage(
      title: labPageTitle,
      child: LabPage(),
    ),

  ];
  // -----------------------------------------------------------------------------

    /// TAB BY INDEX

  // --------------------
    static String getTabByIndex({
    @required int index,
  }){

    switch (index){
      case 0: return homeTabTitle; break;
      case 1: return translatorTabTitle; break;
      case 2: return downloader; break;
      case 3: return labPageTitle; break;
      default: return null;
    }

  }
  // -----------------------------------------------------------------------------
}
