import 'dart:async';
import 'dart:convert';

import 'package:abotube/a_models/video_model.dart';
import 'package:abotube/services/helpers/former.dart';
import 'package:abotube/services/ldb/video_ldb_ops.dart';
import 'package:abotube/services/protocols/youtube_url_protocols.dart';
import 'package:abotube/services/standards.dart';
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:rest/rest.dart';

class YoutubeProtocols {
  // --------------------------------------------------------------------------

  const YoutubeProtocols();

  // --------------------------------------------------------------------------

  /// COMPOSE VIDEO MODEL

  // --------------------
  ///
  static Future<VideoModel> composeVideoModel({
    @required String url,
    @required String videoTitle,
    int iTag = 18,
  }) async {
    VideoModel _videoModel;

    final bool _isURLFormat = Formers.isURLFormat(url);

    if (_isURLFormat == true) {

      /// DOWNLOAD VIDEO
      unawaited(
        downloadYoutubeVideo(
        url: url,
        videoTitle: videoTitle,
        iTag: iTag,
      )
      );

      /// CREATE INITIAL VIDEO MODEL
      _videoModel = VideoModel(
        id: YoutubeURLProtocols.extractVideoID(url),
        url: url,
        title: VideoModel.fixVideoTitle(videoTitle),
        captions: const [],
      );

      /// INSERT VIDEO MODEL INTO LDB
      await VideoLDBOps.insert(
        videoModel: _videoModel,
      );

    }

    /// RETURN VIDEO MODEL
    return _videoModel;
  }
  // --------------------------------------------------------------------------

  /// DOWNLOAD VIDEO

  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<void> downloadYoutubeVideo({
    @required String url,
    @required String videoTitle,
    int iTag = 18, // for clearer use 22 : u may use these : (22, 137, 18);
  }) async {

    final bool _isURLFormat = Formers.isURLFormat(url);

    if (_isURLFormat == true){

      blog('downloading video : $url');
      final dynamic result = await FlutterYoutubeDownloader.downloadVideo(
        url,
        VideoModel.fixVideoTitle(videoTitle),
        iTag,
    );

    blog('result runType : ${result.runtimeType}');
    blog(result);

    }

  }
  // --------------------------------------------------------------------------

  /// CHECK VIDEO

  // --------------------
  /// TASK : TEST ME
  static Future<bool> checkYoutubeVideoExists(String videoId) async {

    const String youtubeDataApiKey = Standards.apiKey;
    final url = 'https://www.googleapis.com/youtube/v3/videos?part=id&id=$videoId&key=$youtubeDataApiKey';
    final http.Response response = await Rest.get(rawLink: url, invoker: 'isValidYoutubeVideoId');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['items'].isNotEmpty) {
        return true;
      }
    }

    return false;
  }
  // --------------------------------------------------------------------------
}
