import 'dart:io';

import 'package:abotube/b_views/x_components/buttons/player_button.dart';
import 'package:abotube/b_views/x_components/layout/basic_layout.dart';
import 'package:abotube/b_views/x_components/players/the_video_player.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:bubbles/bubbles.dart';
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:layouts/layouts.dart';
import 'package:numeric/numeric.dart';
import 'package:scale/scale.dart';
import 'package:super_text/super_text.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  /// --------------------------------------------------------------------------
  const VideoPlayerScreen({
    this.file,
    this.url,
    Key key
  }) : super(key: key);

  final String url;
  final File file;
  /// --------------------------------------------------------------------------
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
  /// --------------------------------------------------------------------------
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  // --------------------------------------------------------------------------
  VideoPlayerController _videoPlayerController;
  VideoPlayerValue _videoValue;
  // --------------------
  String _link;
  // --------------------
  static const double _maxVolume = 1;
  double _volume = 1;
  // --------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();

    _initializeVideo();

  }
  // --------------------
  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
  // --------------------------------------------------------------------------

  /// INITIALIZATION

  // --------------------
  /// TESTED : WORKS PERFECT
  void _initializeVideo(){

    _link = widget.url ?? 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';

    if (widget.url != null){
      _videoPlayerController = VideoPlayerController.network(
        _link,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
      ..initialize()
      ..setVolume(_volume)
      ..play()
      ..addListener(() => setState(() => _videoValue = _videoPlayerController.value));
    }

    if (widget.file != null){
      _videoPlayerController = VideoPlayerController.file(
        widget.file,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
      ..initialize()
      ..setVolume(_volume)
      ..play()
      ..addListener(() => setState(() => _videoValue = _videoPlayerController.value));
    }

  }
  // --------------------------------------------------------------------------

  /// CONTROLS

  // --------------------
  /// TESTED : WORKS PERFECT
  void _play() {

    setState(() {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
    });
    // _value.isPlaying.log();

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  void _pause() {

    setState(() {
      _videoPlayerController.pause();
      _videoPlayerController.setLooping(false);
    });
    // _value.isPlaying.log();

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  void _setVolume({
    @required double volume
  }) {

    if (_volume != volume){
      setState(() {
        _videoPlayerController.setVolume(volume);
        _volume = volume;
      });
    }

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  void _increaseVolume(){

    final bool _canIncrease = _volume < _maxVolume;

    blog('canIncrease : $_canIncrease : _volume : $_volume : _maxVolume : $_maxVolume');

    if (_canIncrease){
      _setVolume(
        volume: _fixVolume(
          num: _volume + 0.1,
          isIncreasing: true,
        ),
      );
    }

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  void _decreaseVolume(){

    if (_volume > 0){
      _setVolume(
        volume: _fixVolume(
          num: _volume - 0.1,
          isIncreasing: false,
        ),
      );
    }
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  double _fixVolume({
    @required double num,
    @required bool isIncreasing,
  }){

    /// INCREASING
    if (isIncreasing){
      final double _n = (num * 10).ceilToDouble();
      return Numeric.removeFractions(number: _n) / 10;
    }

    /// DECREASING
    else {
      final double _n = (num * 10).floorToDouble();
      return Numeric.removeFractions(number: _n) / 10;
    }

  }
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    // --------------------
    return BasicLayout(
      body: FloatingList(
        // padding: const EdgeInsets.only(top: Ratioz.stratosphere, bottom: Ratioz.horizon),
        columnChildren: <Widget>[

          /// VIDEO PLAYER
          TheVideoPlayer(
            onTap: _play,
            onDoubleTap: _pause,
            width: Scale.screenWidth(context),
            videoPlayerController: _videoPlayerController,
            videoValue: _videoValue,
          ),

          const DotSeparator(),

          /// VIDEO CONTROLS PANEL
          Container(
            width: Scale.screenWidth(context),
            height: 60,
            color: Colorz.white10,
            alignment: Alignment.center,
            child: FloatingList(
              scrollDirection: Axis.horizontal,
              columnChildren: <Widget>[

                /// PLAY
                PlayerButton(
                  icon: Iconz.play,
                  onTap: _play,
                ),

                /// PAUSE
                PlayerButton(
                  icon: Iconz.pause,
                  onTap: _pause,
                ),

                /// INCREASE VOLUME
                PlayerButton(
                  icon: Iconz.arrowUp,
                  onTap: _increaseVolume,
                ),

                /// DECREASE VOLUME
                PlayerButton(
                  icon: Iconz.arrowDown,
                  onTap: _decreaseVolume,
                ),

              ],
            ),
          ),

          /// VOLUME
          SuperText(
            text: 'Volume : $_volume',
            textHeight: 30,
          ),

          const DotSeparator(),

        ],
      ),
    );
    // --------------------

  }
  // --------------------------------------------------------------------------
}
