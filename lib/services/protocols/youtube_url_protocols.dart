
class YoutubeURLProtocols {
  // --------------------------------------------------------------------------

  const YoutubeURLProtocols();

  // --------------------------------------------------------------------------

  /// LINK CHECKS

  // --------------------
  /// AI TESTED
  static bool isValidYoutubeLink(String link) {
    final youtubeLinkPattern = RegExp(
        r'^(https?\:\/\/)?(www\.youtube\.com\/watch\?v=|m\.youtube\.com\/watch\?v=|youtu\.be\/)([a-zA-Z0-9_-]+)');
    return youtubeLinkPattern.hasMatch(link);
  }
  // --------------------
  /// AI TESTED
  static String extractVideoID(String link) {
    String _output;

    if (isValidYoutubeLink(link) == true) {

      final youtubeLinkPattern = RegExp(
          r'^(https?\:\/\/)?(www\.youtube\.com\/watch\?v=|m\.youtube\.com\/watch\?v=|youtu\.be\/)([a-zA-Z0-9_-]+)');

      final match = youtubeLinkPattern.firstMatch(link);

      _output = match.group(3);
    }

    return _output;
  }
  // --------------------
  /// AI TESTED
  static bool isValidYoutubeVideoID(String videoID) {
    final youtubeVideoIdPattern = RegExp(r'^[a-zA-Z0-9_-]+$');
    return youtubeVideoIdPattern.hasMatch(videoID) && videoID.length <= 11;
  }
  // --------------------------------------------------------------------------
}
