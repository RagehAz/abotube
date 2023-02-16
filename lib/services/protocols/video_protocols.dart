import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:abotube/a_models/video_model.dart';
import 'package:abotube/services/helpers/former.dart';
import 'package:abotube/services/ldb/video_ldb_ops.dart';
import 'package:abotube/services/standards.dart';
import 'package:external_path/external_path.dart';
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:rest/rest.dart';
import 'package:stringer/stringer.dart';
import 'package:youtube_metadata/youtube_metadata.dart';

class VideoProtocols {
  // --------------------------------------------------------------------------

  const VideoProtocols();

  // -----------------------------------------------------------------------------

  /// PICKING

  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<File> pickGalleryVideo() async {

    /// TASK : NEED TO BE SINGLETON
    final ImagePicker _picker = ImagePicker();

    final XFile image = await _picker.pickVideo(
      source: ImageSource.gallery,
      // maxDuration:,
      // preferredCameraDevice: ,
    );

    if (image == null) {
      return null;
    }
    else {
      return File(image.path);
    }

  }
  // -----------------------------------------------------------------------------

  /// COMPOSE VIDEO MODEL

  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<VideoModel> composeVideoModel({
    @required String url,
    int iTag = 18,
  }) async {
    VideoModel _videoModel;

    final bool _isURLFormat = Formers.isURLFormat(url);

    if (_isURLFormat == true) {

      /// DOWNLOAD VIDEO
      downloadYoutubeVideo(
        url: url,
        iTag: iTag,
      );

      final MetaDataModel metaData = await YoutubeMetaData.getData(url);

      /// CREATE INITIAL VIDEO MODEL
      _videoModel = VideoModel(
        id: VideoModel.extractVideoIDFromYoutubeURL(url),
        url: url,
        title: metaData.title,
        captions: const [],
        createdAt: DateTime.now(),
        isTranslated: false,
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

  /// DOWNLOADING

  // --------------------
  /// TESTED : WORKS PERFECT
  static void downloadYoutubeVideo({
    @required String url,
    int iTag = 18, // for clearer use 22 : u may use these : (22, 137, 18);
  }) {

    final bool _isURLFormat = Formers.isURLFormat(url);
    final String _videoID = VideoModel.extractVideoIDFromYoutubeURL(url);
    blog('downloading video : _isURLFormat : $_isURLFormat : _videoID : $_videoID : url : $url');

    if (_isURLFormat == true){

      /// THIS NEVER ENDS
      // final dynamic result = await
      FlutterYoutubeDownloader.downloadVideo(
        url,
        _videoID,
        iTag,
    );

    // blog('result runType : ${result.runtimeType}');
    // blog(result);

    }

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<String> getDownloadedVideoPath({
    @required String videoID,
  }) async {
    String _output;

    if (TextCheck.isEmpty(videoID) == false) {

      final String filePath = await _createVideoFilePath(
        videoID: videoID,
      );

      final String gallery = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS,
      );
      final String _path = '$gallery/${videoID}mp4.mp4';
      final bool _exists = await File(_path).exists();
      blog('_path : $_path : _exists : $_exists');
      if (_exists == true){
        _output = filePath;
      }

    }

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<String> _createVideoFilePath({
    @required String videoID,
  }) async {
    String _output;

    if (TextCheck.isEmpty(videoID) == false) {
      final String gallery = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS,
      );

      _output = '$gallery/${videoID}mp4.mp4';
    }

    return _output;
  }
  // --------------------
  /// TASK : TEST ME
  static Future<File> getDownloadedVideoFile({
    @required String videoID,
  }) async {

    final String _path = await getDownloadedVideoPath(
      videoID: videoID,
    );

    if (_path == null){
      return null;
    }

    else {
      return File(_path);
    }

  }
  // --------------------------------------------------------------------------

  /// RENOVATE

  // --------------------
  ///
  // --------------------------------------------------------------------------

  /// WIPE

  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<void> wipeVideo({
    @required String videoID,
  }) async {

    if (videoID != null) {

      await VideoLDBOps.delete(id: videoID);

      await deleteVideoFileFromDeviceDownloads(
        videoID: videoID,
      );

    }

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<void> deleteVideoFileFromDeviceDownloads({
    @required String videoID,
  }) async {

    final String _videoPath = await getDownloadedVideoPath(
      videoID: videoID,
    );

    if (_videoPath != null){
      await File(_videoPath).delete(recursive: true);
    }

  }
  // --------------------------------------------------------------------------

  /// EXISTENCE

  // --------------------
  /// TASK : TEST ME
  static Future<bool> checkVideoExistsOnYoutube(String videoID) async {

    const String youtubeDataApiKey = Standards.apiKey;
    final url = 'https://www.googleapis.com/youtube/v3/videos?part=id&id=$videoID&key=$youtubeDataApiKey';
    final http.Response response = await Rest.get(rawLink: url, invoker: 'isValidYoutubeVideoId');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['items'].isNotEmpty) {
        return true;
      }
    }

    return false;
  }
  // --------------------
    /// TESTED : WORKS PERFECT
  static Future<bool> checkVideoIsDownloaded({
    @required String videoID
  }) async {

    final String _path = await getDownloadedVideoPath(
      videoID: videoID,
    );

    return _path != null;
  }
  // --------------------------------------------------------------------------
}
