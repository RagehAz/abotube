import 'package:flutter/material.dart';
import 'package:stringer/stringer.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:abotube/b_views/x_components/dialogs/bottom_dialog.dart';
import 'package:abotube/services/helpers/helper_methods.dart';
import 'package:abotube/services/navigation/navigators.dart';

Future<String> showLanguageDialog() async {

  String _output;

  final BuildContext context = getContext();
  final TextToSpeech tts = TextToSpeech();
  List<String> _langs = await tts.getLanguages();

  _langs = Stringer.sortAlphabetically(_langs);

  // final List<String> _langs = Flag.getALlLangCodes();

  await BottomDialog.showButtonsBottomDialog(
    context: context,
    draggable: true,
    numberOfWidgets: _langs.length,
    buttonHeight: 50,
    title: 'Languages',
    builder: (BuildContext xxx){

        return List.generate(_langs.length, (index){

          final String _lang = _langs[index];

          return BottomDialog.wideButton(
              context: context,
              height: 50,
              text: _lang,
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
