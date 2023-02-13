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
    _currentTab = tab;

    if (notify == true){
      notifyListeners();
    }

  }
  // -----------------------------------------------------------------------------
}
// -----------------------------------------------------------------------------
