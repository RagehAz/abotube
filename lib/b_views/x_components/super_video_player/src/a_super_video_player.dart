part of super_video_player;

class SuperVideoPlayer extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const SuperVideoPlayer({
    this.file,
    this.url,
    this.width,
    Key key
  }) : super(key: key);
  // --------------------
  final String url;
  final File file;
  final double width;
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    /// URL
    if (url != null){

      final bool _isYoutubeLink = YoutubeURLProtocols.isValidYoutubeLink(url);

      /// YOUTUBE URL
      if (_isYoutubeLink == true){
        return YoutubeVideoPlayer(
          videoID: YoutubeURLProtocols.extractVideoID(url),
          width: width,
        );
      }

      /// MP4 URL
      else {
        return FileAndURLVideoPlayer(
          url: url,
          width: width,
        );
      }

    }

    /// FILE
    else if (file != null){
      return FileAndURLVideoPlayer(
          file: file,
          width: width,
        );
    }

    /// NOTHING
    else {
      return VideoBox(
        width: width,
      );
    }

  }

}
