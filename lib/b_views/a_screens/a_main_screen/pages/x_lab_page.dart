import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:abotube/a_models/video_model.dart';
import 'package:abotube/b_views/a_screens/x_url_video_player_screen.dart';
import 'package:abotube/b_views/a_screens/x_youtube_player_screen.dart';
import 'package:abotube/b_views/x_components/buttons/lab_button.dart';
import 'package:abotube/b_views/x_components/dialogs/language_selector_dialog.dart';
import 'package:abotube/services/navigation/navigators.dart';
import 'package:abotube/services/protocols/caption_protocols.dart';
import 'package:abotube/services/protocols/google_translator.dart';
import 'package:abotube/services/protocols/video_protocols.dart';
import 'package:abotube/services/theme/abo_tube_colors.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:bubbles/bubbles.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/texttospeech/v1.dart' as tts;
import 'package:googleapis/youtube/v3.dart' as yt;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:layouts/layouts.dart';
import 'package:mapper/mapper.dart';
import 'package:rest/rest.dart';
import 'package:text_to_speech/text_to_speech.dart';
/// ------------------------------------------------------
class LabPage extends StatelessWidget {
  // --------------------------------------------------------------------------
  const LabPage({
    Key key
  }) : super(key: key);
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --------------------
    return FloatingList(
        // padding: const EdgeInsets.only(top: Ratioz.stratosphere, bottom: Ratioz.horizon),
        columnChildren: <Widget>[

          const DotSeparator(),

          /// GO TO MP4 PLAYER
          LabButton(
            text: 'Go to MP4 Player',
            icon: Iconz.play,
            worksPerfect: true,
            onTap: () => Nav.goToNewScreen(
                context: context,
                screen: const VideoPlayerScreen(
                  url:  'https://rr3---sn-uxaxjvhxbt2u-j5pl6.googlevideo.com/videoplay'
                        'back?expire=1676584357&ei=RVHuY-C1Boyr1waFmIToCw&ip=156.213.10'
                        '6.139&id=o-AJ8QEaXC7B85O6cA9lXPOhHZpB46HH524SyQa8ToHd4l&itag=1'
                        '8&source=youtube&requiressl=yes&mh=qE&mm=31%2C29&mn=sn-uxaxjvh'
                        'xbt2u-j5pl6%2Csn-25ge7nsd&ms=au%2Crdu&mv=m&mvi=3&pl=18&initcwn'
                        'dbps=797500&vprv=1&mime=video%2Fmp4&ns=Pr44Hz3gWErqAJjrl6vvm3IL'
                        '&gir=yes&clen=3247990&ratebypass=yes&dur=81.269&lmt=167625433249'
                        '6294&mt=1676562323&fvip=2&fexp=24007246&c=WEB&txp=5538434&n=ZjxiY'
                        '7ZTPAlHhZI&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequi'
                        'ressl%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&si'
                        'g=AOq0QJ8wRQIhAMht-jvTeMtRLeG8iG3Y6HofKInkpZHnQ0ZwAm4nMY_jAiAy1wKm'
                        'EGVML1lfOq2eisKdS_4QuzqorISfjXYBwlfIsw%3D%3D&lsparams=mh%2Cmm%2Cm'
                        'n%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIgN7kZNCqgHvn'
                        'a0ti2lNSTtaf6wz6QT37DNwkEXpkNUH4CIQCEVeoo0nmetAngrtAjtukC71zjCrAV'
                        'IVnTkKhkI-QHNw%3D%3D',
                )
            ),
          ),

          /// GO TO YOUTUBE PLAYER
          LabButton(
            worksPerfect: true,
            text: 'Go to Youtube player',
            icon: Iconz.comYoutube,
            onTap: () => Nav.goToNewScreen(
              context: context,
              screen: const YoutubePlayerScreen(
                videoID: 'QRS8MkLhQmM',
              ),
            ),
          ),

          /// PICK VIDEO FROM GALLERY
          LabButton(
            worksPerfect: true,
            text: 'Pick video from Gallery',
            icon: Iconz.fingerTap,
            onTap: () async {

              final File _file = await VideoProtocols.pickGalleryVideo();

              if (_file != null) {

                await Nav.goToNewScreen(
                  context: context,
                  screen: VideoPlayerScreen(
                    file: _file,
                  ),
                );
              }

              },
          ),


          const DotSeparator(),

          /// DOWNLOAD CAPTION BY YOUTUBE API
          LabButton(
            worksPerfect: false,
            text: 'Download Caption by Youtube API',
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
              final yt.CaptionListResponse captionListResponse =
                  await ytApi.captions.list(['id', 'snippet'], 'QRS8MkLhQmM');
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
                  yt.YouTubeApi.youtubeForceSslScope,
                  yt.YouTubeApi.youtubepartnerScope
                ],
              );

              try {
                await _googleSignIn.signIn();
              } on Exception catch (error) {
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

                final String _url2 =
                    'http://gdata.youtube.com/feeds/api/videos/$_videoID/captiondata/$_theID';

                final http.Response _response2 = await Rest.get(
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
              } else {
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
                rawLink: _url,
                invoker: 'getVideoInfoFromUrl',
              );

              final responseBody = response.body;
              final videoInfoArray = Uri.splitQueryString(responseBody).cast<String, dynamic>();

              if (videoInfoArray.containsKey('caption_tracks')) {
                final List<String> tracks =
                    videoInfoArray['caption_tracks'].split(',');
                final List<Map<String, dynamic>> trackInfo = [];

                for (final track in tracks) {
                  trackInfo
                      .add(Uri.splitQueryString(track).cast<String, dynamic>());
                }
                return {'track_info': trackInfo};
              }

              return {};
            },
          ),

