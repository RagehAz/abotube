import 'package:abotube/services/standards.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest/rest.dart';

@immutable
class VideoModel {
  // -----------------------------------------------------------------------------
  const VideoModel({
    @required this.id,
    @required this.title,
    @required this.url,
});
  // -----------------------------------------------------------------------------
  final String id;
  final String title;
  final String url;
  // -----------------------------------------------------------------------------

  /// CYPHERS

  // --------------------
  /// TESTED : WORKS PERFECT
  Map<String, dynamic> toMap(){
    return  {
      'id': id,
      'title': title,
      'url': url,
    };
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static VideoModel decipher(Map<String, dynamic> map){

    if (map == null) {
      return null;
    }
    else {
      return VideoModel(
        id: map['id'],
        title: map['title'],
        url: map['url'],
      );
    }

  }
  // -----------------------------------------------------------------------------

  /// LINK CHECKS

  // --------------------
  /// AI TESTED
  static bool isValidYouTubeLink(String link) {
    final youtubeLinkPattern = RegExp(
        r'^(https?\:\/\/)?(www\.youtube\.com\/watch\?v=|m\.youtube\.com\/watch\?v=|youtu\.be\/)([a-zA-Z0-9_-]+)');
    return youtubeLinkPattern.hasMatch(link);
  }
  // --------------------
  /// AI TESTED
  static String extractVideoID(String link) {
    String _output;

    if (isValidYouTubeLink(link) == true) {

      final youtubeLinkPattern = RegExp(
          r'^(https?\:\/\/)?(www\.youtube\.com\/watch\?v=|m\.youtube\.com\/watch\?v=|youtu\.be\/)([a-zA-Z0-9_-]+)');

      final match = youtubeLinkPattern.firstMatch(link);

      _output = match.group(3);
    }

    return _output;
  }
  // --------------------
  /// AI TESTED
  static bool isValidYouTubeVideoID(String videoId) {
    final youtubeVideoIdPattern = RegExp(r'^[a-zA-Z0-9_-]+$');
    return youtubeVideoIdPattern.hasMatch(videoId) && videoId.length <= 11;
  }
  // --------------------
  /// TASK : TEST ME
  static Future<bool> checkYouTubeVideoExists(String videoId) async {

    const String youtubeDataApiKey = Standards.apiKey;
    final url = 'https://www.googleapis.com/youtube/v3/videos?part=id&id=$videoId&key=$youtubeDataApiKey';
    final http.Response response = await Rest.get(rawLink: url, invoker: 'isValidYouTubeVideoId');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['items'].isNotEmpty) {
        return true;
      }
    }

    return false;
  }
  // -----------------------------------------------------------------------------

  /// TRANSCRIPTION

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
  // -----------------------------------------------------------------------------

  /// EQUALITY

  // --------------------
  /// TESTED : WORKS PERFECT
  static bool checkVideoModelsAreIdentical(VideoModel model1, VideoModel model2){
    bool _identical = false;

    if (model1 == null && model2 == null){
      _identical = true;
    }

    else if (model1 != null && model2 != null) {
      if (
      model1.id == model2.id &&
      model1.title == model2.title &&
      model1.url == model2.url
    ) {
        _identical = true;
      }
    }

    return _identical;
  }
  // -----------------------------------------------------------------------------

  /// OVERRIDES

  // --------------------
  /*
   @override
   String toString() => 'MapModel(key: $key, value: ${value.toString()})';
   */
  // --------------------
  @override
  bool operator == (Object other){

    if (identical(this, other)) {
      return true;
    }

    bool _areIdentical = false;
    if (other is VideoModel){
      _areIdentical = checkVideoModelsAreIdentical(
        this,
        other,
      );
    }

    return _areIdentical;
  }
  // --------------------
  @override
  int get hashCode =>
      id.hashCode^
      url.hashCode^
      title.hashCode;
  // -----------------------------------------------------------------------------
}
