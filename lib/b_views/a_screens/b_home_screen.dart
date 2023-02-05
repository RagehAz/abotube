import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:super_box/super_box.dart';
import 'package:video_translator/b_views/x_components/players/mp4_video_player.dart';
import 'package:video_translator/b_views/x_components/players/youtube_video_player.dart';
import 'package:video_translator/b_views/x_components/layout/layout.dart';
import 'package:video_translator/services/navigation/navigators.dart';

class HomeScreen extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const HomeScreen({
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    // final double _referenceLength = Scale.screenShortestSide(context);

    return Layout(
      child: ListView(
        children: <Widget>[

          SuperBox(
            height: 50,
            verse: 'Video by MP4 URL',
            color: Colorz.bloodTest,
            onTap: () => Nav.goToNewScreen(
                context: context,
                screen: const MP4VideoPlayerScreen(),
            ),
          ),

          SuperBox(
            height: 50,
            verse: 'Video by Youtube URL',
            color: Colorz.bloodTest,
            onTap: () => Nav.goToNewScreen(
                context: context,
                screen: const YoutubePlayerScreen(),
            ),
          ),

        ],
      ),
    );

  }
  /// --------------------------------------------------------------------------
}
