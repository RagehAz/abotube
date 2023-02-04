

import 'package:flutter/material.dart';

class NavigationService {
  // -----------------------------------------------------------------------------

  /// KEY

  // --------------------
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  // -----------------------------------------------------------------------------

  /// NAVIGATORS

  // --------------------
  ///
  Future<dynamic> navigateTo(String routeName){
    return navigatorKey.currentState.pushNamed(routeName);
  }
  // --------------------
  ///
  void goBack(){
    navigatorKey.currentState.pop();
  }
  // -----------------------------------------------------------------------------
  void f(){}
}
