part of super_video_player;

class YoutubeVideoPlayer extends StatefulWidget {
  // --------------------------------------------------------------------------
  const YoutubeVideoPlayer({
    @required this.videoID,
    this.width,
    this.autoPlay = false,
    Key key
  }) : super(key: key);
  // --------------------------------------------------------------------------
  final String videoID;
  final double width;
  final bool autoPlay;
  // --------------------------------------------------------------------------
  @override
  State<YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
  // --------------------------------------------------------------------------
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  // --------------------------------------------------------------------------
  YoutubePlayerController _controller;
  // -----------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();

    final bool _isValidVideoID = YoutubeURLProtocols.isValidYoutubeVideoID(widget.videoID);

    if (_isValidVideoID == true){
      _controller = YoutubePlayerController(
        initialVideoId: widget.videoID,
        // flags: const YoutubePlayerFlags(
        //   autoPlay: true,
        // ),
      );
    }

    if (widget.autoPlay == true){
      _controller.play();
    }
    else {
      _controller.pause();
    }

  }
  // --------------------
  @override
  Widget build(BuildContext context) {

    final double _width = widget.width ?? Scale.screenWidth(context);

    if (_controller == null){
      return VideoBox(
        width: _width,
        boxColor: Colorz.yellow255,
      );
    }

    else {
      return VideoBox(
        width: _width,
        child: YoutubePlayer(
        /// MAIN
        key: const ValueKey<String>('YoutubeVideoPlayer'),
        controller: _controller,

        /// SIZING
        width: _width,
        // aspectRatio: 16 / 9,
        // actionsPadding: EdgeInsets.all(8.0),

        /// STYLING
        // showVideoProgressIndicator: false,
        // bufferIndicator: ,
        // liveUIColor: Colors.red,
        // thumbnail: ,

        /// BEHAVIOUR
        // controlsTimeOut: const Duration(seconds: 3),

        /// PROGRESS
        // progressIndicatorColor: ,
        // progressColors: ,

        /// ACTIONS
        // topActions: ,
        // bottomActions: ,

        /// FUNCTIONS
        onReady: () {
          blog('YoutubePlayer is READY.');
        },
        onEnded: (YoutubeMetaData metaData) {
          blog('YoutubePlayer is ENDED : metaData : $metaData');
        },

    ),
      );
    }

  }
  // --------------------------------------------------------------------------
}
