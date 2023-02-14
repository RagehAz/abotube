import 'dart:io';

import 'package:abotube/b_views/x_components/layout/basic_layout.dart';
import 'package:abotube/b_views/x_components/players/a_super_video_player.dart';
import 'package:flutter/material.dart';
import 'package:layouts/layouts.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const VideoPlayerScreen({
    this.file,
    this.url,
    this.controller,
    Key key
  }) : super(key: key);
  // --------------------
  final String url;
  final File file;
  final VideoPlayerController controller;
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return BasicLayout(
      body: FloatingList(
        // padding: const EdgeInsets.only(top: Ratioz.stratosphere, bottom: Ratioz.horizon),
        columnChildren: <Widget>[

          /// VIDEO PLAYER
          SuperVideoPlayer(
            url: url,
            file: file,
            controller: controller,
          ),

        ],
      ),
    );

  }
  /// --------------------------------------------------------------------------
}
