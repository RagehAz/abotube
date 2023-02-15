import 'package:abotube/a_models/caption_model.dart';
import 'package:flutter/material.dart';
import 'package:mapper/mapper.dart';
import 'package:stringer/stringer.dart';

@immutable
class VideoModel {
  // -----------------------------------------------------------------------------
  const VideoModel({
    @required this.id,
    @required this.title,
    @required this.url,
    @required this.captions,
});
  // -----------------------------------------------------------------------------
  final String id;
  final String title;
  final String url;
  final List<CaptionModel> captions;
  // -----------------------------------------------------------------------------

  /// CYPHERS

  // --------------------
  /// TESTED : WORKS PERFECT
  Map<String, dynamic> toMap(){
    return  {
      'id': id,
      'title': title,
      'url': url,
      'captions': CaptionModel.cipherCaptions(captions),
    };
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static VideoModel decipher(Map<String, dynamic> map){

    if (map == null) {
      return null;
    }

    else {
      return VideoModel(
        id: map['id'],
        title: map['title'],
        url: map['url'],
        captions: CaptionModel.decipherCaptions(map['captions']),
      );
    }

  }
  // --------------------
  /// TASK : TEST ME
  static List<VideoModel> decipherMaps(List<Map<String, dynamic>> maps){
    final List<VideoModel> _output = <VideoModel>[];

    if (Mapper.checkCanLoopList(maps) == true){

      for (final Map<String, dynamic> map in maps){

        final VideoModel _video = decipher(map);
        _output.add(_video);

      }

    }

    return _output;
  }
  // -----------------------------------------------------------------------------

  /// MODIFIERS

  // --------------------
  /// TESTED : WORKS PERFECT
  static String fixVideoTitle(String title){
    return TextMod.fixSearchText(TextMod.fixCountryName(title));
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<VideoModel> removeVideo({
    @required List<VideoModel> videos,
    @required String videoID,
  }){
    final List<VideoModel> _output = <VideoModel>[ ...?videos ];

    if (Mapper.checkCanLoopList(videos) == true && videoID != null){
      _output.removeWhere((element) => element.id == videoID);
    }

    return _output;
  }
  // -----------------------------------------------------------------------------
  /// EQUALITY

  // --------------------
  /// TESTED : WORKS PERFECT
  static bool checkVideoModelsAreIdentical(VideoModel model1, VideoModel model2){
    bool _identical = false;

    if (model1 == null && model2 == null){
      _identical = true;
    }

    else if (model1 != null && model2 != null) {
      if (
      model1.id == model2.id &&
      model1.title == model2.title &&
      model1.url == model2.url &&
      CaptionModel.checkCaptionsListsAreIdentical(captions1: model1.captions, captions2: model2.captions)
    ) {
        _identical = true;
      }
    }

    return _identical;
  }
  // -----------------------------------------------------------------------------

  /// OVERRIDES

  // --------------------
  /*
   @override
   String toString() => 'MapModel(key: $key, value: ${value.toString()})';
   */
  // --------------------
  @override
  bool operator == (Object other){

    if (identical(this, other)) {
      return true;
    }

    bool _areIdentical = false;
    if (other is VideoModel){
      _areIdentical = checkVideoModelsAreIdentical(
        this,
        other,
      );
    }

    return _areIdentical;
  }
  // --------------------
  @override
  int get hashCode =>
      id.hashCode^
      url.hashCode^
      title.hashCode;
  // -----------------------------------------------------------------------------
}
