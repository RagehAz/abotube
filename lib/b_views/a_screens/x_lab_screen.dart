import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/youtube/v3.dart' as yt;
import 'package:video_translator/b_views/x_components/buttons/lab_button.dart';
import 'package:video_translator/b_views/x_components/layout/floating_list.dart';
import 'package:video_translator/b_views/x_components/layout/layout.dart';
import 'package:video_translator/b_views/x_components/players/mp4_video_player.dart';
import 'package:video_translator/b_views/x_components/players/youtube_video_player.dart';
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

          /// GO TO MP4 PLAYER
          LabButton(
            text: 'Go to MP4 Player',
            icon: Iconz.play,
            onTap: () => Nav.goToNewScreen(context: context, screen: const MP4VideoPlayerScreen()),
          ),

          /// GO TO YOUTUBE PLAYER
          LabButton(
            text: 'Go to Youtube player',
            icon: Iconz.comYoutube,
            onTap: () => Nav.goToNewScreen(
              context: context,
              screen: const YoutubePlayerScreen(),
            ),
          ),

          /// DOWNLOAD CAPTION
          LabButton(
            text: 'Download Caption by YouTube API',
            icon: Iconz.arrowDown,
            onTap: () async {

              final _googleSignIn = GoogleSignIn(
                scopes: [
                  'email',
                  yt.YouTubeApi.youtubeForceSslScope,
                  yt.YouTubeApi.youtubepartnerScope
                ],
              );

              await _googleSignIn.signIn();
              final client = await _googleSignIn.authenticatedClient();

              /// get captions using youtube api
              final yt.YouTubeApi ytApi = yt.YouTubeApi(client);
              final captionListResponse = await ytApi.captions.list(['id', 'snippet'], 'QRS8MkLhQmM');
              blog(captionListResponse.items.first.snippet);

              // {etag: Nw8zsyeakXPebhD7p_lco001UFY, id: AUieDaZJvCxYN_YF11eqr6XSB3OMpoQa7E9sTBliDb_p6472IBA, kind: youtube#caption}

              final caption = await ytApi.captions.download(
                captionListResponse.items.first.id,
              );

              blog(caption);

            },
          ),

          /// SIGN IN BY GOOGLE
          LabButton(
            text: 'Sign in by google',
            icon: Iconz.comGooglePlay,
            onTap: () async {

                  final _googleSignIn = GoogleSignIn(
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

        ],
      ),
    );
    // --------------------
  }
// --------------------------------------------------------------------------
}
