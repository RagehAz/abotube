import 'dart:io';
import 'dart:typed_data';

import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/texttospeech/v1.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mapper/mapper.dart';
import 'package:stringer/stringer.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:googleapis_auth/googleapis_auth.dart' as gapis;
// import 'package:googleapis/texttospeech/v1.dart' ;

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
  ///
  static Future<File> createVoiceFile({
    @required String videoID,
    @required String text,
    @required String googleLangCode,
    @required String voiceID,
    @required gapis.AuthClient client,
  }) async {
    File _output;

    if (
    TextCheck.isEmpty(text) == false
    &&
    TextCheck.isEmpty(googleLangCode) == false
    &&
    TextCheck.isEmpty(voiceID) == false
    &&
    TextCheck.isEmpty(videoID) == false
    &&
    client != null
    ){

      blog('client is : ${client?.credentials}');

      final SynthesizeSpeechRequest _request = SynthesizeSpeechRequest(
        input: SynthesisInput(
          // ssml:
          text: text,
        ),
        audioConfig: AudioConfig(
          // effectsProfileId: ,
          // pitch: ,
          // sampleRateHertz: ,
          // speakingRate: ,
          // volumeGainDb: ,
          audioEncoding: 'MP3',
        ),
        voice: VoiceSelectionParams(
          // customVoice: ,
          // ssmlGender: ,
          languageCode: googleLangCode,
          name: voiceID,
        ),
      );

      Mapper.blogMap(
        _request.toJson(),
        invoker: 'the _request',
      );

      final SynthesizeSpeechResponse response = await TexttospeechApi(client)
          .text
          .synthesize(_request);

      final List<int> output = response.audioContentAsBytes;

      final String _path = generateTranslatedVoiceFileName(
        videoID: videoID,
        googleLangCode: googleLangCode,
        voiceID: voiceID,
      );

      if (_path != null) {
        _output = File(_path);
        final Uint8List _uint8List = Floaters.getBytesFromInts(output);
        await Filers.writeUint8ListOnFile(
          file: _output,
          uint8list: _uint8List,
        );
      }

    }

    return _output;
  }
  // -----------------------------------------------------------------------------
  ///
  static String generateTranslatedVoiceFileName({
    @required String videoID,
    @required String voiceID,
    @required String googleLangCode,
  }) {
    String _output;

    if (TextCheck.isEmpty(videoID) == false &&
        TextCheck.isEmpty(voiceID) == false &&
        TextCheck.isEmpty(googleLangCode) == false
    ) {
      _output = '${videoID}_${voiceID}_$googleLangCode';
    }

    return _output;
  }
  // -----------------------------------------------------------------------------
}
