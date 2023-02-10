import 'dart:convert';

import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:bubbles/bubbles.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/youtube/v3.dart' as yt;
import 'package:http/http.dart' as http;
import 'package:mapper/mapper.dart';
import 'package:rest/rest.dart';
import 'package:video_translator/b_views/a_screens/d_url_video_player_screen.dart';
import 'package:video_translator/b_views/a_screens/e_youtube_player_screen.dart';
import 'package:video_translator/b_views/x_components/buttons/lab_button.dart';
import 'package:video_translator/b_views/x_components/layout/floating_list.dart';
import 'package:video_translator/b_views/x_components/layout/layout.dart';
import 'package:video_translator/services/helpers/helper_methods.dart';
import 'package:video_translator/services/navigation/navigators.dart';

class LabScreen extends StatelessWidget {
  // --------------------------------------------------------------------------
  const LabScreen({
    Key key
  }) : super(key: key);
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --------------------
    return Layout(
      viewWidget: FloatingList(
        columnChildren: <Widget>[

          const DotSeparator(),

          /// GO TO MP4 PLAYER
          LabButton(
            text: 'Go to MP4 Player',
            icon: Iconz.play,
            worksPerfect: true,
            onTap: () => Nav.goToNewScreen(context: context, screen: const URLVideoPlayerScreen()),
          ),

          /// GO TO YOUTUBE PLAYER
          LabButton(
            worksPerfect: true,
            text: 'Go to Youtube player',
            icon: Iconz.comYoutube,
            onTap: () => Nav.goToNewScreen(
              context: context,
              screen: const YoutubePlayerScreen(),
            ),
          ),

          const DotSeparator(),

          /// DOWNLOAD CAPTION BY YOUTUBE API
          LabButton(
            worksPerfect: false,
            text: 'Download Caption by YouTube API',
            icon: Iconz.arrowDown,
            onTap: () async {

              /// INITIALIZE GOOGLE SIGN IN
              final GoogleSignIn _googleSignIn = GoogleSignIn(
                scopes: [
                  'email',
                  yt.YouTubeApi.youtubeForceSslScope,
                  yt.YouTubeApi.youtubepartnerScope
                ],
              );

              /// SIGN IN
              await _googleSignIn.signIn();

              /// GET AUTH CLIENT
              /*
                  import 'package:googleapis_auth/googleapis_auth.dart' as gapis;
                  gapis.AuthClient
               */
              final client = await _googleSignIn.authenticatedClient();

              /// GET YOUTUBE API BY CLIENT
              final yt.YouTubeApi ytApi = yt.YouTubeApi(client);

              /// GET CAPTIONS
              final yt.CaptionListResponse captionListResponse = await ytApi.captions.list(['id', 'snippet'], 'QRS8MkLhQmM');
              blog(captionListResponse.items.first.snippet);
              // {etag: Nw8zsyeakXPebhD7p_lco001UFY, id: AUieDaZJvCxYN_YF11eqr6XSB3OMpoQa7E9sTBliDb_p6472IBA, kind: youtube#caption}

              /// DOWNLOAD CAPTION
              final yt.Media caption = await ytApi.captions.download(
                captionListResponse.items.first.id,
              );
              blog(caption);

            },
          ),

          /// SIGN IN BY GOOGLE
          LabButton(
            worksPerfect: false,
            text: 'Sign in by google',
            icon: Iconz.comGooglePlay,
            onTap: () async {

              /// INITIALIZE GOOGLE SIGN IN
              final GoogleSignIn _googleSignIn = GoogleSignIn(
                scopes: [
                  'email',
                  'https://www.googleapis.com/auth/youtube.force-ssl',
                  'https://www.googleapis.com/auth/youtubepartner'
                ],
              );

              try {
                await _googleSignIn.signIn();
              }

              on Exception catch (error) {
                blog(error);
              }

                },
          ),

          const DotSeparator(),

          /// GET TRANSCRIPTION BY GET REQUEST
          LabButton(
            worksPerfect: false,
            text: 'Get Transcription by GET request',
            icon: Iconz.comWebsite,
            onTap: () async {

              const String _videoID = 'mqaODYJ702s';

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

                Mapper.blogMap(data);

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

            },
          ),

          /// GET VIDEO INFO API
          LabButton(
            worksPerfect: false,
            text: 'Get Video Info API',
            icon: Iconz.comWebsite,
            onTap: () async {

              const String _videoID = 'mqaODYJ702s';

              const String videoUrl = 'https://www.youtube.com/watch?v=$_videoID';

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
            },

          ),

          /// CHECK SUB DOWNLOADER
          LabButton(
            worksPerfect: false,
            text: 'checksub downloader API',
            icon: Iconz.comWebsite,
            onTap: () async {

              // const String _videoID = 'mqaODYJ702s';

              String _link = 'https://checksub-downloader-doybj.ondigitalocean'
                  '.app//manual_srt_download?url=https:%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DzQodZYvfTAA&lang=en';

              _link = 'https://checksub-downloader-doybj.ondigitalocean'
                  '.app//automatic_srt_download?url=https:%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DzQodZYvfTAA&lang=ar';

              final http.Response _thing = await Rest.get(
                  context: context,
                  rawLink: _link,
                  invoker: 'thing',
              );

              blog(utf8.encode(_thing.body));

            },

          ),

          const DotSeparator(),

          /// EXTRACT YOUTUBE VIDEO
          LabButton(
            worksPerfect: true,
            text: 'EXTRACT youtube Video and open viewer',
            icon: Iconz.comYoutube,
            onTap: () async {

              // ignore: constant_identifier_names
              const String youTube_link = 'https://www.youtube.com/watch?v=WrK_Vnl3S-0';
              String link;

              try {

                link = await FlutterYoutubeDownloader.extractYoutubeLink(youTube_link, 18);

                if (link != null){
                  await Nav.goToNewScreen(
                    context: context,
                    screen: URLVideoPlayerScreen(
                      url: link,
                    ),
                );
                }

              }

              on PlatformException {
                link = 'Failed to Extract YouTube Video Link.';
              }

              blog('link : $link');

            },

          ),

          /// EXTRACT YOUTUBE VIDEO
          LabButton(
            worksPerfect: true,
            text: 'Download youtube Video to device',
            icon: Iconz.comYoutube,
            onTap: () async {

              // ignore: constant_identifier_names
              const String youTube_link = 'https://www.youtube.com/watch?v=1GXacjZyGyQ';

              final dynamic result = await FlutterYoutubeDownloader.downloadVideo(
                  youTube_link,
                  'videoTitle',
                  18
              );

              blog('result runType : ${result.runtimeType}');
              blog(result);

            },

          ),

          const DotSeparator(),

        ],
      ),
    );
    // --------------------
  }
// --------------------------------------------------------------------------
}
