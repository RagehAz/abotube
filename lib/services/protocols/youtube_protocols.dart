import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';
import 'package:stringer/stringer.dart';
import 'package:video_translator/services/helpers/former.dart';

class YoutubeProtocols {
  // --------------------------------------------------------------------------

  const YoutubeProtocols();

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

      blog('downloading video...');
      final dynamic result = await FlutterYoutubeDownloader.downloadVideo(
        url,
        TextMod.fixSearchText(TextMod.fixCountryName(videoTitle)),
        iTag,
    );

    blog('result runType : ${result.runtimeType}');
    blog(result);

    }

  }
  // --------------------------------------------------------------------------

}
