import 'package:flutter/material.dart';
import 'package:stringer/stringer.dart';

/// => TAMAM
class Formers {
  // -----------------------------------------------------------------------------

  const Formers();

  // -----------------------------------------------------------------------------

  /// FORM VALIDATION

  // --------------------
  /// TESTED : WORKS PERFECT
  static bool validateForm(GlobalKey<FormState> formKey) {
    bool _inputsAreValid = true;

    if (formKey != null){
      _inputsAreValid = formKey.currentState?.validate();
    }

    return _inputsAreValid;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static void focusOnNode(FocusNode node){

    if (node != null){
      if (node.hasFocus == false){
        node.requestFocus();
      }
    }

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static String webSiteValidator({
    @required BuildContext context,
    @required String website,
  }){
    String _message;

    /// WEBSITE HAS VALUE
    if (TextCheck.isEmpty(website) == false){

      if (website != 'https://'){
        final bool _isURLFormat = isURLFormat(website) == true;
        if (_isURLFormat == false){
          _message = 'URL Format is incorrect';
        }
      }

    }

    /// WEBSITE IS EMPTY
    else {
      _message = 'You have to put a URL here';
    }

    return _message;
  }
  // -----------------------------------------------------------------------------
  /// TESTED : WORKS PERFECT
  static bool isURLFormat(dynamic object) {

    bool _isURLFormat = false;

    if (object != null && object is String) {

      final RegExp regExp = RegExp(TextCheck.urlPattern);
      _isURLFormat = regExp.hasMatch(object);

    }

    return _isURLFormat;
  }
  // -----------------------------------------------------------------------------

  /// BAKING

  // --------------------
  /// TESTED : WORKS PERFECT
  static String bakeValidator({
    @required String Function(String text) validator,
    @required String text,
    bool keepEmbeddedBubbleColor = false,
  }){

    if (validator == null){
      return null;
    }

    else {

      if (keepEmbeddedBubbleColor == true){
        return validator(text);
      }

      else {
        return Formers._bakeValidatorMessage(validator(text));
      }

    }

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static String _bakeValidatorMessage(String message){
    String _output;

    if (message != null){
      _output = TextMod.removeTextBeforeFirstSpecialCharacter(message, 'Δ');
    }

    return _output;
  }
  // -----------------------------------------------------------------------------
}