          /// CHECK SUB DOWNLOADER
          LabButton(
            worksPerfect: true,
            text: 'Read Transcription',
            icon: Iconz.language,
            onTap: () async {
              // const String _videoID = 'mqaODYJ702s';

              const String link = 'https://www.youtube.com/watch?v=bl4gyaM5BEQ';

              blog('link : $link');

              final String _videoID = VideoModel.extractVideoIDFromYoutubeURL(link);

              final String _transcription = await YouTubeCaptionProtocols.readCaptionsByCheckSub(
                videoID: _videoID,
                langCode: 'ar',
              );

              log('GOT. TRANSCRIPTION : $_transcription');

            },
          ),

          const DotSeparator(),

          /// PLAY GENERATE VOICE
          LabButton(
            worksPerfect: true,
            text: 'Play Generated Voice',
            icon: Iconz.advertise,
            onTap: () async {
              final String _to = await showLanguageDialog();

              if (_to != null) {

                final TextToSpeech tts = TextToSpeech();
                const text = 'What is up mother fuckers';
                const String _from = 'en';
                final String _translation = await GoogleTranslate.translate(
                    input: text,
                    from: _from,
                    to: _to,
                );

                // final String _lang = tts.getDisplayLanguageByCode(langCode)
                await tts.setLanguage(_to);

                // final languages = await tts.getLanguages();
                // blog('languages : $languages');

                if (_translation != null) {
                  await tts.speak(_translation);
                } else {
                  blog('is null,,, can not play');
                }
              }
            },
          ),

          /// TTS GOOGLE APIS
          LabButton(
            worksPerfect: true,
            text: 'Get Audio by google API',
            icon: Iconz.comGooglePlay,
            onTap: () async {

              final  _googleSignIn = GoogleSignIn(
                // clientId: '1003450512869-0he8njpnhm9lklo2ba7jp4dl109dmms8.apps.googleusercontent.com',
                scopes: [
                  'email',
                  tts.TexttospeechApi.cloudPlatformScope
                ],
              );

              await _googleSignIn.signIn();

              final client = await _googleSignIn.authenticatedClient();

              blog('client is : ${client.credentials}');

              final input = tts.SynthesisInput(
                // ssml:
                text: ''' ماذا تفعل ايها الصعلوك يا خول يا كلب الكلاب''',
              );

              ///  REFERENCE : https://cloud.google.com/text-to-speech/docs/voices
              final parameters = tts.VoiceSelectionParams(
                languageCode: 'ar-XA',
                name: 'ar-XA-Wavenet-B', // 'ar-XA-Wavenet-A'
                // customVoice: ,
                // ssmlGender: ,
              );

              final config = tts.AudioConfig(
                audioEncoding: 'MP3',
                // effectsProfileId: ,
                // pitch: ,
                // sampleRateHertz: ,
                // speakingRate: ,
                // volumeGainDb: ,
              );

              final request = tts.SynthesizeSpeechRequest(
                input: input,
                audioConfig: config,
                voice: parameters,
              );

              Mapper.blogMap(
                request.toJson(),
                invoker: 'the request',
              );

              final response = await tts.TexttospeechApi(client).text.synthesize(request);

              final List<int> output = response.audioContentAsBytes;

              final File _file = await Filers.createNewEmptyFile(fileName:'testFile');
              final Uint8List _uint8List = Floaters.getBytesFromInts(output);
              await Filers.writeUint8ListOnFile(file: _file, uint8list: _uint8List);

              blog('the output is : $output');

              final AudioPlayer player = AudioPlayer();

              await player.setFilePath(_file.path);
              // await player.setAudioSource(ByteSourceThing(output));
              await player.play();

            },
          ),

