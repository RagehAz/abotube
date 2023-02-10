import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:bubbles/bubbles.dart';
import 'package:flutter/material.dart';
import 'package:numeric/numeric.dart';
import 'package:super_box/super_box.dart';
import 'package:video_translator/b_views/x_components/cards/video_card.dart';
import 'package:video_translator/b_views/x_components/layout/layout.dart';
import 'package:video_translator/services/navigation/navigators.dart';
import 'package:video_translator/services/navigation/routing.dart';

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
              onTap: () => Nav.goToRoute(context, Routing.translator),
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

            return VideoCard(
              loading:  false,
              headline: '$_n : $_videoHeadline',
            );

          }

          },
      ),
    );

  }
  /// --------------------------------------------------------------------------
}
