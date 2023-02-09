import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:bubbles/bubbles.dart';
import 'package:flutter/material.dart';
import 'package:super_box/super_box.dart';

class VideoCard extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const VideoCard({
    @required this.headline,
    @required this.loading,
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  final String headline;
  final bool loading;
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final double _bubbleWidth = Bubble.bubbleWidth(
      context: context,
    );

    return Bubble(
      width: _bubbleWidth,
      bubbleHeaderVM: BubbleHeaderVM(
        headlineText: headline,
        headlineHeight: 40,
        font: BldrsThemeFonts.fontBldrsHeadlineFont,
      ),
      margin: 10,
      columnChildren: <Widget>[

        /// PLAY ICON
        SuperBox(
          width: _bubbleWidth - 20,
          height: (_bubbleWidth - 20) * 0.5,
          icon: Iconz.play,
          iconSizeFactor: 0.5,
          iconColor: Colorz.blue20,
          color: Colorz.white10,
          bubble: false,
          loading: loading,
        ),

      ],
    );
  }

  /// --------------------------------------------------------------------------
}