          const DotSeparator(),

          /// SEPARATE AUDIO FROM VIDEO
          LabButton(
            worksPerfect: false,
            text: 'Separate Video from audio',
            icon: AboTubeTheme.abotube_logo,
            onTap: () async {

              final ImagePicker _picker = ImagePicker();

              /// TASK : NEED TO BE SINGLETON
              final XFile image = await _picker.pickVideo(
                source: ImageSource.gallery,
                // maxDuration:,
                // preferredCameraDevice: ,
              );

              if (image != null) {
                final File _file = File(image.path);

                final String videoFilePath = await Filers.createNewFilePath(
                  fileName: 'test_video_video.mp4',
                  // useTemporaryDirectory: true,
                );

                final String audioFilePath = await Filers.createNewFilePath(
                  fileName: 'test_video_audio.mp3', //.aac',
                  // useTemporaryDirectory: true,
                );

                await extractAudioAndSaveVideo(
                  audioPath: audioFilePath,
                  videoFile: _file,
                  videoPath: videoFilePath,
                );
              }
            },
          ),

          const DotSeparator(),

          // /// TEXT FIELD
          // Form(
          //   key: _formKey,
          //   child: TextFieldBubble(
          //     formKey: _formKey,
          //     isFormField: true,
          //     bubbleHeaderVM: const BubbleHeaderVM(
          //       font: BldrsThemeFonts.fontBldrsHeadlineFont,
          //       headlineText: 'Youtube URL',
          //     ),
          //     bubbleWidth: _bubbleWidth,
          //     pasteFunction: _onPaste,
          //     hintText: 'https://www.youtube.com/watch?v=5UTmN8jPJS0',
          //     textController: _textController,
          //     validator: (String text) => Formers.webSiteValidator(
          //       context: context,
          //       website: _textController.text,
          //     ),
          //     fieldTextFont: BldrsThemeFonts.fontBldrsBodyFont,
          //   ),
          // ),

        ],
      );
    // --------------------
  }
  // --------------------------------------------------------------------------
}
/// ------------------------------------------------------
Future<void> extractAudioAndSaveVideo({
  @required File videoFile,
  @required String audioPath,
  @required String videoPath,
}) async {
  // final FlutterFFmpeg _flutterFFmpeg = FlutterFFmpeg();

  // Stringer.blogStrings(
  //   strings: [
  //     videoFile?.path,
  //     audioPath,
  //     videoPath,
  //   ],
  //   invoker: 'extractAudioAndSaveVideo',
  // );
  //
  // String cmd = '-i ${videoFile.path} -vn -acodec copy $audioPath';
  //
  // cmd = '-i ${videoFile.path} -map 0:a -acodec libmp3lame $audioPath';

  // int rc = await _flutterFFmpeg.execute(cmd);

  // if (rc == 0) {
  //   blog('Audio extracted successfully');
  //   cmd = '-i ${videoFile.path} -an -vcodec copy $videoPath';
  //   rc = await _flutterFFmpeg.execute(cmd);
  //   if (rc == 0) {
  //     blog('Video without audio saved successfully');
  //   } else {
  //     blog('Failed to save video without audio');
  //   }
  // }

  // else {
  //   blog('Failed to extract audio');
  // }
}
/// ------------------------------------------------------
// Future<void> thing() async {
//   final FlutterFFmpeg _flutterFFmpeg = FlutterFFmpeg();
//
//   const String videoFilePath = '/path/to/video.mp4';
//   const String audioFilePath = '/path/to/audio.aac';
//   const String cmd = '-i $videoFilePath -vn -acodec copy $audioFilePath';
// }
/// ------------------------------------------------------
/*
class ByteSourceThing extends StreamAudioSource {


  ByteSourceThing(this.bytes);

  final List<int> bytes;

  @override
  Future<StreamAudioResponse> request([int start, int end]) async {
    start ??= 0;
    end ??= bytes.length;
    return StreamAudioResponse(
      sourceLength: bytes.length,
      contentLength: end - start,
      offset: start,
      stream: Stream.value(bytes.sublist(start, end)),
      contentType: 'audio/mpeg',
    );
  }
}
 */
/// ------------------------------------------------------
