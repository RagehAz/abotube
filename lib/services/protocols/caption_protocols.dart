// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest/rest.dart';

class YouTubeCaptionProtocols {
  // -----------------------------------------------------------------------------

  const YouTubeCaptionProtocols();

  // -----------------------------------------------------------------------------

  /// TEXT CONVERTERS

  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<String> readCheckSubTranscription({
    @required String videoID,
    @required String langCode,
  }) async {
    String _output;

    blog('readTranscription : START : videoID : $videoID : langCode : $langCode');

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

    blog('readTranscription : END');

    return _output;
  }
  // -----------------------------------------------------------------------------
}
