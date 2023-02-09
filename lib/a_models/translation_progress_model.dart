import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';

enum ProgressStatus {
  done,
  error,
  processing,
  non,
}

@immutable
class TranslationProgressModel {
  // --------------------------------------------------------------------------
  const TranslationProgressModel({
    this.separating = ProgressStatus.non,
    this.getTranscript = ProgressStatus.non,
    this.translation = ProgressStatus.non,
    this.voiceGenerated = ProgressStatus.non,
    this.combined = ProgressStatus.non,
  });
  // --------------------------------------------------------------------------
  final ProgressStatus separating;
  final ProgressStatus getTranscript;
  final ProgressStatus translation;
  final ProgressStatus voiceGenerated;
  final ProgressStatus combined;
  // --------------------------------------------------------------------------

  /// CLONING

  // --------------------
  /// TESTED : WORKS PERFECT
  TranslationProgressModel copyWith({
    ProgressStatus separating,
    ProgressStatus getTranscript,
    ProgressStatus translation,
    ProgressStatus voiceGenerated,
    ProgressStatus combined,
  }) {
    return TranslationProgressModel(
      separating: separating ?? this.separating,
      getTranscript: getTranscript ?? this.getTranscript,
      translation: translation ?? this.translation,
      voiceGenerated: voiceGenerated ?? this.voiceGenerated,
      combined: combined ?? this.combined,
    );
  }
  // --------------------------------------------------------------------------

  /// GETTERS

  // --------------------
  /// TESTED : WORKS PERFECT
  static String getStatusIcon(ProgressStatus status){
    switch (status){
      case ProgressStatus.done:      return Iconz.check; break;
      case ProgressStatus.error:     return Iconz.xSmall; break;
      case ProgressStatus.processing:return Iconz.reload; break;
      case ProgressStatus.non:       return Iconz.circleDot; break;
      default: return null;
    }
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static Color getStatusColor(ProgressStatus status){
    switch (status){
      case ProgressStatus.done:      return Colorz.green255; break;
      case ProgressStatus.error:     return Colorz.red255; break;
      case ProgressStatus.processing:return Colorz.white255; break;
      case ProgressStatus.non:       return Colorz.white255; break;
      default: return null;
    }
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static double getStatusIconSizeFactor(ProgressStatus status){
    switch (status){
      case ProgressStatus.done:      return 0.8; break;
      case ProgressStatus.error:     return 0.6; break;
      case ProgressStatus.processing:return 0.8; break;
      case ProgressStatus.non:       return 0.8; break;
      default: return 1;
    }
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static double getStatusTextSizeFactor(ProgressStatus status){
    switch (status){
      case ProgressStatus.done:      return 1/0.8; break;
      case ProgressStatus.error:     return 1/0.6; break;
      case ProgressStatus.processing:return 1/0.8; break;
      case ProgressStatus.non:       return 1/0.8; break;
      default: return 1;
    }
  }
  // --------------------------------------------------------------------------

  /// EQUALITY

  // --------------------
  /// TASK : TEST ME
  static bool checkModelsAreIdentical({
    @required TranslationProgressModel model1,
    @required TranslationProgressModel model2,
  }){

    if (model1 == null && model2 == null) {
      return true;
    }

    else if (model1 == null || model2 == null) {
      return false;
    }

    else {

      if (model1.separating == model2.separating &&
          model1.getTranscript == model2.getTranscript &&
          model1.translation == model2.translation &&
          model1.voiceGenerated == model2.voiceGenerated &&
          model1.combined == model2.combined
      ) {
        return true;
      }

      else {
        return false;
      }

    }


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
    if (other is TranslationProgressModel){
      _areIdentical = checkModelsAreIdentical(
        model1: this,
        model2: other,
      );
    }

    return _areIdentical;
  }
  // --------------------
  @override
  int get hashCode =>
      separating.hashCode ^
      getTranscript.hashCode ^
      translation.hashCode ^
      voiceGenerated.hashCode ^
      combined.hashCode;
  // -----------------------------------------------------------------------------
  void f(){}
}
