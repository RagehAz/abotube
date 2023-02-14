import 'package:abotube/b_views/x_components/layout/basic_layout.dart';
import 'package:abotube/b_views/x_components/players/b_youtube_video_player.dart';
import 'package:flutter/material.dart';
import 'package:layouts/layouts.dart';
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
  String _videoID;
  // -----------------------------------------------------------------------------
  /*
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
   */
  // -----------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();

    _videoID = 'mqaODYJ702s';

    _controller = YoutubePlayerController(
        initialVideoId: _videoID,
        // flags: const YoutubePlayerFlags(
        //   autoPlay: true,
        // ),
    );

  }
  // --------------------
  /*
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
   */
  // --------------------
  @override
  void dispose() {
    // _loading.dispose();
    super.dispose();
  }
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --------------------
    return BasicLayout(
      body: FloatingList(
        // padding: const EdgeInsets.only(top: Ratioz.stratosphere, bottom: Ratioz.horizon),
        columnChildren: <Widget>[

          YoutubeVideoPlayer(
            controller: _controller,
          ),

        ],
      ),
    );
    // --------------------
  }
  // --------------------------------------------------------------------------
}
