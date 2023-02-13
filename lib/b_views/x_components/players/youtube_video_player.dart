import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:scale/scale.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayer extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const YoutubeVideoPlayer({
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
      key: const ValueKey<String>('YoutubeVideoPlayer'),
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
        blog('YoutubePlayer is READY.');
      },
      onEnded: (YoutubeMetaData metaData) {
        blog('YoutubePlayer is ENDED : metaData : $metaData');
      },

    );

  }

  /// --------------------------------------------------------------------------
}
