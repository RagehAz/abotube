import 'package:flutter/material.dart';
import 'package:scale/scale.dart';
import 'package:video_translator/services/helpers/helper_methods.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayerWidget extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const YouTubePlayerWidget({
    @required this.controller,
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  final YoutubePlayerController controller;
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return YoutubePlayer(
      /// MAIN
      key: const ValueKey<String>('YouTubePlayer'),
      controller: controller,

      /// SIZING
      width: Scale.screenWidth(context),
      // aspectRatio: 16 / 9,
      // actionsPadding: EdgeInsets.all(8.0),

      /// STYLING
      // showVideoProgressIndicator: false,
      // bufferIndicator: ,
      // liveUIColor: Colors.red,
      // thumbnail: ,

      /// BEHAVIOUR
      // controlsTimeOut: const Duration(seconds: 3),

      /// PROGRESS
      // progressIndicatorColor: ,
      // progressColors: ,

      /// ACTIONS
      // topActions: ,
      // bottomActions: ,

      /// FUNCTIONS
      onReady: () {
        blog('YouTubePlayer is READY.');
      },
      onEnded: (YoutubeMetaData metaData) {
        blog('YouTubePlayer is ENDED : metaData : $metaData');
      },

    );

  }

  /// --------------------------------------------------------------------------
}
