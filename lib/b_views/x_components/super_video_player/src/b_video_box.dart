part of super_video_player;

class VideoBox extends StatelessWidget {
  // --------------------------------------------------------------------------
  const VideoBox({
    @required this.width,
    this.child,
    this.boxColor = Colorz.black255,
    Key key,
  }) : super(key: key);
  // --------------------------------------------------------------------------
  final double width;
  final Widget child;
  final Color boxColor;
  // --------------------------------------------------------------------------
    /// TESTED : WORKS PERFECT
  static double getHeightByAspectRatio({
    @required double aspectRatio,
    @required double width,
    @required bool force169,
  }){
    double _output = width / (16 / 9);

    if (aspectRatio != null && width != null && force169 == false) {
      /// AspectRatio = (widthA / heightA)
      ///             = (widthB / heightB)
      ///
      /// so heightB = widthB / aspectRatio
      _output = width / aspectRatio;
    }

    return _output;
  }
  // --------------------------------------------------------------------------
    /// TESTED : WORKS PERFECT
  static BorderRadius getCorners({
    @required double width,
  }) {
    return BorderRadius.circular(width * 0.03);
  }
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    final double _height = getHeightByAspectRatio(
      aspectRatio: 16 / 9,
      width: width,
      force169: true,
    );

    final BorderRadius _borders = getCorners(
      width: width,
    );

    return Container(
      width: width,
      height: _height,
      decoration: BoxDecoration(
        borderRadius: _borders,
        color: boxColor,
      ),
      child: ClipRRect(
        borderRadius: _borders,
        child: child,
      ),
    );

  }
  // --------------------------------------------------------------------------
}
