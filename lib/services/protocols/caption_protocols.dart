// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

import 'package:abotube/a_models/caption_model.dart';
import 'package:abotube/services/protocols/google_translator.dart';
import 'package:abotube/services/standards.dart';
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mapper/mapper.dart';
import 'package:rest/rest.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis/youtube/v3.dart';
import 'package:stringer/stringer.dart';

class YouTubeCaptionProtocols {
  // -----------------------------------------------------------------------------

  const YouTubeCaptionProtocols();

  // -----------------------------------------------------------------------------

  /// GOOGLE API CAPTIONS

  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<String> readCaptionsByGoogleAPI({
    @required String videoID,
    @required String langCode,
  }) async {
    String _output;

    blog('readCaptionsByGoogleAPI : START : videoID : $videoID : langCode : $langCode');

    if (videoID != null && langCode != null && langCode.length == 2){

      /// Authenticate with the API using the provided API key.
      final http.Client client = clientViaApiKey(
        Standards.youtubeDataAPIAndroidKey,
        // baseClient:
      );

      final youtube = YouTubeApi(client);

      /// Make a request to the API to get the captions for the video.
      final captions = await youtube.captions.download(
        videoID,
        tlang: langCode,
        // onBehalfOf:,
        // onBehalfOfContentOwner: ,
        // downloadOptions: ,
        // tfmt: ,
      );

      /// Decode the captions from the response and return the result.
      _output = captions.stream.toString();

    }

    blog('readCaptionsByGoogleAPI : END');

    return _output;
  }
  // -----------------------------------------------------------------------------

  /// CHECK SUB CAPTIONS

  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<String> readCaptionsByCheckSub({
    @required String videoID,
    @required String langCode,
  }) async {
    String _output;

    blog('readCaptionsByCheckSub : START : videoID : $videoID : langCode : $langCode');

    if (videoID != null && langCode != null && langCode.length == 2){

      final String _link =  'https://checksub-downloader-doybj.ondigitalocean.app//'
                            'automatic_srt_download?'
                            'url=https:'
                            '%'
                            '2F'
                            '%'
                            '2Fwww.youtube.com'
                            '%'
                            '2Fwatch'
                            '%'
                            '3Fv'
                            '%'
                            '3D$videoID'
                            '&'
                            'lang=$langCode';


      /// GET REQUEST
      final http.Response _response = await Rest.get(
        rawLink: _link,
        invoker: 'readTranscription',
      );

      /// ERROR
      if (_response.statusCode >= 400) {
        blog('the response : error code : ${_response.statusCode} : ${_response.body}');
      }

      /// SUCCESS
      else if (_response.statusCode == 200) {
        final String _captions = utf8.decode(_response.bodyBytes);
        // blog('Captions : $_captions');
        _output = _captions;
      }

    }

    blog('readCaptionsByCheckSub : END');

    return _output;
  }
  // -----------------------------------------------------------------------------

  /// GOOGLE TRANSLATE CAPTIONS

  // --------------------
  ///
  static Future<List<CaptionModel>> googleTranslateEachCaptionSeparately({
    @required List<CaptionModel> originalCaptions,
    @required String toLang,
    @required String fromLang,
  }) async {
    final List<CaptionModel> _output = <CaptionModel>[];

    if (
    Mapper.checkCanLoopList(originalCaptions) == true
    &&
    TextCheck.isEmpty(toLang) == false
    &&
    TextCheck.isEmpty(fromLang) == false
    ){

      await Future.wait(<Future>[

        ...List.generate(originalCaptions.length, (index){

          return _googleTranslateACaption(
            caption: originalCaptions[index],
            from: fromLang,
            to: toLang,
          ).then((translatedCaption){
            _output.add(translatedCaption);
          });

        }),

      ]);

    }

    return CaptionModel.sortCaptionsBySecond(_output);
  }
  // --------------------
  ///
  static Future<String> googleTranslateCaptionAtOnce({
    @required List<CaptionModel> originalCaptions,
    @required String toLang,
    @required String fromLang,
  }) async {
    String _output;

    if (
    Mapper.checkCanLoopList(originalCaptions) == true
    &&
    TextCheck.isEmpty(toLang) == false
    &&
    TextCheck.isEmpty(fromLang) == false
    ){

      final String _paragraph = CaptionModel.combineCaptionsIntoString(
          captions: originalCaptions,
      );

      _output = await GoogleTranslate.translate(
        input: _paragraph,
        from: fromLang,
        to: toLang,
      );


    }

    return _output;
  }
  // --------------------
  ///
  static Future<CaptionModel> _googleTranslateACaption({
    @required CaptionModel caption,
    @required String from,
    @required String to,
  }) async {
    CaptionModel _output;

    if (caption != null){

      final String _translation = await GoogleTranslate.translate(
          input: caption.text,
          from: from,
          to: to,
      );

        _output = CaptionModel(
          text: _translation,
          start: caption.start,
          duration: caption.duration
      );


    }

    return _output;
  }
  // -----------------------------------------------------------------------------
}
