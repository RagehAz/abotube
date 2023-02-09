import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:video_translator/b_views/a_screens/a_app_starter.dart';
// -----------------------------------------------------------------------------

/// BLOGGING

// --------------------
/// TESTED : WORKS PERFECT
void blog(dynamic msg, {String invoker}){

  assert((){
    // ignore: avoid_print
    log(msg.toString());
    return true;
  }(), '_');

  /// NOUR IDEA
  /*
    extension Printer on dynamic {
      void log() {
        return dev.log(toString());
      }
    }
     */

}
// --------------------
/// TESTED : WORKS PERFECT
void setNotifier({
  @required ValueNotifier<dynamic> notifier,
  @required bool mounted,
  @required dynamic value,
  bool addPostFrameCallBack = false,
  Function onFinish,
  bool shouldHaveListeners = false,
}){

  if (mounted == true){
    // blog('setNotifier : setting to ${value.toString()}');

    if (notifier != null){

      if (value != notifier.value){

        /// ignore: invalid_use_of_protected_member
        if (shouldHaveListeners == false || notifier.hasListeners == true){

          if (addPostFrameCallBack == true){
            WidgetsBinding.instance.addPostFrameCallback((_){
              notifier.value  = value;
              if(onFinish != null){
                onFinish();
              }
            });
          }

          else {
            notifier.value  = value;
            if(onFinish != null){
              onFinish();
            }
          }

        }

      }

    }

  }

}
// -----------------------------------------------------------------------------

/// CONTEXT

// --------------------
BuildContext getContext(){
  return AppStarter.navigatorKey.currentContext;
}
// --------------------
String getRoute(BuildContext context){
  return ModalRoute.of(context)?.settings?.name;
}
// -----------------------------------------------------------------------------
/// TESTED : WORKS PERFECT
bool checkStringIsEmpty(String string) {

  if (string == null || string == '' || string.isEmpty == true

  ) {
    return true;
  }

  else {
    return false;
  }

}
// --------------------
/// TESTED : WORKS PERFECT
bool stringContainsSubString({
  @required String string,
  @required String subString,
}) {
  bool _itContainsIt = false;

  if (string != null && subString != null) {
    if (
    string.toLowerCase().contains(subString?.toLowerCase())
    ) {
      _itContainsIt = true;
    }
  }

  return _itContainsIt;
}
// --------------------
/// TESTED : WORKS PERFECT
/*
Future<bool> launchURL(String link) async {

  Uri _uri;
  bool _success = false;

  if (checkStringIsEmpty(link) == false){

    /// LINK SHOULD CONTAIN 'http://' to work
    final bool _containsHttp = stringContainsSubString(
      string: link,
      subString: 'http://',
    );

    final bool _containsHttps = stringContainsSubString(
      string: link,
      subString: 'https://',
    );

    if (_containsHttp == true || _containsHttps == true){
      _uri = Uri.parse(link);
    }
    else {
      _uri = Uri.parse('http://$link');
    }

    if (await Launch.canLaunchUrl(_uri) == true) {

      unawaited(Launch.launchUrl(_uri));
      _success = true;
    }
    else {
      // blog('Can Not launch link');
    }

  }

  return _success;
}
 */
// -----------------------------------------------------------------------------
