import 'package:abotube/a_models/video_model.dart';
import 'package:abotube/b_views/a_screens/a_main_screen/tabs.dart';
import 'package:abotube/services/helpers/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -----------------------------------------------------------------------------
/// => TAMAM
// final UiProvider _uiProvider = Provider.of<UiProvider>(context, listen: false);
class UiProvider extends ChangeNotifier {
  // -----------------------------------------------------------------------------

  /// TAB BAR CONTROLLER

  // --------------------
  TabController _tabBarController;
  TabController get tabBarController => _tabBarController;
  // --------------------
  /// TASK : TEST ME
  static void proInitializeTabBarController({
    @required TickerProvider vsync,
  }){
    final UiProvider _uiProvider = Provider.of<UiProvider>(getContext(), listen: false);
    _uiProvider.initializeTabBarController(
      vsync: vsync,
    );
  }
  // --------------------
  /// TASK : TEST ME
  void initializeTabBarController({
    @required TickerProvider vsync,
  }){

    _tabBarController = TabController(
      length: AboTubeTabs.allTabs.length,
      vsync: vsync,
    );

    _tabBarController.addListener(() {
      UiProvider.proSetCurrentTab(
          tab: AboTubeTabs.getTabByIndex(index: _tabBarController.index),
          notify: true,
      );

    });

  }
  // --------------------
  /// TASK : TEST ME
  static void proDisposeTabBarController(){
    final UiProvider _uiProvider = Provider.of<UiProvider>(getContext(), listen: false);
    _uiProvider._tabBarController.dispose();
  }
  // --------------------
  /// TASK : TEST ME
  static TabController proGetTabController({
    @required bool listen,
  }){
    final UiProvider _uiProvider = Provider.of<UiProvider>(getContext(), listen: listen);
    return _uiProvider.tabBarController;
  }
  // --------------------
  /// TASK : TEST ME
  static void proSetTabBarController({
    @required TabController controller,
    @required bool notify,
  }) {
    final UiProvider _uiProvider = Provider.of<UiProvider>(getContext(), listen: false);
    _uiProvider.setTabBarController(
      controller: controller,
      notify: notify,
    );
  }
  // --------------------
  /// TASK : TEST ME
  void setTabBarController({
    @required TabController controller,
    @required bool notify,
  }){

    if (_tabBarController != controller) {
      _tabBarController = controller;

      if (notify == true) {
        notifyListeners();
      }
    }

  }
  // -----------------------------------------------------------------------------

  /// CURRENT TAB

  // --------------------
  String _currentTab = 'Home';
  String get currentTab => _currentTab;
  // --------------------
  /// TASK : TEST ME
  static void proSetCurrentTab({
    @required String tab,
    @required bool notify,
  }) {
    final UiProvider _uiProvider = Provider.of<UiProvider>(getContext(), listen: false);
    _uiProvider.setCurrentTab(
      tab: tab,
      notify: notify,
    );
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  void setCurrentTab({
    @required String tab,
    @required bool notify,
  }){

    if (_currentTab != tab) {
      _currentTab = tab;

      if (notify == true) {
        notifyListeners();
      }
    }

  }
  // -----------------------------------------------------------------------------

  /// DOWNLOADER URL

  // --------------------
  String _downloaderURl;
  String get downloaderURL => _downloaderURl;
  // --------------------
  /// TASK : TEST ME
  static String proGetDownloaderURL({
    @required bool listen,
  }) {
    final UiProvider _uiProvider = Provider.of<UiProvider>(getContext(), listen: listen);
    return _uiProvider.downloaderURL;
  }
  // --------------------
  /// TASK : TEST ME
  static void proSetDownloaderURL({
    @required String url,
    @required bool notify,
  }) {
    final UiProvider _uiProvider = Provider.of<UiProvider>(getContext(), listen: false);
    _uiProvider.setDownloaderURL(
      url: url,
      notify: notify,
    );
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  void setDownloaderURL({
    @required String url,
    @required bool notify,
  }){
    if (_downloaderURl != url) {
      _downloaderURl = url;

      if (notify == true) {
        notifyListeners();
      }
    }
  }
   // -----------------------------------------------------------------------------

  /// CURRENT DRAFT VIDEO

  // --------------------
  VideoModel _currentDraft;
  VideoModel get currentDraft => _currentDraft;
  // --------------------
  /// TASK : TEST ME
  static void proSetCurrentDraft({
    @required VideoModel videoModel,
    @required bool notify,
  }) {
    final UiProvider _uiProvider = Provider.of<UiProvider>(getContext(), listen: false);
    _uiProvider.setCurrentDraft(videoModel: videoModel, notify: notify);
  }
  // --------------------
  /// TASK : TEST ME
  void setCurrentDraft({
    @required VideoModel videoModel,
    @required bool notify,
  }) {

    if (videoModel != null) {
      if (_currentDraft != videoModel) {
        _currentDraft = videoModel;

        if (notify == true) {
          notifyListeners();
        }
      }
    }

  }
  // --------------------
  /// TASK : TEST ME
  static VideoModel proGetCurrentDraft(){
    final UiProvider _uiProvider = Provider.of<UiProvider>(getContext(), listen: false);
    return _uiProvider.currentDraft;
  }
  // -----------------------------------------------------------------------------
}
// -----------------------------------------------------------------------------
