import 'package:flutter/material.dart';
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
// Future<bool> launchURL(String link) async {
//
//   Uri _uri;
//   bool _success = false;
//
//   if (checkStringIsEmpty(link) == false){
//
//     /// LINK SHOULD CONTAIN 'http://' to work
//     final bool _containsHttp = stringContainsSubString(
//       string: link,
//       subString: 'http://',
//     );
//
//     final bool _containsHttps = stringContainsSubString(
//       string: link,
//       subString: 'https://',
//     );
//
//     if (_containsHttp == true || _containsHttps == true){
//       _uri = Uri.parse(link);
//     }
//     else {
//       _uri = Uri.parse('http://$link');
//     }
//
//     if (await Launch.canLaunchUrl(_uri) == true) {
//
//       unawaited(Launch.launchUrl(_uri));
//       _success = true;
//     }
//     else {
//       // blog('Can Not launch link');
//     }
//
//   }
//
//   return _success;
// }
// -----------------------------------------------------------------------------
