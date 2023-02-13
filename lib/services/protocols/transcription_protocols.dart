import 'dart:convert';

import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:stringer/stringer.dart';
import 'package:http/http.dart' as http;
import 'package:rest/rest.dart';

class TranscriptionProtocols {
  // -----------------------------------------------------------------------------

  const TranscriptionProtocols();


  // -----------------------------------------------------------------------------

  /// TEXT CONVERTERS

  // --------------------
  /// TASK : NOT WORKING - NEED TO BE REWRITTEN
  static Map<String, dynamic> formatTranscript(String transcript) {
    final Map<String, dynamic> formattedTranscript = {};
    final List<String> lines = transcript.split('\n');

    for (final String line in lines) {
      final List<String> lineElements = line.split(' ');
      final int timeStamp = int.parse(lineElements[0].replaceAll(':', ''));
      final String text = lineElements.skip(1).join(' ');
      formattedTranscript[timeStamp.toString()] = text;
    }

    return formattedTranscript;
  }
  // --------------------
  /// TASK : TEST ME
  static Map<String, dynamic> convertCheckSubTimeStampToDateTimes({
    @required String checkSubTimeStamp,
  }){
    DateTime _start;
    DateTime _end;

    /// CHECK SUB TIME STAMP LOOKS LIKE THIS : 00:00:00,000 --> 00:00:00,000
    if (TextCheck.isEmpty(checkSubTimeStamp) == false){

      final List<String> _timeStampsStrings = checkSubTimeStamp.split(' --> ');

      /// ASSERT THAT THE TIME STAMPS ARE IN THE CORRECT FORMAT
      assert(_timeStampsStrings.length == 2, 'time stamps are not in the correct format');
      /// ASSERT THAT THE TIME STAMPS ARE NOT EMPTY
      assert(TextCheck.isEmpty(_timeStampsStrings[0]) == false, 'time stamp 1 is empty');
      /// ASSERT THAT A TIME STAMP IN THE CORRECT FORMAT
      // TASK : WRITE ME

      _start = DateTime.parse(_timeStampsStrings[0]);
      _end = DateTime.parse(_timeStampsStrings[1]);

    }

    return {
      'start': _start,
      'end': _end,
    };
  }
  // -----------------------------------------------------------------------------

  /// TEXT CONVERTERS

  // --------------------
  ///
  static Future<String> readCheckSubTranscription({
    @required String videoID,
    @required String langCode,
  }) async {
    String _output = '';

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
