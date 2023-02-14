import 'dart:io';

import 'package:abotube/b_views/x_components/players/a_super_video_player.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:bubbles/bubbles.dart';
import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const VideoCard({
    @required this.headline,
    @required this.loading,
    this.file,
    this.url,
    this.bubbleWidth,
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  final String headline;
  final bool loading;
  final File file;
  final String url;
  final double bubbleWidth;
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    final double _bubbleWidth = Bubble.bubbleWidth(
      context: context,
      bubbleWidthOverride: bubbleWidth,
    );

    final double _clearWidth = Bubble.clearWidth(
      context: context,
      bubbleWidthOverride: bubbleWidth,
    );

    return Bubble(
      width: _bubbleWidth,
      bubbleHeaderVM: BubbleHeaderVM(
        headlineText: headline,
        // headlineHeight: 30,
        font: BldrsThemeFonts.fontBldrsHeadlineFont,
      ),
      margin: 10,
      columnChildren: <Widget>[

        if (file != null || url != null)
        SuperVideoPlayer(
          file: file,
          url: url,
          width: _clearWidth,
        ),

      ],
    );
  }

  /// --------------------------------------------------------------------------
}
