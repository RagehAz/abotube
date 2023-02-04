import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mapper/mapper.dart';
import 'package:rest/rest.dart';
import 'package:super_box/super_box.dart';
import 'package:video_translator/b_views/layout/layout.dart';
import 'package:video_translator/services/helpers/helper_methods.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerScreen extends StatefulWidget {
  /// --------------------------------------------------------------------------
  const YoutubePlayerScreen({
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  @override
  _YoutubePlayerScreenState createState() => _YoutubePlayerScreenState();
  /// --------------------------------------------------------------------------
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  // -----------------------------------------------------------------------------
  YoutubePlayerController _controller;
  String _videoID;
  // -----------------------------------------------------------------------------
  /// --- LOADING
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  // --------------------
  Future<void> _triggerLoading({@required bool setTo}) async {
    setNotifier(
      notifier: _loading,
      mounted: mounted,
      value: setTo,
    );
  }
  // -----------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();

    _videoID = 'mqaODYJ702s';

    _controller = YoutubePlayerController(
        initialVideoId: _videoID,
        // flags: const YoutubePlayerFlags(
        //   autoPlay: true,
        // ),
    );

  }
  // --------------------
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit && mounted) {

      _triggerLoading(setTo: true).then((_) async {

        /// FUCK

        await _triggerLoading(setTo: false);
      });

      _isInit = false;
    }
    super.didChangeDependencies();
  }
  // --------------------
  @override
  void dispose() {
    _loading.dispose();
    super.dispose();
  }
  // --------------------------------------------------------------------------
  ///
  Future<Map<String, dynamic>> getTranscriptAndTimestamps() async {

    const String apiKey = 'AIzaSyA32TxS3tQeMZGPEf8y9pvgrLo5rGpz0fs';

    String _url = 'https://www.googleapis.com/youtube/v3/captions?part=snippet&videoId=$_videoID&key=$apiKey';

    _url = 'https://www.googleapis.com/youtube/v3/captions?videoId=$_videoID&part=snippet&key=$apiKey';

    final http.Response _response = await Rest.get(
      context: context,
      rawLink: _url,
      invoker: 'getTranscriptAndTimestamps',
    );

    if (_response.statusCode == 200) {

      final Map<String, dynamic> data = json.decode(_response.body);

      blog('okkkkkkkkkkkkkkk');
      Mapper.blogMap(data);
      blog('okkkkkkkkkkkkkkk');

      final List<dynamic> _items = data['items'];
      for (int i = 0; i < _items.length; i++) {

        blog('item: ${i + 1} : BLOG');
        final Map<String, dynamic> _map = _items[i];
        Mapper.blogMap(_map);

      }

      final String _theID = _items[1]['id'];
      // String _url2 = 'https://www.googleapis.com/youtube/v3/captions/id?id=$_theID';
      // final String _url2 = 'https://www.googleapis.com/youtube/v3/captions?part=snippet&id=$_theID&key=$apiKey';
      // final String _url2 = 'https://www.googleapis.com/youtube/v3/captions?part=snippet&videoId=$_videoID&key=$apiKey';

      final String _url2 = 'http://gdata.youtube.com/feeds/api/videos/$_videoID/captiondata/$_theID';

      final http.Response _response2 = await Rest.get(
        context: context,
        rawLink: _url2,
        invoker: 'getTranscriptAndTimestamps 2 ',
      );

      blog('the response : ${_response2.body}');

      // final transcriptWithTimestamps = <String, dynamic>{};
      // for (final item in data['items']) {
      //   final textTrack = item['snippet'];
      //   final text = textTrack['textDisplay'];
      //   final start = textTrack['startTime'];
      //   final duration = textTrack['duration'];
      //
      //   transcriptWithTimestamps[text] = {
      //     'start': start,
      //     'duration': duration,
      //   };
      // }
      //
      // return transcriptWithTimestamps;

      return null;
    }

    else {
      blog('could not get transcription');
      return null;
    }

  }
  // --------------------
  ///
  Future<Map<String, dynamic>> getVideoInfoFromUrl() async {

        final String videoUrl = 'https://www.youtube.com/watch?v=$_videoID';
  final RegExp regExp = RegExp(
    r'#(?<=v=)[a-zA-Z0-9-]+(?=&)|(?<=v\/)'
    '[^&\n]+(?=\\?)|(?<=v=)[^&\n]+|(?<=youtu.be\\/)'
    '[^&\n]+#',
  );
  final match = regExp.firstMatch(videoUrl);
  final videoId = match.group(0);
  final String _url = 'http://www.youtube.com/get_video_info?&video_id=$videoId';

  final http.Response response = await Rest.get(
      context: context,
      rawLink: _url,
      invoker: 'getVideoInfoFromUrl',
  );

  final responseBody = response.body;
  final videoInfoArray = Uri.splitQueryString(responseBody).cast<String, dynamic>();

  if (videoInfoArray.containsKey('caption_tracks')) {
    final List<String> tracks = videoInfoArray['caption_tracks'].split(',');
    final List<Map<String, dynamic>> trackInfo = [];

    for (final track in tracks) {
      trackInfo.add(Uri.splitQueryString(track).cast<String, dynamic>());
    }
    return {'track_info': trackInfo};
  }
  return {};
}
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --------------------
    return Layout(
      child: ListView(
        children: <Widget>[

          YoutubePlayer(
            controller: _controller,
            onReady: () {
              blog('Player is ready.');
            },
          ),

          SuperBox(
            height: 50,
            verse: 'Get Transcription',
            margins: 10,
            onTap: () async {
              final Map<String, dynamic> _map = await getTranscriptAndTimestamps();
              Mapper.blogMap(_map);
            },
          ),

        ],
      ),
    );
    // --------------------
  }
  // --------------------------------------------------------------------------
}
