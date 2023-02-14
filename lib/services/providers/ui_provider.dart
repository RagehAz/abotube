import 'package:abotube/services/helpers/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -----------------------------------------------------------------------------
/// => TAMAM
// final UiProvider _uiProvider = Provider.of<UiProvider>(context, listen: false);
class UiProvider extends ChangeNotifier {
  // -----------------------------------------------------------------------------

  /// MY BZ SCREEN CURRENT TAB

  // --------------------
  String _currentTab = 'Home';
  // --------------------
  String get currentTab => _currentTab;
  // --------------------
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
  // --------------------
  String get downloaderURL => _downloaderURl;
  // --------------------
  static String proGetDownloaderURL({
    @required bool listen,
  }) {
    final UiProvider _uiProvider = Provider.of<UiProvider>(getContext(), listen: listen);
    return _uiProvider.downloaderURL;
  }
  // --------------------
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
}
// -----------------------------------------------------------------------------
