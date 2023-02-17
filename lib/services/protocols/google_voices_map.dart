import 'package:abotube/b_views/x_components/dialogs/bottom_dialog.dart';
import 'package:abotube/services/helpers/helper_methods.dart';
import 'package:abotube/services/navigation/navigators.dart';
import 'package:flutter/material.dart';
import 'package:stringer/stringer.dart';

class GoogleVoice {
  // --------------------------------------------------------------------------

  const GoogleVoice();

  // -----------------------------------------------------------------------------

  /// GETTERS
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<String> getVoicesByLangCode({
    @required String langCode,
  }){
    final List<String> _output = [];

    if (langCode?.length == 2){

      final List<String> _keys = googleVoices.keys.toList();

      for (final String key in _keys){

        final String _part = TextMod.removeTextAfterFirstSpecialCharacter(key, '-');
        if (_part == langCode){
          _output.add(key);
        }

      }

    }

    return _output;
  }
  // -----------------------------------------------------------------------------

  /// VOICES DIALOG

  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<String> showVoiceDialog({
    @required String langCode,
  }) async {
    String _output;

    final BuildContext context = getContext();
    // final TextToSpeech tts = TextToSpeech();
    List<String> _voices = getVoicesByLangCode(
      langCode: langCode,
    );

    _voices = Stringer.sortAlphabetically(_voices);

    await BottomDialog.showButtonsBottomDialog(
      context: context,
      draggable: true,
      numberOfWidgets: _voices.length,
      buttonHeight: 50,
      title: 'Voices',
      builder: (BuildContext xxx) {
        return List.generate(_voices.length, (index) {
          final String _voiceID = _voices[index];
          final String _gender = googleVoices[_voiceID]['gender'] == 'MALE' ? 'M' : 'F';
          final String _longLangCode = googleVoices[_voiceID]['language'];

          return BottomDialog.wideButton(
              context: context,
              height: 50,
              text: '$_voiceID : $_gender : $_longLangCode',
              onTap: () async {
                _output = _voiceID;
                await Nav.goBack(context: context);
              });
        });
      },
    );

    return _output;
  }
  // -----------------------------------------------------------------------------
}

