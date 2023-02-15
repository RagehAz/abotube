import 'dart:io';

import 'package:abotube/b_views/x_components/super_video_player/super_video_player.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:bubbles/bubbles.dart';
import 'package:flutter/material.dart';
import 'package:super_box/super_box.dart';

class VideoCard extends StatelessWidget {
  // --------------------------------------------------------------------------
  const VideoCard({
    @required this.headline,
    @required this.loading,
    this.file,
    this.url,
    this.bubbleWidth,
    this.onAddVideo,
    Key key
  }) : super(key: key);
  // --------------------------------------------------------------------------
  final String headline;
  final bool loading;
  final File file;
  final String url;
  final double bubbleWidth;
  final Function onAddVideo;
  // --------------------------------------------------------------------------
  /// TESTED : WORKS PERFECT
  bool _canShowAddButton(){

    if (url != null){
      return false;
    }
    else if (file != null){
      return false;
    }
    else if (onAddVideo != null){
      return true;
    }
    else {
      return false;
    }

  }
  // --------------------------------------------------------------------------
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

    final bool _canShowAddVideoButton = _canShowAddButton();

    return Bubble(
      width: _bubbleWidth,
      bubbleHeaderVM: BubbleHeaderVM(
        headlineText: headline,
        // headlineHeight: 30,
        font: BldrsThemeFonts.fontBldrsHeadlineFont,
      ),
      margin: 10,
      onBubbleTap: onAddVideo,
      onBubbleDoubleTap: onAddVideo,
      columnChildren: <Widget>[

        Stack(
          children: <Widget>[

            if (file != null || url != null)
              SuperVideoPlayer(
                file: file,
                url: url,
                width: _clearWidth,
              ),

            if (_canShowAddVideoButton == true)
              VideoBox(
                width: _clearWidth,
                child: SuperBox(
                  height: _clearWidth * 0.1,
                  icon: Iconz.plus,
                  bubble: false,
                  text: 'ADD VIDEO',
                  textFont: BldrsThemeFonts.fontBldrsHeadlineFont,
                  textItalic: true,
                  iconSizeFactor: 0.7,
                  textScaleFactor: 1.8,
                ),
              ),

            if (_canShowAddVideoButton == true)
              SuperBox(
                width: _clearWidth,
                height: VideoBox.getHeightByAspectRatio(
                  aspectRatio: 16 / 9,
                  width: _clearWidth,
                  force169: true,
                ),
                onTap: onAddVideo,
              ),

          ],
        ),

      ],
    );
  }

  /// --------------------------------------------------------------------------
}
