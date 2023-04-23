import 'package:abotube/b_views/x_components/super_video_player/super_video_player.dart';
import 'package:flutter/material.dart';
import 'package:layouts/layouts.dart';

class YoutubePlayerScreen extends StatelessWidget {
  // --------------------------------------------------------------------------
  const YoutubePlayerScreen({
    @required this.videoID,
    Key key
  }) : super(key: key);
  // --------------------
  final String videoID;
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return BasicLayout(
      body: FloatingList(
        // padding: const EdgeInsets.only(top: Ratioz.stratosphere, bottom: Ratioz.horizon),
        columnChildren: <Widget>[

          YoutubeVideoPlayer(
            videoID: videoID,
          ),

        ],
      ),
    );

  }
  // --------------------------------------------------------------------------
}
