import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:super_box/super_box.dart';
import 'package:video_player/video_player.dart';

class URLVideoPlayer extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const URLVideoPlayer({
    @required this.onTap,
    @required this.onDoubleTap,
    @required this.width,
    @required this.videoValue,
    @required this.videoPlayerController,
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
   final Function onTap;
   final Function onDoubleTap;
   final double width;
   final VideoPlayerValue videoValue;
   final VideoPlayerController videoPlayerController;
  // --------------------
  /// TESTED : WORKS PERFECT
  static double getHeightByAspectRatio({
    @required double aspectRatio,
    @required double width,
  }){
    double _output;

    if (aspectRatio != null && width != null){
      /// AspectRatio = (widthA / heightA)
      ///             = (widthB / heightB)
      ///
      /// so heightB = widthB / aspectRatio
      _output = width / aspectRatio;
    }

    return _output;
  }
  // --------------------
  @override
  Widget build(BuildContext context) {

    final double _boxHeight = getHeightByAspectRatio(
        width: width,
        aspectRatio: 16 / 9,
    );

    final double _height = getHeightByAspectRatio(
        width: width,
        aspectRatio: videoValue?.aspectRatio,
    );

    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: Container(
        width: width,
        height: _boxHeight,
        color: Colorz.black255,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[

            /// VIDEO CARD
            if (videoValue?.isInitialized == true && videoValue?.isBuffering == false)
            SizedBox(
              width: width,
              height: _height,
              child: Card(
                  clipBehavior: Clip.antiAlias,
                  /// to clip the child corners to be circular forcefully
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  // color: Colorz.black255,
                  child: VideoPlayer(videoPlayerController)
              ),
            ),

            /// LOADING
            if (videoValue?.isInitialized == false)
            SuperBox(
              height: width * 0.3,
              width: width * 0.3,
              icon: Iconz.reload,
              bubble: false,
              opacity: 0.5,
              loading: true,
            ),

            /// PLAY ICON ON TOP
            if (videoValue?.isPlaying == false)
            SuperBox(
              height: width * 0.3,
              width: width * 0.3,
              icon: Iconz.play,
              bubble: false,
              opacity: 0.5,
            )

          ],
        ),
      ),
    );

  }
  /// --------------------------------------------------------------------------
}
