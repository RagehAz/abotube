import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:bubbles/bubbles.dart';
import 'package:flutter/material.dart';
import 'package:numeric/numeric.dart';
import 'package:super_box/super_box.dart';
import 'package:video_translator/b_views/x_components/layout/layout.dart';

class HomeScreen extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const HomeScreen({
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    // final double _referenceLength = Scale.screenShortestSide(context);
    final double _bubbleWidth = Bubble.bubbleWidth(
      context: context,
    );

    const List<String> _videos = <String>[
      'Video One',
      'Video Two',
      'Video Three',
      'Video Four',
      'Video Five',
      'Video Six',
      'Video Seven',
      'Video Eight',
      'Video Nine',
      'Video Ten',
    ];

    return Layout(
      canGoBack: false,
      viewWidget: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _videos.length + 1,
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemBuilder: (_, int index){

          final bool _isFirst = index == 0;

          /// ADD VIDEO BUTTON
          if (_isFirst == true){
            return SuperBox(
              width: _bubbleWidth,
              height: 60,
              icon: Iconz.plus,
              iconSizeFactor: 0.7,
            );
          }

          /// OLD VIDEOS
          else {

            final int _videoIndex = index - 1;
            final int _num = _videoIndex + 1;
            final String _n = Numeric.formatIndexDigits(
              index: _num,
              listLength: _videos.length,
            );
            final String _videoHeadline = _videos[_videoIndex];

            return Bubble(
              width: _bubbleWidth,
              bubbleHeaderVM: BubbleHeaderVM(
                headlineText: '$_n : $_videoHeadline',
                headlineHeight: 40,
                font: BldrsThemeFonts.fontBldrsHeadlineFont,

              ),
              margin: 10,
              columnChildren: <Widget>[

                SuperBox(
                  width: _bubbleWidth - 20,
                  height: (_bubbleWidth - 20) * 0.5,
                  icon: Iconz.play,
                  iconSizeFactor: 0.5,
                  iconColor: Colorz.blue20,
                  color: Colorz.white10,
                  bubble: false,
                ),

              ],
            );


          }


          },
      ),
    );

  }
  /// --------------------------------------------------------------------------
}