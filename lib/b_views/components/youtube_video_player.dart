import 'package:flutter/material.dart';
import 'package:youtube_translator/b_views/layout/layout.dart';
import 'package:youtube_translator/services/helpers/helper_methods.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerScreen extends StatefulWidget {
  /// --------------------------------------------------------------------------
  const YoutubePlayerScreen({
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  @override
  _YoutubePlayerScreenState createState() => _YoutubePlayerScreenState();
  /// --------------------------------------------------------------------------
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  // -----------------------------------------------------------------------------
  YoutubePlayerController _controller;
  // -----------------------------------------------------------------------------
  /// --- LOADING
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  // --------------------
  Future<void> _triggerLoading({@required bool setTo}) async {
    setNotifier(
      notifier: _loading,
      mounted: mounted,
      value: setTo,
    );
  }
  // -----------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: 'iLnmTe5Q2Qw',
        flags: YoutubePlayerFlags(
          autoPlay: true,
        ),
    );
  }
  // --------------------
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit && mounted) {

      _triggerLoading(setTo: true).then((_) async {

        /// FUCK

        await _triggerLoading(setTo: false);
      });

      _isInit = false;
    }
    super.didChangeDependencies();
  }
  // --------------------
  @override
  void dispose() {
    _loading.dispose();
    super.dispose();
  }
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --------------------
    return Layout(
      child:  YoutubePlayer(
      controller: _controller,
      onReady: () {

        blog('Player is ready.');

      },
    ),
    );
    // --------------------
  }
  // --------------------------------------------------------------------------
}
