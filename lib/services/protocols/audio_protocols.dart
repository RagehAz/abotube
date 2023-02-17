import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:stringer/stringer.dart';
import 'package:text_to_speech/text_to_speech.dart';

class AudioProtocols {
  // --------------------
  /// private constructor to create instances of this class only in itself
  AudioProtocols.singleton();
  // --------------------
  /// Singleton instance
  static final AudioProtocols _singleton = AudioProtocols.singleton();
  // --------------------
  /// Singleton accessor
  static AudioProtocols get instance => _singleton;
  // -----------------------------------------------------------------------------

  /// AUDIO PLAYER SINGLETON

  // --------------------
  AudioPlayer _audioPlayer;
  AudioPlayer get audioPlayer => _audioPlayer ??= AudioPlayer();
  static AudioPlayer getAudioPlayer() => AudioProtocols.instance.audioPlayer;
  // -----------------------------------------------------------------------------

  /// TEXT TO SPEECH

  // --------------------
  TextToSpeech _textToSpeech;
  TextToSpeech get textToSpeech => _textToSpeech ??= TextToSpeech();
  static TextToSpeech getTextToSpeech() => AudioProtocols.instance.textToSpeech;
  // -----------------------------------------------------------------------------

  /// PLAY FILE

  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<void> playFile({
    @required String filePath,
  }) async {

    if (filePath != null){

      final AudioPlayer _audioPlayer = getAudioPlayer();
      await tryAndCatch(
        invoker: 'playFile',
        functions: () async {
          await _audioPlayer.setFilePath(filePath,
            initialPosition: Duration.zero,
            preload: true,
          );
          await _audioPlayer.play();
        },
      );

    }

  }
  // -----------------------------------------------------------------------------

  /// PLAY TEXT TO SPEECH

  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<void> playTextByTextToSpeech({
    @required String text,
    @required String langCode
  }) async {

    if (TextCheck.isEmpty(text) == false && TextCheck.isEmpty(langCode) == false){

      final TextToSpeech tts = TextToSpeech();
      await tts.setLanguage(langCode);
      await tts.speak(text);

    }

  }
  // -----------------------------------------------------------------------------

  // -----------------------------------------------------------------------------
}
