import 'dart:io';

import 'package:abotube/b_views/x_components/players/aa_video_viewer.dart';
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:scale/scale.dart';
import 'package:video_player/video_player.dart';

class SuperVideoPlayer extends StatefulWidget {
  /// --------------------------------------------------------------------------
  const SuperVideoPlayer({
    this.file,
    this.url,
    this.controller,
    this.width,
    Key key
  }) : super(key: key);
  // --------------------
  final String url;
  final File file;
  final VideoPlayerController controller;
  final double width;
  /// --------------------------------------------------------------------------
  @override
  _SuperVideoPlayerState createState() => _SuperVideoPlayerState();
  // --------------------------------------------------------------------------
  /// TESTED : WORKS PERFECT
  static VideoPlayerController initializeVideoController({
    @required ValueNotifier<VideoPlayerValue> videoValue,
    @required bool mounted,
    String url,
    File file,
  }) {
    VideoPlayerController _output;

    final String _link = url ??
        'https://commondatastorage.googleapis'
            '.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';

    if (url != null) {
      _output = VideoPlayerController.network(_link,
          videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
        ..initialize()
        ..setVolume(1)
        ..play()
        ..addListener(() => _listenToVideo(
          mounted: mounted,
          videoValue: videoValue,
          videoPlayerController: _output,
        ));
    }

    if (file != null) {
      _output = VideoPlayerController.file(file,
          videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
        ..initialize()
        ..setVolume(1)
        ..play()
        ..addListener(() => _listenToVideo(
          mounted: mounted,
          videoValue: videoValue,
          videoPlayerController: _output,
        ));
    }

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static void _listenToVideo({
    @required ValueNotifier<VideoPlayerValue> videoValue,
    @required VideoPlayerController videoPlayerController,
    @required bool mounted,
  }) {
    setNotifier(
      notifier: videoValue,
      mounted: mounted,
      value: videoPlayerController.value,
    );
  }
  // --------------------------------------------------------------------------
}

class _SuperVideoPlayerState extends State<SuperVideoPlayer> {
  // --------------------------------------------------------------------------
  final ValueNotifier<VideoPlayerValue> _videoValue = ValueNotifier(null);
  final ValueNotifier<bool> _isChangingVolume = ValueNotifier(false);
  VideoPlayerController _videoPlayerController;
  // --------------------
  double _volume = 1;
  // --------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();

    _videoPlayerController = widget.controller ?? SuperVideoPlayer.initializeVideoController(
      url: widget.url,
      file: widget.file,
      videoValue: _videoValue,
      mounted: mounted,
    );

  }
  // --------------------
  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _isChangingVolume.dispose();
    _videoValue.dispose();
    super.dispose();
  }
  // --------------------------------------------------------------------------

  /// CONTROLS

  // --------------------
  /// TESTED : WORKS PERFECT
  void _play() {

    setState(() {
      _videoPlayerController?.play();
      _videoPlayerController?.setLooping(true);
    });
    // _value.isPlaying.log();

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  void _pause() {

    setState(() {
      _videoPlayerController?.pause();
      _videoPlayerController?.setLooping(false);
    });
    // _value.isPlaying.log();

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  Future<void> _setVolume(double volume) async {

    if (_volume != volume){
      setState(() {
        _videoPlayerController?.setVolume(volume);
        _volume = volume;
      });
    }

  }
  // --------------------
  /*
  /// TESTED : WORKS PERFECT
  Future<void> _increaseVolume() async {

    final bool _canIncrease = _volume < _maxVolume;

    blog('canIncrease : $_canIncrease : _volume : $_volume : _maxVolume : $_maxVolume');

    if (_canIncrease){
      await _setVolume(
        _fixVolume(
          num: _volume + 0.1,
          isIncreasing: true,
        ),
      );
    }

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  Future<void> _decreaseVolume() async {

    if (_volume > 0){
      await _setVolume(
        _fixVolume(
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
   */
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    // --------------------
    return VideoViewer(
          onPlay: _play,
          onPause: _pause,
          width: widget.width ?? Scale.screenWidth(context),
          videoPlayerController: _videoPlayerController,
          videoValue: _videoValue,
          onVolumeChanged: _setVolume,
          isChangingVolume: _isChangingVolume,
        );
    // --------------------

  }
  // --------------------------------------------------------------------------
}
