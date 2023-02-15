import 'package:abotube/a_models/video_model.dart';
import 'package:abotube/b_views/x_components/super_video_player/super_video_player.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:bubbles/bubbles.dart';
import 'package:flutter/material.dart';

class DraftVideoCard extends StatelessWidget {
  // --------------------------------------------------------------------------
  const DraftVideoCard({
    @required this.videoModel,
    @required this.number,
    Key key
  }) : super(key: key);
  // --------------------------------------------------------------------------
  final VideoModel videoModel;
  final String number;
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    final double _bubbleWidth = Bubble.bubbleWidth(
      context: context,
    );
     final double _clearWidth = Bubble.clearWidth(
      context: context,
    );


    return Bubble(
      width: _bubbleWidth,
      bubbleHeaderVM: BubbleHeaderVM(
        headlineText: '$number. ${videoModel.title}',
        headlineHeight: 20,
        font: BldrsThemeFonts.fontBldrsHeadlineFont,
      ),
      margin: 10,
      // onBubbleTap: onAddVideo,
      // onBubbleDoubleTap: onAddVideo,
      columnChildren: <Widget>[

          SuperVideoPlayer(
            url: videoModel?.url,
            width: _clearWidth,
          ),

      ],
    );

  }
  // --------------------------------------------------------------------------
}