///  REFERENCE : https://cloud.google.com/text-to-speech/docs/voices
final Map<String, dynamic> googleVoices = {
  'af-ZA-Standard-A': {
    'language': 'Afrikaans (South Africa)',
    'voiceType': 'Standard',
    'langCode': 'af-ZA',
    'gender': 'FEMALE'
  },
  'ar-XA-Standard-A': {
    'language': 'Arabic',
    'voiceType': 'Standard',
    'langCode': 'ar-XA',
    'gender': 'FEMALE'
  },
  'ar-XA-Standard-B': {
    'language': 'Arabic',
    'voiceType': 'Standard',
    'langCode': 'ar-XA',
    'gender': 'MALE'
  },
  'ar-XA-Standard-C': {
    'language': 'Arabic',
    'voiceType': 'Standard',
    'langCode': 'ar-XA',
    'gender': 'MALE'
  },
  'ar-XA-Standard-D': {
    'language': 'Arabic',
    'voiceType': 'Standard',
    'langCode': 'ar-XA',
    'gender': 'FEMALE',
  },
  'ar-XA-Wavenet-A': {
    'language': 'Arabic',
    'voiceType': 'WaveNet',
    'langCode': 'ar-XA',
    'gender': 'FEMALE',
  },
  'ar-XA-Wavenet-B': {
    'language': 'Arabic',
    'voiceType': 'WaveNet',
    'langCode': 'ar-XA',
    'gender': 'MALE',
  },
  'ar-XA-Wavenet-C': {
    'language': 'Arabic',
    'voiceType': 'WaveNet',
    'langCode': 'ar-XA',
    'gender': 'MALE',
  },
  'ar-XA-Wavenet-D': {
    'language': 'Arabic',
    'voiceType': 'WaveNet',
    'langCode': 'ar-XA',
    'gender': 'FEMALE',
  },
  'eu-ES-Standard-A': {
    'language': 'Basque (Spain)',
    'voiceType': 'Standard',
    'langCode': 'eu-ES',
    'gender': 'FEMALE',
  },
  'bn-IN-Standard-A': {
    'language': 'Bengali (India)',
    'voiceType': 'Standard',
    'langCode': 'bn-IN',
    'gender': 'FEMALE',
  },
  'bn-IN-Standard-B': {
    'language': 'Bengali (India)',
    'voiceType': 'Standard',
    'langCode': 'bn-IN',
    'gender': 'MALE',
  },
  'bn-IN-Wavenet-A': {
    'language': 'Bengali (India)',
    'voiceType': 'WaveNet',
    'langCode': 'bn-IN',
    'gender': 'FEMALE',
  },
  'bn-IN-Wavenet-B': {
    'language': 'Bengali(India)',
    'voiceType': 'WaveNet',
    'langCode': 'bn-IN',
    'gender': 'MALE',
  },
  'bg-BG-Standard-A': {
    'language': 'Bulgarian (Bulgaria)',
    'voiceType': 'Standard',
    'langCode': 'bg-BG',
    'gender': 'FEMALE',
  },
  'ca-ES-Standard-A': {
    'language': 'Catalan (Spain)',
    'voiceType': 'Standard',
    'langCode': 'ca-ES',
    'gender': 'FEMALE',
  },
  'yue-HK-Standard-A': {
    'language': 'Chinese (Hong Kong)',
    'voiceType': 'Standard',
    'langCode': 'yue-HK',
    'gender': 'FEMALE',
  },
  'yue-HK-Standard-B': {
    'language': 'Chinese (Hong Kong)',
    'voiceType': 'Standard',
    'langCode': 'yue-HK',
    'gender': 'MALE',
  },
  'yue-HK-Standard-C': {
    'language': 'Chinese (Hong Kong)',
    'voiceType': 'Standard',
    'langCode': 'yue-HK',
    'gender': 'FEMALE',
  },
  'yue-HK-Standard-D': {
    'language': 'Chinese(Hong Kong)',
    'voiceType': 'Standard',
    'langCode': 'yue-HK',
    'gender': 'MALE'
  },
  'cs-CZ-Standard-A': {
    'language': 'Czech(Czech Republic)',
    'voiceType': 'Standard',
    'langCode': 'cs-CZ',
    'gender': 'FEMALE'
  },
  'cs-CZ-Wavenet-A': {
    'language': 'Czech(Czech Republic)',
    'voiceType': 'WaveNet',
    'langCode': 'cs-CZ',
    'gender': 'FEMALE'
  },
  'da-DK-Standard-A': {
    'language': 'Danish(Denmark)',
    'voiceType': 'Standard',
    'langCode': 'da-DK',
    'gender': 'FEMALE'
  },
  'da-DK-Standard-C': {
    'language': 'Danish(Denmark)',
    'voiceType': 'Standard',
    'langCode': 'da-DK',
    'gender': 'MALE'
  },
  'da-DK-Standard-D': {
    'language': 'Danish(Denmark)',
    'voiceType': 'Standard',
    'langCode': 'da-DK',
    'gender': 'FEMALE'
  },
  'da-DK-Standard-E': {
    'language': 'Danish(Denmark)',
    'voiceType': 'Standard',
    'langCode': 'da-DK',
    'gender': 'FEMALE'
  },
  'da-DK-Wavenet-A': {
    'language': 'Danish(Denmark)',
    'voiceType': 'WaveNet',
    'langCode': 'da-DK',
    'gender': 'FEMALE'
  },
  'da-DK-Wavenet-C': {
    'language': 'Danish(Denmark)',
    'voiceType': 'WaveNet',
    'langCode': 'da-DK',
    'gender': 'MALE'
  },
  'da-DK-Wavenet-D': {
    'language': 'Danish(Denmark)',
    'voiceType': 'WaveNet',
    'langCode': 'da-DK',
    'gender': 'FEMALE'
  },
  'da-DK-Wavenet-E': {
    'language': 'Danish(Denmark)',
    'voiceType': 'WaveNet',
    'langCode': 'da-DK',
    'gender': 'FEMALE'
  },
  'nl-BE-Standard-A': {
    'language': 'Dutch(Belgium)',
    'voiceType': 'Standard',
    'langCode': 'nl-BE',
    'gender': 'FEMALE'
  },
  'nl-BE-Standard-B': {
    'language': 'Dutch(Belgium)',
    'voiceType': 'Standard',
    'langCode': 'nl-BE',
    'gender': 'MALE'
  },
  'nl-BE-Wavenet-A': {
    'language': 'Dutch(Belgium)',
    'voiceType': 'WaveNet',
    'langCode': 'nl-BE',
    'gender': 'FEMALE'
  },
  'nl-BE-Wavenet-B': {
    'language': 'Dutch(Belgium)',
    'voiceType': 'WaveNet',
    'langCode': 'nl-BE',
    'gender': 'MALE'
  },
  'nl-NL-Standard-A': {
    'language': 'Dutch(Netherlands)',
    'voiceType': 'Standard',
    'langCode': 'nl-NL',
    'gender': 'FEMALE'
  },
  'nl-NL-Standard-B': {
    'language': 'Dutch(Netherlands)',
    'voiceType': 'Standard',
    'langCode': 'nl-NL',
    'gender': 'MALE'
  },
  'nl-NL-Standard-C': {
    'language': 'Dutch(Netherlands)',
    'voiceType': 'Standard',
    'langCode': 'nl-NL',
    'gender': 'MALE'
  },
  'nl-NL-Standard-D': {
    'language': 'Dutch(Netherlands)',
    'voiceType': 'Standard',
    'langCode': 'nl-NL',
    'gender': 'FEMALE'
  },
  'nl-NL-Standard-E': {
    'language': 'Dutch(Netherlands)',
    'voiceType': 'Standard',
    'langCode': 'nl-NL',
    'gender': 'FEMALE'
  },
  'nl-NL-Wavenet-A': {
    'language': 'Dutch(Netherlands)',
    'voiceType': 'WaveNet',
    'langCode': 'nl-NL',
    'gender': 'FEMALE'
  },
  'nl-NL-Wavenet-B': {
    'language': 'Dutch(Netherlands)',
    'voiceType': 'WaveNet',
    'langCode': 'nl-NL',
    'gender': 'MALE'
  },
  'nl-NL-Wavenet-C': {
    'language': 'Dutch(Netherlands)',
    'voiceType': 'WaveNet',
    'langCode': 'nl-NL',
    'gender': 'MALE'
  },
  'nl-NL-Wavenet-D': {
    'language': 'Dutch(Netherlands)',
    'voiceType': 'WaveNet',
    'langCode': 'nl-NL',
    'gender': 'FEMALE'
  },
  'nl-NL-Wavenet-E': {
    'language': 'Dutch(Netherlands)',
    'voiceType': 'WaveNet',
    'langCode': 'nl-NL',
    'gender': 'FEMALE'
  },
  'en-AU-Neural2-A': {
    'language': 'English(Australia)',
    'voiceType': 'Neural2',
    'langCode': 'en-AU',
    'gender': 'FEMALE'
  },
  'en-AU-Neural2-B': {
    'language': 'English(Australia)',
    'voiceType': 'Neural2',
    'langCode': 'en-AU',
    'gender': 'MALE'
  },
  'en-AU-Neural2-C': {
    'language': 'English(Australia)',
    'voiceType': 'Neural2',
    'langCode': 'en-AU',
    'gender': 'FEMALE'
  },
  'en-AU-Neural2-D': {
    'language': 'English(Australia)',
    'voiceType': 'Neural2',
    'langCode': 'en-AU',
    'gender': 'MALE'
  },
  'en-AU-News-E': {
    'language': 'English(Australia)',
    'voiceType': 'WaveNet',
    'langCode': 'en-AU',
    'gender': 'FEMALE'
  },
  'en-AU-News-F': {
    'language': 'English(Australia)',
    'voiceType': 'WaveNet',
    'langCode': 'en-AU',
    'gender': 'FEMALE'
  },
  'en-AU-News-G': {
    'language': 'English(Australia)',
    'voiceType': 'WaveNet',
    'langCode': 'en-AU',
    'gender': 'MALE'
  },
  'en-AU-Standard-A': {
    'language': 'English(Australia)',
    'voiceType': 'Standard',
    'langCode': 'en-AU',
    'gender': 'FEMALE'
  },
  'en-AU-Standard-B': {
    'language': 'English(Australia)',
    'voiceType': 'Standard',
    'langCode': 'en-AU',
    'gender': 'MALE'
  },
  'en-AU-Standard-C': {
    'language': 'English(Australia)',
    'voiceType': 'Standard',
    'langCode': 'en-AU',
    'gender': 'FEMALE'
  },
  'en-AU-Standard-D': {
    'language': 'English(Australia)',
    'voiceType': 'Standard',
    'langCode': 'en-AU',
    'gender': 'MALE'
  },
  'en-AU-Wavenet-A': {
    'language': 'English(Australia)',
    'voiceType': 'WaveNet',
    'langCode': 'en-AU',
    'gender': 'FEMALE'
  },
  'en-AU-Wavenet-B': {
    'language': 'English(Australia)',
    'voiceType': 'WaveNet',
    'langCode': 'en-AU',
    'gender': 'MALE'
  },
  'en-AU-Wavenet-C': {
    'language': 'English(Australia)',
    'voiceType': 'WaveNet',
    'langCode': 'en-AU',
    'gender': 'FEMALE'
  },
  'en-AU-Wavenet-D': {
    'language': 'English(Australia)',
    'voiceType': 'WaveNet',
    'langCode': 'en-AU',
    'gender': 'MALE'
  },
  'en-IN-Standard-A': {
    'language': 'English(India)',
    'voiceType': 'Standard',
    'langCode': 'en-IN',
    'gender': 'FEMALE'
  },
  'en-IN-Standard-B': {
    'language': 'English(India)',
    'voiceType': 'Standard',
    'langCode': 'en-IN',
    'gender': 'MALE'
  },
  'en-IN-Standard-C': {
    'language': 'English(India)',
    'voiceType': 'Standard',
    'langCode': 'en-IN',
    'gender': 'MALE'
  },
  'en-IN-Standard-D': {
    'language': 'English(India)',
    'voiceType': 'Standard',
    'langCode': 'en-IN',
    'gender': 'FEMALE'
  },
  'en-IN-Wavenet-A': {
    'language': 'English(India)',
    'voiceType': 'WaveNet',
    'langCode': 'en-IN',
    'gender': 'FEMALE'
  },
  'en-IN-Wavenet-B': {
    'language': 'English(India)',
    'voiceType': 'WaveNet',
    'langCode': 'en-IN',
    'gender': 'MALE'
  },
  'en-IN-Wavenet-C': {
    'language': 'English(India)',
    'voiceType': 'WaveNet',
    'langCode': 'en-IN',
    'gender': 'MALE'
  },
  'en-IN-Wavenet-D': {
    'language': 'English(India)',
    'voiceType': 'WaveNet',
    'langCode': 'en-IN',
    'gender': 'FEMALE'
  },
  'en-GB-Neural2-A': {
    'language': 'English(UK)',
    'voiceType': 'Neural2',
    'langCode': 'en-GB',
    'gender': 'FEMALE'
  },
  'en-GB-Neural2-B': {
    'language': 'English(UK)',
    'voiceType': 'Neural2',
    'langCode': 'en-GB',
    'gender': 'MALE'
  },
  'en-GB-Neural2-C': {
    'language': 'English(UK)',
    'voiceType': 'Neural2',
    'langCode': 'en-GB',
    'gender': 'FEMALE'
  },
  'en-GB-Neural2-D': {
    'language': 'English(UK)',
    'voiceType': 'Neural2',
    'langCode': 'en-GB',
    'gender': 'MALE'
  },
  'en-GB-Neural2-F': {
    'language': 'English(UK)',
    'voiceType': 'Neural2',
    'langCode': 'en-GB',
    'gender': 'FEMALE'
  },
  'en-GB-News-G': {
    'language': 'English(UK)',
    'voiceType': 'WaveNet',
    'langCode': 'en-GB',
    'gender': 'FEMALE'
  },
  'en-GB-News-H': {
    'language': 'English(UK)',
    'voiceType': 'WaveNet',
    'langCode': 'en-GB',
    'gender': 'FEMALE'
  },
  'en-GB-News-I': {
    'language': 'English(UK)',
    'voiceType': 'WaveNet',
    'langCode': 'en-GB',
    'gender': 'FEMALE'
  },
  'en-GB-News-J': {
    'language': 'English(UK)',
    'voiceType': 'WaveNet',
    'langCode': 'en-GB',
    'gender': 'MALE'
  },
  'en-GB-News-K': {
    'language': 'English(UK)',
    'voiceType': 'WaveNet',
    'langCode': 'en-GB',
    'gender': 'MALE'
  },
  'en-GB-News-L': {
    'language': 'English(UK)',
    'voiceType': 'WaveNet',
    'langCode': 'en-GB',
    'gender': 'MALE'
  },
  'en-GB-News-M': {
    'language': 'English(UK)',
    'voiceType': 'WaveNet',
    'langCode': 'en-GB',
    'gender': 'MALE'
  },
  'en-GB-Standard-A': {
    'language': 'English(UK)',
    'voiceType': 'Standard',
    'langCode': 'en-GB',
    'gender': 'FEMALE'
  },
  'en-GB-Standard-B': {
    'language': 'English(UK)',
    'voiceType': 'Standard',
    'langCode': 'en-GB',
    'gender': 'MALE'
  },
  'en-GB-Standard-C': {
    'language': 'English(UK)',
    'voiceType': 'Standard',
    'langCode': 'en-GB',
    'gender': 'FEMALE'
  },
  'en-GB-Standard-D': {
    'language': 'English(UK)',
    'voiceType': 'Standard',
    'langCode': 'en-GB',
    'gender': 'MALE'
  },
  'en-GB-Standard-F': {
    'language': 'English(UK)',
    'voiceType': 'Standard',
    'langCode': 'en-GB',
    'gender': 'FEMALE'
  },
  'en-GB-Wavenet-A': {
    'language': 'English(UK)',
    'voiceType': 'WaveNet',
    'langCode': 'en-GB',
    'gender': 'FEMALE'
  },
  'en-GB-Wavenet-B': {
    'language': 'English(UK)',
    'voiceType': 'WaveNet',
    'langCode': 'en-GB',
    'gender': 'MALE'
  },
  'en-GB-Wavenet-C': {
    'language': 'English(UK)',
    'voiceType': 'WaveNet',
    'langCode': 'en-GB',
    'gender': 'FEMALE'
  },
  'en-GB-Wavenet-D': {
    'language': 'English(UK)',
    'voiceType': 'WaveNet',
    'langCode': 'en-GB',
    'gender': 'MALE'
  },
  'en-GB-Wavenet-F': {
    'language': 'English(UK)',
    'voiceType': 'WaveNet',
    'langCode': 'en-GB',
    'gender': 'FEMALE'
  },
  'en-US-Neural2-A': {
    'language': 'English(US)',
    'voiceType': 'Neural2',
    'langCode': 'en-US',
    'gender': 'MALE'
  },
  'en-US-Neural2-C': {
    'language': 'English(US)',
    'voiceType': 'Neural2',
    'langCode': 'en-US',
    'gender': 'FEMALE'
  },
  'en-US-Neural2-D': {
    'language': 'English(US)',
    'voiceType': 'Neural2',
    'langCode': 'en-US',
    'gender': 'MALE'
  },
  'en-US-Neural2-E': {
    'language': 'English(US)',
    'voiceType': 'Neural2',
    'langCode': 'en-US',
    'gender': 'FEMALE'
  },
  'en-US-Neural2-F': {
    'language': 'English(US)',
    'voiceType': 'Neural2',
    'langCode': 'en-US',
    'gender': 'FEMALE'
  },
  'en-US-Neural2-G': {
    'language': 'English(US)',
    'voiceType': 'Neural2',
    'langCode': 'en-US',
    'gender': 'FEMALE'
  },
  'en-US-Neural2-H': {
    'language': 'English(US)',
    'voiceType': 'Neural2',
    'langCode': 'en-US',
    'gender': 'FEMALE'
  },
  'en-US-Neural2-I': {
    'language': 'English(US)',
    'voiceType': 'Neural2',
    'langCode': 'en-US',
    'gender': 'MALE'
  },
  'en-US-Neural2-J': {
    'language': 'English(US)',
    'voiceType': 'Neural2',
    'langCode': 'en-US',
    'gender': 'MALE'
  },
  'en-US-News-K': {
    'language': 'English(US)',
    'voiceType': 'WaveNet',
    'langCode': 'en-US',
    'gender': 'FEMALE'
  },
  'en-US-News-L': {
    'language': 'English(US)',
    'voiceType': 'WaveNet',
    'langCode': 'en-US',
    'gender': 'FEMALE'
  },
  'en-US-News-M': {
    'language': 'English(US)',
    'voiceType': 'WaveNet',
    'langCode': 'en-US',
    'gender': 'MALE'
  },
  'en-US-News-N': {
    'language': 'English(US)',
    'voiceType': 'WaveNet',
    'langCode': 'en-US',
    'gender': 'MALE'
  },
  'en-US-Standard-A': {
    'language': 'English(US)',
    'voiceType': 'Standard',
    'langCode': 'en-US',
    'gender': 'MALE'
  },
  'en-US-Standard-B': {
    'language': 'English(US)',
    'voiceType': 'Standard',
    'langCode': 'en-US',
    'gender': 'MALE'
  },
  'en-US-Standard-C': {
    'language': 'English(US)',
    'voiceType': 'Standard',
    'langCode': 'en-US',
    'gender': 'FEMALE'
  },
  'en-US-Standard-D': {
    'language': 'English(US)',
    'voiceType': 'Standard',
    'langCode': 'en-US',
    'gender': 'MALE'
  },
  'en-US-Standard-E': {
    'language': 'English(US)',
    'voiceType': 'Standard',
    'langCode': 'en-US',
    'gender': 'FEMALE'
  },
  'en-US-Standard-F': {
    'language': 'English(US)',
    'voiceType': 'Standard',
    'langCode': 'en-US',
    'gender': 'FEMALE'
  },
  'en-US-Standard-G': {
    'language': 'English(US)',
    'voiceType': 'Standard',
    'langCode': 'en-US',
    'gender': 'FEMALE'
  },
  'en-US-Standard-H': {
    'language': 'English(US)',
    'voiceType': 'Standard',
    'langCode': 'en-US',
    'gender': 'FEMALE'
  },
  'en-US-Standard-I': {
    'language': 'English(US)',
    'voiceType': 'Standard',
    'langCode': 'en-US',
    'gender': 'MALE'
  },
  'en-US-Standard-J': {
    'language': 'English(US)',
    'voiceType': 'Standard',
    'langCode': 'en-US',
    'gender': 'MALE'
  },
  'en-US-Studio-M': {
    'language': 'English(US)',
    'voiceType': 'Studio',
    'langCode': 'en-US',
    'gender': 'MALE'
  },
  'en-US-Studio-O': {
    'language': 'English(US)',
    'voiceType': 'Studio',
    'langCode': 'en-US',
    'gender': 'FEMALE'
  },
  'en-US-Wavenet-A': {
    'language': 'English(US)',
    'voiceType': 'WaveNet',
    'langCode': 'en-US',
    'gender': 'MALE'
  },
  'en-US-Wavenet-B': {
    'language': 'English(US)',
    'voiceType': 'WaveNet',
    'langCode': 'en-US',
    'gender': 'MALE'
  },
  'en-US-Wavenet-C': {
    'language': 'English(US)',
    'voiceType': 'WaveNet',
    'langCode': 'en-US',
    'gender': 'FEMALE'
  },
  'en-US-Wavenet-D': {
    'language': 'English(US)',
    'voiceType': 'WaveNet',
    'langCode': 'en-US',
    'gender': 'MALE'
  },
  'en-US-Wavenet-E': {
    'language': 'English(US)',
    'voiceType': 'WaveNet',
    'langCode': 'en-US',
    'gender': 'FEMALE'
  },
  'en-US-Wavenet-F': {
    'language': 'English(US)',
    'voiceType': 'WaveNet',
    'langCode': 'en-US',
    'gender': 'FEMALE'
  },
  'en-US-Wavenet-G': {
    'language': 'English(US)',
    'voiceType': 'WaveNet',
    'langCode': 'en-US',
    'gender': 'FEMALE'
  },
  'en-US-Wavenet-H': {
    'language': 'English(US)',
    'voiceType': 'WaveNet',
    'langCode': 'en-US',
    'gender': 'FEMALE'
  },
  'en-US-Wavenet-I': {
    'language': 'English(US)',
    'voiceType': 'WaveNet',
    'langCode': 'en-US',
    'gender': 'MALE'
  },
  'en-US-Wavenet-J': {
    'language': 'English(US)',
    'voiceType': 'WaveNet',
    'langCode': 'en-US',
    'gender': 'MALE'
  },
  'fil-PH-Standard-A': {
    'language': 'Filipino(Philippines)',
    'voiceType': 'Standard',
    'langCode': 'fil-PH',
    'gender': 'FEMALE'
  },
  'fil-PH-Standard-B': {
    'language': 'Filipino(Philippines)',
    'voiceType': 'Standard',
    'langCode': 'fil-PH',
    'gender': 'FEMALE'
  },
  'fil-PH-Standard-C': {
    'language': 'Filipino(Philippines)',
    'voiceType': 'Standard',
    'langCode': 'fil-PH',
    'gender': 'MALE'
  },
  'fil-PH-Standard-D': {
    'language': 'Filipino(Philippines)',
    'voiceType': 'Standard',
    'langCode': 'fil-PH',
    'gender': 'MALE'
  },
  'fil-PH-Wavenet-A': {
    'language': 'Filipino(Philippines)',
    'voiceType': 'WaveNet',
    'langCode': 'fil-PH',
    'gender': 'FEMALE'
  },
  'fil-PH-Wavenet-B': {
    'language': 'Filipino(Philippines)',
    'voiceType': 'WaveNet',
    'langCode': 'fil-PH',
    'gender': 'FEMALE'
  },
  'fil-PH-Wavenet-C': {
    'language': 'Filipino(Philippines)',
    'voiceType': 'WaveNet',
    'langCode': 'fil-PH',
    'gender': 'MALE'
  },
  'fil-PH-Wavenet-D': {
    'language': 'Filipino(Philippines)',
    'voiceType': 'WaveNet',
    'langCode': 'fil-PH',
    'gender': 'MALE'
  },
  'fi-FI-Standard-A': {
    'language': 'Finnish(Finland)',
    'voiceType': 'Standard',
    'langCode': 'fi-FI',
    'gender': 'FEMALE'
  },
  'fi-FI-Wavenet-A': {
    'language': 'Finnish(Finland)',
    'voiceType': 'WaveNet',
    'langCode': 'fi-FI',
    'gender': 'FEMALE'
  },
  'fr-CA-Neural2-A': {
    'language': 'French(Canada)',
    'voiceType': 'Neural2',
    'langCode': 'fr-CA',
    'gender': 'FEMALE'
  },
  'fr-CA-Neural2-B': {
    'language': 'French(Canada)',
    'voiceType': 'Neural2',
    'langCode': 'fr-CA',
    'gender': 'MALE'
  },
  'fr-CA-Neural2-C': {
    'language': 'French(Canada)',
    'voiceType': 'Neural2',
    'langCode': 'fr-CA',
    'gender': 'FEMALE'
  },
  'fr-CA-Neural2-D': {
    'language': 'French(Canada)',
    'voiceType': 'Neural2',
    'langCode': 'fr-CA',
    'gender': 'MALE'
  },
  'fr-CA-Standard-A': {
    'language': 'French(Canada)',
    'voiceType': 'Standard',
    'langCode': 'fr-CA',
    'gender': 'FEMALE'
  },
  'fr-CA-Standard-B': {
    'language': 'French(Canada)',
    'voiceType': 'Standard',
    'langCode': 'fr-CA',
    'gender': 'MALE'
  },
  'fr-CA-Standard-C': {
    'language': 'French(Canada)',
    'voiceType': 'Standard',
    'langCode': 'fr-CA',
    'gender': 'FEMALE'
  },
  'fr-CA-Standard-D': {
    'language': 'French(Canada)',
    'voiceType': 'Standard',
    'langCode': 'fr-CA',
    'gender': 'MALE'
  },
  'fr-CA-Wavenet-A': {
    'language': 'French(Canada)',
    'voiceType': 'WaveNet',
    'langCode': 'fr-CA',
    'gender': 'FEMALE'
  },
  'fr-CA-Wavenet-B': {
    'language': 'French(Canada)',
    'voiceType': 'WaveNet',
    'langCode': 'fr-CA',
    'gender': 'MALE'
  },
  'fr-CA-Wavenet-C': {
    'language': 'French(Canada)',
    'voiceType': 'WaveNet',
    'langCode': 'fr-CA',
    'gender': 'FEMALE'
  },
  'fr-CA-Wavenet-D': {
    'language': 'French(Canada)',
    'voiceType': 'WaveNet',
    'langCode': 'fr-CA',
    'gender': 'MALE'
  },
  'fr-FR-Neural2-A': {
    'language': 'French(France)',
    'voiceType': 'Neural2',
    'langCode': 'fr-FR',
    'gender': 'FEMALE'
  },
  'fr-FR-Neural2-B': {
    'language': 'French(France)',
    'voiceType': 'Neural2',
    'langCode': 'fr-FR',
    'gender': 'MALE'
  },
  'fr-FR-Neural2-C': {
    'language': 'French(France)',
    'voiceType': 'Neural2',
    'langCode': 'fr-FR',
    'gender': 'FEMALE'
  },
  'fr-FR-Neural2-D': {
    'language': 'French(France)',
    'voiceType': 'Neural2',
    'langCode': 'fr-FR',
    'gender': 'MALE'
  },
  'fr-FR-Neural2-E': {
    'language': 'French(France)',
    'voiceType': 'Neural2',
    'langCode': 'fr-FR',
    'gender': 'FEMALE'
  },
  'fr-FR-Standard-A': {
    'language': 'French(France)',
    'voiceType': 'Standard',
    'langCode': 'fr-FR',
    'gender': 'FEMALE'
  },
  'fr-FR-Standard-B': {
    'language': 'French(France)',
    'voiceType': 'Standard',
    'langCode': 'fr-FR',
    'gender': 'MALE'
  },
  'fr-FR-Standard-C': {
    'language': 'French(France)',
    'voiceType': 'Standard',
    'langCode': 'fr-FR',
    'gender': 'FEMALE'
  },
  'fr-FR-Standard-D': {
    'language': 'French(France)',
    'voiceType': 'Standard',
    'langCode': 'fr-FR',
    'gender': 'MALE'
  },
  'fr-FR-Standard-E': {
    'language': 'French(France)',
    'voiceType': 'Standard',
    'langCode': 'fr-FR',
    'gender': 'FEMALE'
  },
  'fr-FR-Wavenet-A': {
    'language': 'French(France)',
    'voiceType': 'WaveNet',
    'langCode': 'fr-FR',
    'gender': 'FEMALE'
  },
  'fr-FR-Wavenet-B': {
    'language': 'French(France)',
    'voiceType': 'WaveNet',
    'langCode': 'fr-FR',
    'gender': 'MALE'
  },
  'fr-FR-Wavenet-C': {
    'language': 'French(France)',
    'voiceType': 'WaveNet',
    'langCode': 'fr-FR',
    'gender': 'FEMALE'
  },
  'fr-FR-Wavenet-D': {
    'language': 'French(France)',
    'voiceType': 'WaveNet',
    'langCode': 'fr-FR',
    'gender': 'MALE'
  },
  'fr-FR-Wavenet-E': {
    'language': 'French(France)',
    'voiceType': 'WaveNet',
    'langCode': 'fr-FR',
    'gender': 'FEMALE'
  },
  'gl-ES-Standard-A': {
    'language': 'Galician(Spain)',
    'voiceType': 'Standard',
    'langCode': 'gl-ES',
    'gender': 'FEMALE'
  },
  'de-DE-Neural2-D': {
    'language': 'German(Germany)',
    'voiceType': 'Neural2',
    'langCode': 'de-DE',
    'gender': 'MALE'
  },
  'de-DE-Neural2-F': {
    'language': 'German(Germany)',
    'voiceType': 'Neural2',
    'langCode': 'de-DE',
    'gender': 'FEMALE'
  },
  'de-DE-Standard-A': {
    'language': 'German(Germany)',
    'voiceType': 'Standard',
    'langCode': 'de-DE',
    'gender': 'FEMALE'
  },
  'de-DE-Standard-B': {
    'language': 'German(Germany)',
    'voiceType': 'Standard',
    'langCode': 'de-DE',
    'gender': 'MALE'
  },
  'de-DE-Standard-C': {
    'language': 'German(Germany)',
    'voiceType': 'Standard',
    'langCode': 'de-DE',
    'gender': 'FEMALE'
  },
  'de-DE-Standard-D': {
    'language': 'German(Germany)',
    'voiceType': 'Standard',
    'langCode': 'de-DE',
    'gender': 'MALE'
  },
  'de-DE-Standard-E': {
    'language': 'German(Germany)',
    'voiceType': 'Standard',
    'langCode': 'de-DE',
    'gender': 'MALE'
  },
  'de-DE-Standard-F': {
    'language': 'German(Germany)',
    'voiceType': 'Standard',
    'langCode': 'de-DE',
    'gender': 'FEMALE'
  },
  'de-DE-Wavenet-A': {
    'language': 'German(Germany)',
    'voiceType': 'WaveNet',
    'langCode': 'de-DE',
    'gender': 'FEMALE'
  },
  'de-DE-Wavenet-B': {
    'language': 'German(Germany)',
    'voiceType': 'WaveNet',
    'langCode': 'de-DE',
    'gender': 'MALE'
  },
  'de-DE-Wavenet-C': {
    'language': 'German(Germany)',
    'voiceType': 'WaveNet',
    'langCode': 'de-DE',
    'gender': 'FEMALE'
  },
  'de-DE-Wavenet-D': {
    'language': 'German(Germany)',
    'voiceType': 'WaveNet',
    'langCode': 'de-DE',
    'gender': 'MALE'
  },
  'de-DE-Wavenet-E': {
    'language': 'German(Germany)',
    'voiceType': 'WaveNet',
    'langCode': 'de-DE',
    'gender': 'MALE'
  },
  'de-DE-Wavenet-F': {
    'language': 'German(Germany)',
    'voiceType': 'WaveNet',
    'langCode': 'de-DE',
    'gender': 'FEMALE'
  },
  'el-GR-Standard-A': {
    'language': 'Greek(Greece)',
    'voiceType': 'Standard',
    'langCode': 'el-GR',
    'gender': 'FEMALE'
  },
  'el-GR-Wavenet-A': {
    'language': 'Greek(Greece)',
    'voiceType': 'WaveNet',
    'langCode': 'el-GR',
    'gender': 'FEMALE'
  },
  'gu-IN-Standard-A': {
    'language': 'Gujarati(India)',
    'voiceType': 'Standard',
    'langCode': 'gu-IN',
    'gender': 'FEMALE'
  },
  'gu-IN-Standard-B': {
    'language': 'Gujarati(India)',
    'voiceType': 'Standard',
    'langCode': 'gu-IN',
    'gender': 'MALE'
  },
  'gu-IN-Wavenet-A': {
    'language': 'Gujarati(India)',
    'voiceType': 'WaveNet',
    'langCode': 'gu-IN',
    'gender': 'FEMALE'
  },
  'gu-IN-Wavenet-B': {
    'language': 'Gujarati(India)',
    'voiceType': 'WaveNet',
    'langCode': 'gu-IN',
    'gender': 'MALE'
  },
  'he-IL-Standard-A': {
    'language': 'Hebrew(Israel)',
    'voiceType': 'Standard',
    'langCode': 'he-IL',
    'gender': 'FEMALE'
  },
  'he-IL-Standard-B': {
    'language': 'Hebrew(Israel)',
    'voiceType': 'Standard',
    'langCode': 'he-IL',
    'gender': 'MALE'
  },
  'he-IL-Standard-C': {
    'language': 'Hebrew(Israel)',
    'voiceType': 'Standard',
    'langCode': 'he-IL',
    'gender': 'FEMALE'
  },
  'he-IL-Standard-D': {
    'language': 'Hebrew(Israel)',
    'voiceType': 'Standard',
    'langCode': 'he-IL',
    'gender': 'MALE'
  },
  'hi-IN-Neural2-A': {
    'language': 'Hindi(India)',
    'voiceType': 'Neural2',
    'langCode': 'hi-IN',
    'gender': 'FEMALE'
  },
  'hi-IN-Neural2-B': {
    'language': 'Hindi(India)',
    'voiceType': 'Neural2',
    'langCode': 'hi-IN',
    'gender': 'MALE'
  },
  'hi-IN-Neural2-C': {
    'language': 'Hindi(India)',
    'voiceType': 'Neural2',
    'langCode': 'hi-IN',
    'gender': 'MALE'
  },
  'hi-IN-Neural2-D': {
    'language': 'Hindi(India)',
    'voiceType': 'Neural2',
    'langCode': 'hi-IN',
    'gender': 'FEMALE'
  },
  'hi-IN-Standard-A': {
    'language': 'Hindi(India)',
    'voiceType': 'Standard',
    'langCode': 'hi-IN',
    'gender': 'FEMALE'
  },
  'hi-IN-Standard-B': {
    'language': 'Hindi(India)',
    'voiceType': 'Standard',
    'langCode': 'hi-IN',
    'gender': 'MALE'
  },
  'hi-IN-Standard-C': {
    'language': 'Hindi(India)',
    'voiceType': 'Standard',
    'langCode': 'hi-IN',
    'gender': 'MALE'
  },
  'hi-IN-Standard-D': {
    'language': 'Hindi(India)',
    'voiceType': 'Standard',
    'langCode': 'hi-IN',
    'gender': 'FEMALE'
  },
  'hi-IN-Wavenet-A': {
    'language': 'Hindi(India)',
    'voiceType': 'WaveNet',
    'langCode': 'hi-IN',
    'gender': 'FEMALE'
  },
  'hi-IN-Wavenet-B': {
    'language': 'Hindi(India)',
    'voiceType': 'WaveNet',
    'langCode': 'hi-IN',
    'gender': 'MALE'
  },
  'hi-IN-Wavenet-C': {
    'language': 'Hindi(India)',
    'voiceType': 'WaveNet',
    'langCode': 'hi-IN',
    'gender': 'MALE'
  },
  'hi-IN-Wavenet-D': {
    'language': 'Hindi(India)',
    'voiceType': 'WaveNet',
    'langCode': 'hi-IN',
    'gender': 'FEMALE'
  },
  'hu-HU-Standard-A': {
    'language': 'Hungarian(Hungary)',
    'voiceType': 'Standard',
    'langCode': 'hu-HU',
    'gender': 'FEMALE'
  },
  'hu-HU-Wavenet-A': {
    'language': 'Hungarian(Hungary)',
    'voiceType': 'WaveNet',
    'langCode': 'hu-HU',
    'gender': 'FEMALE'
  },
  'is-IS-Standard-A': {
    'language': 'Icelandic(Iceland)',
    'voiceType': 'Standard',
    'langCode': 'is-IS',
    'gender': 'FEMALE'
  },
  'id-ID-Standard-A': {
    'language': 'Indonesian(Indonesia)',
    'voiceType': 'Standard',
    'langCode': 'id-ID',
    'gender': 'FEMALE'
  },
  'id-ID-Standard-B': {
    'language': 'Indonesian(Indonesia)',
    'voiceType': 'Standard',
    'langCode': 'id-ID',
    'gender': 'MALE'
  },
  'id-ID-Standard-C': {
    'language': 'Indonesian(Indonesia)',
    'voiceType': 'Standard',
    'langCode': 'id-ID',
    'gender': 'MALE'
  },
  'id-ID-Standard-D': {
    'language': 'Indonesian(Indonesia)',
    'voiceType': 'Standard',
    'langCode': 'id-ID',
    'gender': 'FEMALE'
  },
  'id-ID-Wavenet-A': {
    'language': 'Indonesian(Indonesia)',
    'voiceType': 'WaveNet',
    'langCode': 'id-ID',
    'gender': 'FEMALE'
  },
  'id-ID-Wavenet-B': {
    'language': 'Indonesian(Indonesia)',
    'voiceType': 'WaveNet',
    'langCode': 'id-ID',
    'gender': 'MALE'
  },
  'id-ID-Wavenet-C': {
    'language': 'Indonesian(Indonesia)',
    'voiceType': 'WaveNet',
    'langCode': 'id-ID',
    'gender': 'MALE'
  },
  'id-ID-Wavenet-D': {
    'language': 'Indonesian(Indonesia)',
    'voiceType': 'WaveNet',
    'langCode': 'id-ID',
    'gender': 'FEMALE'
  },
  'it-IT-Neural2-A': {
    'language': 'Italian(Italy)',
    'voiceType': 'Neural2',
    'langCode': 'it-IT',
    'gender': 'FEMALE'
  },
  'it-IT-Neural2-C': {
    'language': 'Italian(Italy)',
    'voiceType': 'Neural2',
    'langCode': 'it-IT',
    'gender': 'MALE'
  },
  'it-IT-Standard-A': {
    'language': 'Italian(Italy)',
    'voiceType': 'Standard',
    'langCode': 'it-IT',
    'gender': 'FEMALE'
  },
  'it-IT-Standard-B': {
    'language': 'Italian(Italy)',
    'voiceType': 'Standard',
    'langCode': 'it-IT',
    'gender': 'FEMALE'
  },
  'it-IT-Standard-C': {
    'language': 'Italian(Italy)',
    'voiceType': 'Standard',
    'langCode': 'it-IT',
    'gender': 'MALE'
  },
  'it-IT-Standard-D': {
    'language': 'Italian(Italy)',
    'voiceType': 'Standard',
    'langCode': 'it-IT',
    'gender': 'MALE'
  },
  'it-IT-Wavenet-A': {
    'language': 'Italian(Italy)',
    'voiceType': 'WaveNet',
    'langCode': 'it-IT',
    'gender': 'FEMALE'
  },
  'it-IT-Wavenet-B': {
    'language': 'Italian(Italy)',
    'voiceType': 'WaveNet',
    'langCode': 'it-IT',
    'gender': 'FEMALE'
  },
  'it-IT-Wavenet-C': {
    'language': 'Italian(Italy)',
    'voiceType': 'WaveNet',
    'langCode': 'it-IT',
    'gender': 'MALE'
  },
  'it-IT-Wavenet-D': {
    'language': 'Italian(Italy)',
    'voiceType': 'WaveNet',
    'langCode': 'it-IT',
    'gender': 'MALE'
  },
  'ja-JP-Neural2-B': {
    'language': 'Japanese(Japan)',
    'voiceType': 'Neural2',
    'langCode': 'ja-JP',
    'gender': 'FEMALE'
  },
  'ja-JP-Neural2-C': {
    'language': 'Japanese(Japan)',
    'voiceType': 'Neural2',
    'langCode': 'ja-JP',
    'gender': 'MALE'
  },
  'ja-JP-Neural2-D': {
    'language': 'Japanese(Japan)',
    'voiceType': 'Neural2',
    'langCode': 'ja-JP',
    'gender': 'MALE'
  },
  'ja-JP-Standard-A': {
    'language': 'Japanese(Japan)',
    'voiceType': 'Standard',
    'langCode': 'ja-JP',
    'gender': 'FEMALE'
  },
  'ja-JP-Standard-B': {
    'language': 'Japanese(Japan)',
    'voiceType': 'Standard',
    'langCode': 'ja-JP',
    'gender': 'FEMALE'
  },
  'ja-JP-Standard-C': {
    'language': 'Japanese(Japan)',
    'voiceType': 'Standard',
    'langCode': 'ja-JP',
    'gender': 'MALE'
  },
  'ja-JP-Standard-D': {
    'language': 'Japanese(Japan)',
    'voiceType': 'Standard',
    'langCode': 'ja-JP',
    'gender': 'MALE'
  },
  'ja-JP-Wavenet-A': {
    'language': 'Japanese(Japan)',
    'voiceType': 'WaveNet',
    'langCode': 'ja-JP',
    'gender': 'FEMALE'
  },
  'ja-JP-Wavenet-B': {
    'language': 'Japanese(Japan)',
    'voiceType': 'WaveNet',
    'langCode': 'ja-JP',
    'gender': 'FEMALE'
  },
  'ja-JP-Wavenet-C': {
    'language': 'Japanese(Japan)',
    'voiceType': 'WaveNet',
    'langCode': 'ja-JP',
    'gender': 'MALE'
  },
  'ja-JP-Wavenet-D': {
    'language': 'Japanese(Japan)',
    'voiceType': 'WaveNet',
    'langCode': 'ja-JP',
    'gender': 'MALE'
  },
  'kn-IN-Standard-A': {
    'language': 'Kannada(India)',
    'voiceType': 'Standard',
    'langCode': 'kn-IN',
    'gender': 'FEMALE'
  },
  'kn-IN-Standard-B': {
    'language': 'Kannada(India)',
    'voiceType': 'Standard',
    'langCode': 'kn-IN',
    'gender': 'MALE'
  },
  'kn-IN-Wavenet-A': {
    'language': 'Kannada(India)',
    'voiceType': 'WaveNet',
    'langCode': 'kn-IN',
    'gender': 'FEMALE'
  },
  'kn-IN-Wavenet-B': {
    'language': 'Kannada(India)',
    'voiceType': 'WaveNet',
    'langCode': 'kn-IN',
    'gender': 'MALE'
  },
  'ko-KR-Neural2-A': {
    'language': 'Korean(South Korea)',
    'voiceType': 'Neural2',
    'langCode': 'ko-KR',
    'gender': 'FEMALE'
  },
  'ko-KR-Neural2-B': {
    'language': 'Korean(South Korea)',
    'voiceType': 'Neural2',
    'langCode': 'ko-KR',
    'gender': 'FEMALE'
  },
  'ko-KR-Neural2-C': {
    'language': 'Korean(South Korea)',
    'voiceType': 'Neural2',
    'langCode': 'ko-KR',
    'gender': 'MALE'
  },
  'ko-KR-Standard-A': {
    'language': 'Korean(South Korea)',
    'voiceType': 'Standard',
    'langCode': 'ko-KR',
    'gender': 'FEMALE'
  },
  'ko-KR-Standard-B': {
    'language': 'Korean(South Korea)',
    'voiceType': 'Standard',
    'langCode': 'ko-KR',
    'gender': 'FEMALE'
  },
  'ko-KR-Standard-C': {
    'language': 'Korean(South Korea)',
    'voiceType': 'Standard',
    'langCode': 'ko-KR',
    'gender': 'MALE'
  },
  'ko-KR-Standard-D': {
    'language': 'Korean(South Korea)',
    'voiceType': 'Standard',
    'langCode': 'ko-KR',
    'gender': 'MALE'
  },
  'ko-KR-Wavenet-A': {
    'language': 'Korean(South Korea)',
    'voiceType': 'WaveNet',
    'langCode': 'ko-KR',
    'gender': 'FEMALE'
  },
  'ko-KR-Wavenet-B': {
    'language': 'Korean(South Korea)',
    'voiceType': 'WaveNet',
    'langCode': 'ko-KR',
    'gender': 'FEMALE'
  },
  'ko-KR-Wavenet-C': {
    'language': 'Korean(South Korea)',
    'voiceType': 'WaveNet',
    'langCode': 'ko-KR',
    'gender': 'MALE'
  },
  'ko-KR-Wavenet-D': {
    'language': 'Korean(South Korea)',
    'voiceType': 'WaveNet',
    'langCode': 'ko-KR',
    'gender': 'MALE'
  },
  'lv-LV-Standard-A': {
    'language': 'Latvian(Latvia)',
    'voiceType': 'Standard',
    'langCode': 'lv-LV',
    'gender': 'MALE'
  },
  'ms-MY-Standard-A': {
    'language': 'Malay(Malaysia)',
    'voiceType': 'Standard',
    'langCode': 'ms-MY',
    'gender': 'FEMALE'
  },
  'ms-MY-Standard-B': {
    'language': 'Malay(Malaysia)',
    'voiceType': 'Standard',
    'langCode': 'ms-MY',
    'gender': 'MALE'
  },
  'ms-MY-Standard-C': {
    'language': 'Malay(Malaysia)',
    'voiceType': 'Standard',
    'langCode': 'ms-MY',
    'gender': 'FEMALE'
  },
  'ms-MY-Standard-D': {
    'language': 'Malay(Malaysia)',
    'voiceType': 'Standard',
    'langCode': 'ms-MY',
    'gender': 'MALE'
  },
  'ms-MY-Wavenet-A': {
    'language': 'Malay(Malaysia)',
    'voiceType': 'WaveNet',
    'langCode': 'ms-MY',
    'gender': 'FEMALE'
  },
  'ms-MY-Wavenet-B': {
    'language': 'Malay(Malaysia)',
    'voiceType': 'WaveNet',
    'langCode': 'ms-MY',
    'gender': 'MALE'
  },
  'ms-MY-Wavenet-C': {
    'language': 'Malay(Malaysia)',
    'voiceType': 'WaveNet',
    'langCode': 'ms-MY',
    'gender': 'FEMALE'
  },
  'ms-MY-Wavenet-D': {
    'language': 'Malay(Malaysia)',
    'voiceType': 'WaveNet',
    'langCode': 'ms-MY',
    'gender': 'MALE'
  },
  'ml-IN-Standard-A': {
    'language': 'Malayalam(India)',
    'voiceType': 'Standard',
    'langCode': 'ml-IN',
    'gender': 'FEMALE'
  },
  'ml-IN-Standard-B': {
    'language': 'Malayalam(India)',
    'voiceType': 'Standard',
    'langCode': 'ml-IN',
    'gender': 'MALE'
  },
  'ml-IN-Wavenet-A': {
    'language': 'Malayalam(India)',
    'voiceType': 'WaveNet',
    'langCode': 'ml-IN',
    'gender': 'FEMALE'
  },
  'ml-IN-Wavenet-B': {
    'language': 'Malayalam(India)',
    'voiceType': 'WaveNet',
    'langCode': 'ml-IN',
    'gender': 'MALE'
  },
  'ml-IN-Wavenet-C': {
    'language': 'Malayalam(India)',
    'voiceType': 'WaveNet',
    'langCode': 'ml-IN',
    'gender': 'FEMALE'
  },
  'ml-IN-Wavenet-D': {
    'language': 'Malayalam(India)',
    'voiceType': 'WaveNet',
    'langCode': 'ml-IN',
    'gender': 'MALE'
  },
  'cmn-CN-Standard-A': {
    'language': 'Mandarin Chinese',
    'voiceType': 'Standard',
    'langCode': 'cmn-CN',
    'gender': 'FEMALE'
  },
  'cmn-CN-Standard-B': {
    'language': 'Mandarin Chinese',
    'voiceType': 'Standard',
    'langCode': 'cmn-CN',
    'gender': 'MALE'
  },
  'cmn-CN-Standard-C': {
    'language': 'Mandarin Chinese',
    'voiceType': 'Standard',
    'langCode': 'cmn-CN',
    'gender': 'MALE'
  },
  'cmn-CN-Standard-D': {
    'language': 'Mandarin Chinese',
    'voiceType': 'Standard',
    'langCode': 'cmn-CN',
    'gender': 'FEMALE'
  },
  'cmn-CN-Wavenet-A': {
    'language': 'Mandarin Chinese',
    'voiceType': 'WaveNet',
    'langCode': 'cmn-CN',
    'gender': 'FEMALE'
  },
  'cmn-CN-Wavenet-B': {
    'language': 'Mandarin Chinese',
    'voiceType': 'WaveNet',
    'langCode': 'cmn-CN',
    'gender': 'MALE'
  },
  'cmn-CN-Wavenet-C': {
    'language': 'Mandarin Chinese',
    'voiceType': 'WaveNet',
    'langCode': 'cmn-CN',
    'gender': 'MALE'
  },
  'cmn-CN-Wavenet-D': {
    'language': 'Mandarin Chinese',
    'voiceType': 'WaveNet',
    'langCode': 'cmn-CN',
    'gender': 'FEMALE'
  },
  'cmn-TW-Standard-A': {
    'language': 'Mandarin Chinese',
    'voiceType': 'Standard',
    'langCode': 'cmn-TW',
    'gender': 'FEMALE'
  },
  'cmn-TW-Standard-B': {
    'language': 'Mandarin Chinese',
    'voiceType': 'Standard',
    'langCode': 'cmn-TW',
    'gender': 'MALE'
  },
  'cmn-TW-Standard-C': {
    'language': 'Mandarin Chinese',
    'voiceType': 'Standard',
    'langCode': 'cmn-TW',
    'gender': 'MALE'
  },
  'cmn-TW-Wavenet-A': {
    'language': 'Mandarin Chinese',
    'voiceType': 'WaveNet',
    'langCode': 'cmn-TW',
    'gender': 'FEMALE'
  },
  'cmn-TW-Wavenet-B': {
    'language': 'Mandarin Chinese',
    'voiceType': 'WaveNet',
    'langCode': 'cmn-TW',
    'gender': 'MALE'
  },
  'cmn-TW-Wavenet-C': {
    'language': 'Mandarin Chinese',
    'voiceType': 'WaveNet',
    'langCode': 'cmn-TW',
    'gender': 'MALE'
  },
  'mr-IN-Standard-A': {
    'language': 'Marathi(India)',
    'voiceType': 'Standard',
    'langCode': 'mr-IN',
    'gender': 'FEMALE'
  },
  'mr-IN-Standard-B': {
    'language': 'Marathi(India)',
    'voiceType': 'Standard',
    'langCode': 'mr-IN',
    'gender': 'MALE'
  },
  'mr-IN-Standard-C': {
    'language': 'Marathi(India)',
    'voiceType': 'Standard',
    'langCode': 'mr-IN',
    'gender': 'FEMALE'
  },
  'mr-IN-Wavenet-A': {
    'language': 'Marathi(India)',
    'voiceType': 'WaveNet',
    'langCode': 'mr-IN',
    'gender': 'FEMALE'
  },
  'mr-IN-Wavenet-B': {
    'language': 'Marathi(India)',
    'voiceType': 'WaveNet',
    'langCode': 'mr-IN',
    'gender': 'MALE'
  },
  'mr-IN-Wavenet-C': {
    'language': 'Marathi(India)',
    'voiceType': 'WaveNet',
    'langCode': 'mr-IN',
    'gender': 'FEMALE'
  },
  'nb-NO-Standard-A': {
    'language': 'Norwegian(Norway)',
    'voiceType': 'Standard',
    'langCode': 'nb-NO',
    'gender': 'FEMALE'
  },
  'nb-NO-Standard-B': {
    'language': 'Norwegian(Norway)',
    'voiceType': 'Standard',
    'langCode': 'nb-NO',
    'gender': 'MALE'
  },
  'nb-NO-Standard-C': {
    'language': 'Norwegian(Norway)',
    'voiceType': 'Standard',
    'langCode': 'nb-NO',
    'gender': 'FEMALE'
  },
  'nb-NO-Standard-D': {
    'language': 'Norwegian(Norway)',
    'voiceType': 'Standard',
    'langCode': 'nb-NO',
    'gender': 'MALE'
  },
  'nb-NO-Standard-E': {
    'language': 'Norwegian(Norway)',
    'voiceType': 'Standard',
    'langCode': 'nb-NO',
    'gender': 'FEMALE'
  },
  'nb-NO-Wavenet-A': {
    'language': 'Norwegian(Norway)',
    'voiceType': 'WaveNet',
    'langCode': 'nb-NO',
    'gender': 'FEMALE'
  },
  'nb-NO-Wavenet-B': {
    'language': 'Norwegian(Norway)',
    'voiceType': 'WaveNet',
    'langCode': 'nb-NO',
    'gender': 'MALE'
  },
  'nb-NO-Wavenet-C': {
    'language': 'Norwegian(Norway)',
    'voiceType': 'WaveNet',
    'langCode': 'nb-NO',
    'gender': 'FEMALE'
  },
  'nb-NO-Wavenet-D': {
    'language': 'Norwegian(Norway)',
    'voiceType': 'WaveNet',
    'langCode': 'nb-NO',
    'gender': 'MALE'
  },
  'nb-NO-Wavenet-E': {
    'language': 'Norwegian(Norway)',
    'voiceType': 'WaveNet',
    'langCode': 'nb-NO',
    'gender': 'FEMALE'
  },
  'pl-PL-Standard-A': {
    'language': 'Polish(Poland)',
    'voiceType': 'Standard',
    'langCode': 'pl-PL',
    'gender': 'FEMALE'
  },
  'pl-PL-Standard-B': {
    'language': 'Polish(Poland)',
    'voiceType': 'Standard',
    'langCode': 'pl-PL',
    'gender': 'MALE'
  },
  'pl-PL-Standard-C': {
    'language': 'Polish(Poland)',
    'voiceType': 'Standard',
    'langCode': 'pl-PL',
    'gender': 'MALE'
  },
  'pl-PL-Standard-D': {
    'language': 'Polish(Poland)',
    'voiceType': 'Standard',
    'langCode': 'pl-PL',
    'gender': 'FEMALE'
  },
  'pl-PL-Standard-E': {
    'language': 'Polish(Poland)',
    'voiceType': 'Standard',
    'langCode': 'pl-PL',
    'gender': 'FEMALE'
  },
  'pl-PL-Wavenet-A': {
    'language': 'Polish(Poland)',
    'voiceType': 'WaveNet',
    'langCode': 'pl-PL',
    'gender': 'FEMALE'
  },
  'pl-PL-Wavenet-B': {
    'language': 'Polish(Poland)',
    'voiceType': 'WaveNet',
    'langCode': 'pl-PL',
    'gender': 'MALE'
  },
  'pl-PL-Wavenet-C': {
    'language': 'Polish(Poland)',
    'voiceType': 'WaveNet',
    'langCode': 'pl-PL',
    'gender': 'MALE'
  },
  'pl-PL-Wavenet-D': {
    'language': 'Polish(Poland)',
    'voiceType': 'WaveNet',
    'langCode': 'pl-PL',
    'gender': 'FEMALE'
  },
  'pl-PL-Wavenet-E': {
    'language': 'Polish(Poland)',
    'voiceType': 'WaveNet',
    'langCode': 'pl-PL',
    'gender': 'FEMALE'
  },
  'pt-BR-Neural2-A': {
    'language': 'Portuguese(Brazil)',
    'voiceType': 'Neural2',
    'langCode': 'pt-BR',
    'gender': 'FEMALE'
  },
  'pt-BR-Neural2-B': {
    'language': 'Portuguese(Brazil)',
    'voiceType': 'Neural2',
    'langCode': 'pt-BR',
    'gender': 'MALE'
  },
  'pt-BR-Neural2-C': {
    'language': 'Portuguese(Brazil)',
    'voiceType': 'Neural2',
    'langCode': 'pt-BR',
    'gender': 'FEMALE'
  },
  'pt-BR-Standard-A': {
    'language': 'Portuguese(Brazil)',
    'voiceType': 'Standard',
    'langCode': 'pt-BR',
    'gender': 'FEMALE'
  },
  'pt-BR-Standard-B': {
    'language': 'Portuguese(Brazil)',
    'voiceType': 'Standard',
    'langCode': 'pt-BR',
    'gender': 'MALE'
  },
  'pt-BR-Standard-C': {
    'language': 'Portuguese(Brazil)',
    'voiceType': 'Standard',
    'langCode': 'pt-BR',
    'gender': 'FEMALE'
  },
  'pt-BR-Wavenet-A': {
    'language': 'Portuguese(Brazil)',
    'voiceType': 'WaveNet',
    'langCode': 'pt-BR',
    'gender': 'FEMALE'
  },
  'pt-BR-Wavenet-B': {
    'language': 'Portuguese(Brazil)',
    'voiceType': 'WaveNet',
    'langCode': 'pt-BR',
    'gender': 'MALE'
  },
  'pt-BR-Wavenet-C': {
    'language': 'Portuguese(Brazil)',
    'voiceType': 'WaveNet',
    'langCode': 'pt-BR',
    'gender': 'FEMALE'
  },
  'pt-PT-Standard-A': {
    'language': 'Portuguese(Portugal)',
    'voiceType': 'Standard',
    'langCode': 'pt-PT',
    'gender': 'FEMALE'
  },
  'pt-PT-Standard-B': {
    'language': 'Portuguese(Portugal)',
    'voiceType': 'Standard',
    'langCode': 'pt-PT',
    'gender': 'MALE'
  },
  'pt-PT-Standard-C': {
    'language': 'Portuguese(Portugal)',
    'voiceType': 'Standard',
    'langCode': 'pt-PT',
    'gender': 'MALE'
  },
  'pt-PT-Standard-D': {
    'language': 'Portuguese(Portugal)',
    'voiceType': 'Standard',
    'langCode': 'pt-PT',
    'gender': 'FEMALE'
  },
  'pt-PT-Wavenet-A': {
    'language': 'Portuguese(Portugal)',
    'voiceType': 'WaveNet',
    'langCode': 'pt-PT',
    'gender': 'FEMALE'
  },
  'pt-PT-Wavenet-B': {
    'language': 'Portuguese(Portugal)',
    'voiceType': 'WaveNet',
    'langCode': 'pt-PT',
    'gender': 'MALE'
  },
  'pt-PT-Wavenet-C': {
    'language': 'Portuguese(Portugal)',
    'voiceType': 'WaveNet',
    'langCode': 'pt-PT',
    'gender': 'MALE'
  },
  'pt-PT-Wavenet-D': {
    'language': 'Portuguese(Portugal)',
    'voiceType': 'WaveNet',
    'langCode': 'pt-PT',
    'gender': 'FEMALE'
  },
  'pa-IN-Standard-A': {
    'language': 'Punjabi(India)',
    'voiceType': 'Standard',
    'langCode': 'pa-IN',
    'gender': 'FEMALE'
  },
  'pa-IN-Standard-B': {
    'language': 'Punjabi(India)',
    'voiceType': 'Standard',
    'langCode': 'pa-IN',
    'gender': 'MALE'
  },
  'pa-IN-Standard-C': {
    'language': 'Punjabi(India)',
    'voiceType': 'Standard',
    'langCode': 'pa-IN',
    'gender': 'FEMALE'
  },
  'pa-IN-Standard-D': {
    'language': 'Punjabi(India)',
    'voiceType': 'Standard',
    'langCode': 'pa-IN',
    'gender': 'MALE'
  },
  'pa-IN-Wavenet-A': {
    'language': 'Punjabi(India)',
    'voiceType': 'WaveNet',
    'langCode': 'pa-IN',
    'gender': 'FEMALE'
  },
  'pa-IN-Wavenet-B': {
    'language': 'Punjabi(India)',
    'voiceType': 'WaveNet',
    'langCode': 'pa-IN',
    'gender': 'MALE'
  },
  'pa-IN-Wavenet-C': {
    'language': 'Punjabi(India)',
    'voiceType': 'WaveNet',
    'langCode': 'pa-IN',
    'gender': 'FEMALE'
  },
  'pa-IN-Wavenet-D': {
    'language': 'Punjabi(India)',
    'voiceType': 'WaveNet',
    'langCode': 'pa-IN',
    'gender': 'MALE'
  },
  'ro-RO-Standard-A': {
    'language': 'Romanian(Romania)',
    'voiceType': 'Standard',
    'langCode': 'ro-RO',
    'gender': 'FEMALE'
  },
  'ro-RO-Wavenet-A': {
    'language': 'Romanian(Romania)',
    'voiceType': 'WaveNet',
    'langCode': 'ro-RO',
    'gender': 'FEMALE'
  },
  'ru-RU-Standard-A': {
    'language': 'Russian(Russia)',
    'voiceType': 'Standard',
    'langCode': 'ru-RU',
    'gender': 'FEMALE'
  },
  'ru-RU-Standard-B': {
    'language': 'Russian(Russia)',
    'voiceType': 'Standard',
    'langCode': 'ru-RU',
    'gender': 'MALE'
  },
  'ru-RU-Standard-C': {
    'language': 'Russian(Russia)',
    'voiceType': 'Standard',
    'langCode': 'ru-RU',
    'gender': 'FEMALE'
  },
  'ru-RU-Standard-D': {
    'language': 'Russian(Russia)',
    'voiceType': 'Standard',
    'langCode': 'ru-RU',
    'gender': 'MALE'
  },
  'ru-RU-Standard-E': {
    'language': 'Russian(Russia)',
    'voiceType': 'Standard',
    'langCode': 'ru-RU',
    'gender': 'FEMALE'
  },
  'ru-RU-Wavenet-A': {
    'language': 'Russian(Russia)',
    'voiceType': 'WaveNet',
    'langCode': 'ru-RU',
    'gender': 'FEMALE'
  },
  'ru-RU-Wavenet-B': {
    'language': 'Russian(Russia)',
    'voiceType': 'WaveNet',
    'langCode': 'ru-RU',
    'gender': 'MALE'
  },
  'ru-RU-Wavenet-C': {
    'language': 'Russian(Russia)',
    'voiceType': 'WaveNet',
    'langCode': 'ru-RU',
    'gender': 'FEMALE'
  },
  'ru-RU-Wavenet-D': {
    'language': 'Russian(Russia)',
    'voiceType': 'WaveNet',
    'langCode': 'ru-RU',
    'gender': 'MALE'
  },
  'ru-RU-Wavenet-E': {
    'language': 'Russian(Russia)',
    'voiceType': 'WaveNet',
    'langCode': 'ru-RU',
    'gender': 'FEMALE'
  },
  'sr-rs-Standard-A': {
    'language': 'Serbian(Cyrillic)',
    'voiceType': 'Standard',
    'langCode': 'sr-RS',
    'gender': 'FEMALE'
  },
  'sk-SK-Standard-A': {
    'language': 'Slovak(Slovakia)',
    'voiceType': 'Standard',
    'langCode': 'sk-SK',
    'gender': 'FEMALE'
  },
  'sk-SK-Wavenet-A': {
    'language': 'Slovak(Slovakia)',
    'voiceType': 'WaveNet',
    'langCode': 'sk-SK',
    'gender': 'FEMALE'
  },
  'es-ES-Neural2-A': {
    'language': 'Spanish(Spain)',
    'voiceType': 'Neural2',
    'langCode': 'es-ES',
    'gender': 'FEMALE'
  },
  'es-ES-Neural2-B': {
    'language': 'Spanish(Spain)',
    'voiceType': 'Neural2',
    'langCode': 'es-ES',
    'gender': 'MALE'
  },
  'es-ES-Neural2-C': {
    'language': 'Spanish(Spain)',
    'voiceType': 'Neural2',
    'langCode': 'es-ES',
    'gender': 'FEMALE'
  },
  'es-ES-Neural2-D': {
    'language': 'Spanish(Spain)',
    'voiceType': 'Neural2',
    'langCode': 'es-ES',
    'gender': 'FEMALE'
  },
  'es-ES-Neural2-E': {
    'language': 'Spanish(Spain)',
    'voiceType': 'Neural2',
    'langCode': 'es-ES',
    'gender': 'FEMALE'
  },
  'es-ES-Neural2-F': {
    'language': 'Spanish(Spain)',
    'voiceType': 'Neural2',
    'langCode': 'es-ES',
    'gender': 'MALE'
  },
  'es-ES-Standard-A': {
    'language': 'Spanish(Spain)',
    'voiceType': 'Standard',
    'langCode': 'es-ES',
    'gender': 'FEMALE'
  },
  'es-ES-Standard-B': {
    'language': 'Spanish(Spain)',
    'voiceType': 'Standard',
    'langCode': 'es-ES',
    'gender': 'MALE'
  },
  'es-ES-Standard-C': {
    'language': 'Spanish(Spain)',
    'voiceType': 'Standard',
    'langCode': 'es-ES',
    'gender': 'FEMALE'
  },
  'es-ES-Standard-D': {
    'language': 'Spanish(Spain)',
    'voiceType': 'Standard',
    'langCode': 'es-ES',
    'gender': 'FEMALE'
  },
  'es-ES-Wavenet-B': {
    'language': 'Spanish(Spain)',
    'voiceType': 'WaveNet',
    'langCode': 'es-ES',
    'gender': 'MALE'
  },
  'es-ES-Wavenet-C': {
    'language': 'Spanish(Spain)',
    'voiceType': 'WaveNet',
    'langCode': 'es-ES',
    'gender': 'FEMALE'
  },
  'es-ES-Wavenet-D': {
    'language': 'Spanish(Spain)',
    'voiceType': 'WaveNet',
    'langCode': 'es-ES',
    'gender': 'FEMALE'
  },
  'es-US-Neural2-A': {
    'language': 'Spanish(US)',
    'voiceType': 'Neural2',
    'langCode': 'es-US',
    'gender': 'FEMALE'
  },
  'es-US-Neural2-B': {
    'language': 'Spanish(US)',
    'voiceType': 'Neural2',
    'langCode': 'es-US',
    'gender': 'MALE'
  },
  'es-US-Neural2-C': {
    'language': 'Spanish(US)',
    'voiceType': 'Neural2',
    'langCode': 'es-US',
    'gender': 'MALE'
  },
  'es-US-News-D': {
    'language': 'Spanish(US)',
    'voiceType': 'WaveNet',
    'langCode': 'es-US',
    'gender': 'MALE'
  },
  'es-US-News-E': {
    'language': 'Spanish(US)',
    'voiceType': 'WaveNet',
    'langCode': 'es-US',
    'gender': 'MALE'
  },
  'es-US-News-F': {
    'language': 'Spanish(US)',
    'voiceType': 'WaveNet',
    'langCode': 'es-US',
    'gender': 'FEMALE'
  },
  'es-US-News-G': {
    'language': 'Spanish(US)',
    'voiceType': 'WaveNet',
    'langCode': 'es-US',
    'gender': 'FEMALE'
  },
  'es-US-Standard-A': {
    'language': 'Spanish(US)',
    'voiceType': 'Standard',
    'langCode': 'es-US',
    'gender': 'FEMALE'
  },
  'es-US-Standard-B': {
    'language': 'Spanish(US)',
    'voiceType': 'Standard',
    'langCode': 'es-US',
    'gender': 'MALE'
  },
  'es-US-Standard-C': {
    'language': 'Spanish(US)',
    'voiceType': 'Standard',
    'langCode': 'es-US',
    'gender': 'MALE'
  },
  'es-US-Wavenet-A': {
    'language': 'Spanish(US)',
    'voiceType': 'WaveNet',
    'langCode': 'es-US',
    'gender': 'FEMALE'
  },
  'es-US-Wavenet-B': {
    'language': 'Spanish(US)',
    'voiceType': 'WaveNet',
    'langCode': 'es-US',
    'gender': 'MALE'
  },
  'es-US-Wavenet-C': {
    'language': 'Spanish(US)',
    'voiceType': 'WaveNet',
    'langCode': 'es-US',
    'gender': 'MALE'
  },
  'sv-SE-Standard-A': {
    'language': 'Swedish(Sweden)',
    'voiceType': 'Standard',
    'langCode': 'sv-SE',
    'gender': 'FEMALE'
  },
  'sv-SE-Standard-B': {
    'language': 'Swedish(Sweden)',
    'voiceType': 'Standard',
    'langCode': 'sv-SE',
    'gender': 'FEMALE'
  },
  'sv-SE-Standard-C': {
    'language': 'Swedish(Sweden)',
    'voiceType': 'Standard',
    'langCode': 'sv-SE',
    'gender': 'FEMALE'
  },
  'sv-SE-Standard-D': {
    'language': 'Swedish(Sweden)',
    'voiceType': 'Standard',
    'langCode': 'sv-SE',
    'gender': 'MALE'
  },
  'sv-SE-Standard-E': {
    'language': 'Swedish(Sweden)',
    'voiceType': 'Standard',
    'langCode': 'sv-SE',
    'gender': 'MALE'
  },
  'sv-SE-Wavenet-A': {
    'language': 'Swedish(Sweden)',
    'voiceType': 'WaveNet',
    'langCode': 'sv-SE',
    'gender': 'FEMALE'
  },
  'sv-SE-Wavenet-B': {
    'language': 'Swedish(Sweden)',
    'voiceType': 'WaveNet',
    'langCode': 'sv-SE',
    'gender': 'FEMALE'
  },
  'sv-SE-Wavenet-C': {
    'language': 'Swedish(Sweden)',
    'voiceType': 'WaveNet',
    'langCode': 'sv-SE',
    'gender': 'MALE'
  },
  'sv-SE-Wavenet-D': {
    'language': 'Swedish(Sweden)',
    'voiceType': 'WaveNet',
    'langCode': 'sv-SE',
    'gender': 'FEMALE'
  },
  'sv-SE-Wavenet-E': {
    'language': 'Swedish(Sweden)',
    'voiceType': 'WaveNet',
    'langCode': 'sv-SE',
    'gender': 'MALE'
  },
  'ta-IN-Standard-A': {
    'language': 'Tamil(India)',
    'voiceType': 'Standard',
    'langCode': 'ta-IN',
    'gender': 'FEMALE'
  },
  'ta-IN-Standard-B': {
    'language': 'Tamil(India)',
    'voiceType': 'Standard',
    'langCode': 'ta-IN',
    'gender': 'MALE'
  },
  'ta-IN-Standard-C': {
    'language': 'Tamil(India)',
    'voiceType': 'Standard',
    'langCode': 'ta-IN',
    'gender': 'FEMALE'
  },
  'ta-IN-Standard-D': {
    'language': 'Tamil(India)',
    'voiceType': 'Standard',
    'langCode': 'ta-IN',
    'gender': 'MALE'
  },
  'ta-IN-Wavenet-A': {
    'language': 'Tamil(India)',
    'voiceType': 'WaveNet',
    'langCode': 'ta-IN',
    'gender': 'FEMALE'
  },
  'ta-IN-Wavenet-B': {
    'language': 'Tamil(India)',
    'voiceType': 'WaveNet',
    'langCode': 'ta-IN',
    'gender': 'MALE'
  },
  'ta-IN-Wavenet-C': {
    'language': 'Tamil(India)',
    'voiceType': 'WaveNet',
    'langCode': 'ta-IN',
    'gender': 'FEMALE'
  },
  'ta-IN-Wavenet-D': {
    'language': 'Tamil(India)',
    'voiceType': 'WaveNet',
    'langCode': 'ta-IN',
    'gender': 'MALE'
  },
  'te-IN-Standard-A': {
    'language': 'Telugu(India)',
    'voiceType': 'Standard',
    'langCode': 'te-IN',
    'gender': 'FEMALE'
  },
  'te-IN-Standard-B': {
    'language': 'Telugu(India)',
    'voiceType': 'Standard',
    'langCode': 'te-IN',
    'gender': 'MALE'
  },
  'th-TH-Standard-A': {
    'language': 'Thai(Thailand)',
    'voiceType': 'Standard',
    'langCode': 'th-TH',
    'gender': 'FEMALE'
  },
  'tr-TR-Standard-A': {
    'language': 'Turkish(Turkey)',
    'voiceType': 'Standard',
    'langCode': 'tr-TR',
    'gender': 'FEMALE'
  },
  'tr-TR-Standard-B': {
    'language': 'Turkish(Turkey)',
    'voiceType': 'Standard',
    'langCode': 'tr-TR',
    'gender': 'MALE'
  },
  'tr-TR-Standard-C': {
    'language': 'Turkish(Turkey)',
    'voiceType': 'Standard',
    'langCode': 'tr-TR',
    'gender': 'FEMALE'
  },
  'tr-TR-Standard-D': {
    'language': 'Turkish(Turkey)',
    'voiceType': 'Standard',
    'langCode': 'tr-TR',
    'gender': 'FEMALE'
  },
  'tr-TR-Standard-E': {
    'language': 'Turkish(Turkey)',
    'voiceType': 'Standard',
    'langCode': 'tr-TR',
    'gender': 'MALE'
  },
  'tr-TR-Wavenet-A': {
    'language': 'Turkish(Turkey)',
    'voiceType': 'WaveNet',
    'langCode': 'tr-TR',
    'gender': 'FEMALE'
  },
  'tr-TR-Wavenet-B': {
    'language': 'Turkish(Turkey)',
    'voiceType': 'WaveNet',
    'langCode': 'tr-TR',
    'gender': 'MALE'
  },
  'tr-TR-Wavenet-C': {
    'language': 'Turkish(Turkey)',
    'voiceType': 'WaveNet',
    'langCode': 'tr-TR',
    'gender': 'FEMALE'
  },
  'tr-TR-Wavenet-D': {
    'language': 'Turkish(Turkey)',
    'voiceType': 'WaveNet',
    'langCode': 'tr-TR',
    'gender': 'FEMALE'
  },
  'tr-TR-Wavenet-E': {
    'language': 'Turkish(Turkey)',
    'voiceType': 'WaveNet',
    'langCode': 'tr-TR',
    'gender': 'MALE'
  },
  'uk-UA-Standard-A': {
    'language': 'Ukrainian(Ukraine)',
    'voiceType': 'Standard',
    'langCode': 'uk-UA',
    'gender': 'FEMALE'
  },
  'uk-UA-Wavenet-A': {
    'language': 'Ukrainian(Ukraine)',
    'voiceType': 'WaveNet',
    'langCode': 'uk-UA',
    'gender': 'FEMALE'
  },
  'vi-VN-Standard-A': {
    'language': 'Vietnamese(Vietnam)',
    'voiceType': 'Standard',
    'langCode': 'vi-VN',
    'gender': 'FEMALE'
  },
  'vi-VN-Standard-B': {
    'language': 'Vietnamese(Vietnam)',
    'voiceType': 'Standard',
    'langCode': 'vi-VN',
    'gender': 'MALE'
  },
  'vi-VN-Standard-C': {
    'language': 'Vietnamese(Vietnam)',
    'voiceType': 'Standard',
    'langCode': 'vi-VN',
    'gender': 'FEMALE'
  },
  'vi-VN-Standard-D': {
    'language': 'Vietnamese(Vietnam)',
    'voiceType': 'Standard',
    'langCode': 'vi-VN',
    'gender': 'MALE'
  },
  'vi-VN-Wavenet-A': {
    'language': 'Vietnamese(Vietnam)',
    'voiceType': 'WaveNet',
    'langCode': 'vi-VN',
    'gender': 'FEMALE'
  },
  'vi-VN-Wavenet-B': {
    'language': 'Vietnamese(Vietnam)',
    'voiceType': 'WaveNet',
    'langCode': 'vi-VN',
    'gender': 'MALE'
  },
  'vi-VN-Wavenet-C': {
    'language': 'Vietnamese(Vietnam)',
    'voiceType': 'WaveNet',
    'langCode': 'vi-VN',
    'gender': 'FEMALE'
  },
  'vi-VN-Wavenet-D': {
    'language': 'Vietnamese(Vietnam)',
    'voiceType': 'WaveNet',
    'langCode': 'vi-VN',
    'gender': 'MALE'
  },
};
