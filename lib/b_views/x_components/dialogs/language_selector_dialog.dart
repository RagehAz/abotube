import 'package:abotube/b_views/x_components/dialogs/bottom_dialog.dart';
import 'package:abotube/services/helpers/helper_methods.dart';
import 'package:abotube/services/navigation/navigators.dart';
import 'package:flutter/material.dart';
import 'package:stringer/stringer.dart';

Future<String> showLanguageDialog() async {

  String _output;

  final BuildContext context = getContext();
  // final TextToSpeech tts = TextToSpeech();
  List<String> _langs = [...youTubeCaptionsLangCodes];
  // List<String> _langs = await tts.getLanguages();
  _langs = Stringer.sortAlphabetically(_langs);

  await BottomDialog.showButtonsBottomDialog(
    context: context,
    draggable: true,
    numberOfWidgets: _langs.length,
    buttonHeight: 50,
    title: 'Languages',
    builder: (BuildContext xxx){

        return List.generate(_langs.length, (index){

          final String _lang = _langs[index];
          final String _langName = youTubeCaptionsLangCodesMap[_lang];

          return BottomDialog.wideButton(
              context: context,
              height: 50,
              text: '$_lang : $_langName',
              onTap: () async {
                _output = _lang;
                await Nav.goBack(context: context);
              }
              );
        });

    },
  );

  return _output;
}

const List<String> youTubeCaptionsLangCodes = [
  'en', // English
  'es', // Spanish
  'fr', // French
  'de', // German
  'it', // Italian
  'nl', // Dutch
  'pt', // Portuguese
  'ru', // Russian
  'ar', // Arabic
  'zh-Hans', // Chinese (Simplified)
  'zh-Hant', // Chinese (Traditional)
  'ja', // Japanese
  'ko', // Korean
  'hi', // Hindi
  'id', // Indonesian
  'ms', // Malay
  'th', // Thai
  'tr', // Turkish
  'vi', // Vietnamese
];

const Map<String, dynamic> youTubeCaptionsLangCodesMap = {
  'en' : 'English',
  'es' : 'Spanish',
  'fr' : 'French',
  'de' : 'German',
  'it' : 'Italian',
  'nl' : 'Dutch',
  'pt' : 'Portuguese',
  'ru' : 'Russian',
  'ar' : 'Arabic',
  'ja' : 'Japanese',
  'ko' : 'Korean',
  'hi' : 'Hindi',
  'id' : 'Indonesian',
  'ms' : 'Malay',
  'th' : 'Thai',
  'tr' : 'Turkish',
  'vi' : 'Vietnamese',
  'zh-Hans' : 'Chinese (Simplified)',
  'zh-Hant' : 'Chinese (Traditional)',
};
