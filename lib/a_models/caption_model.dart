// ignore_for_file: non_constant_identifier_names
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:mapper/mapper.dart';
import 'package:numeric/numeric.dart';
import 'package:stringer/stringer.dart';

@immutable
class CaptionModel {
  // -----------------------------------------------------------------------------
  const CaptionModel({
    @required this.text,
    @required this.second,
  });
  // --------------------
  final String text;
  final int second;
  // -----------------------------------------------------------------------------

  /// CYPHERS

  // --------------------
  /// AI TESTED
  static Map<String, dynamic> cipherCaptions(List<CaptionModel> captions){
    Map<String, dynamic> _output = {};

    if (Mapper.checkCanLoopList(captions) == true){

      final List<CaptionModel> _caps = cleanNullSeconds(captions);

      for (final CaptionModel caption in sortCaptionsBySecond(_caps)){

        assert(caption.second != null, 'second can not be null');

        _output = Mapper.insertPairInMap(
          map: _output,
          key: caption.second.toString(),
          value: caption.text,
          // overrideExisting: false,
        );

      }

    }

    return _output;
  }
  // --------------------
  /// AI TESTED
  static List<CaptionModel> decipherCaptions(Map<String, dynamic> map){
    final List<CaptionModel> _output = <CaptionModel>[];

    if (map != null) {
      List<String> _keys = map.keys.toList();
      if (Mapper.checkCanLoopList(_keys) == true) {

        _keys = Stringer.sortAlphabetically(_keys);

        for (final String key in _keys) {

          final int _second = Numeric.transformStringToInt(key);

          if (_second != null){

            final CaptionModel _caption = CaptionModel(
              second: _second,
              text: map[key],
            );

            _output.add(_caption);

          }

        }

      }
    }

    return _output;
  }
  // -----------------------------------------------------------------------------

  /// CAPTIONS CONVERTERS

  // --------------------
  /// AI TESTED
  static List<CaptionModel> convertStringToCaptions({
    @required String inputString,
  }) {
    final List<CaptionModel> captions = [];

    if (inputString != null) {
      final List<String> lines = inputString.split('\n');

      int currentTimeInSeconds = 0;

      for (int i = 0; i < lines.length; i++) {
        final String line = lines[i].trim();

        if (checkIs_mm_i_ss_format(line)) {
          // If the line is in mm:ss format, convert it to seconds and set the current time.
          currentTimeInSeconds = convert_mm_i_ss_toSeconds(line);
        } else if (line.isNotEmpty) {
          // Otherwise, create a new caption model and add it to the list.
          captions.add(CaptionModel(
            text: line,
            second: currentTimeInSeconds,
          ));
        }
      }
    }

    return captions;
  }
  // -----------------------------------------------------------------------------

  /// GETTERS

  // --------------------
  /// AI TESTED
  static List<String> getTexts(List<CaptionModel> captions) {
    final List<String> _output = <String>[];

    if (Mapper.checkCanLoopList(captions) == true) {
      for (final CaptionModel caption in captions) {
        _output.add(caption.text);
      }
    }

    return _output;
  }
  // -----------------------------------------------------------------------------

  /// SORTING

  // --------------------
  /// AI TESTED
  static List<CaptionModel> sortCaptionsBySecond(List<CaptionModel> captions){
    final List<CaptionModel> _output = <CaptionModel>[];

    if (Mapper.checkCanLoopList(captions) == true){

      final List<CaptionModel> _captions = List<CaptionModel>.from(captions);

      _captions.sort((CaptionModel a, CaptionModel b) => a.second.compareTo(b.second));

      _output.addAll(_captions);

    }

    return _output;
  }
  // --------------------
  /// AI TESTED
  static List<CaptionModel> cleanNullSeconds(List<CaptionModel> captions){
    final List<CaptionModel> _output = <CaptionModel>[];

    if (Mapper.checkCanLoopList(captions) == true){

      for (final CaptionModel caption in captions){
        if (caption.second != null){
          _output.add(caption);
        }
      }

    }

    return _output;

  }
  // -----------------------------------------------------------------------------

  /// TIME CONVERTERS

  // --------------------
  /// AI TESTED
  static int convert_mm_i_ss_toSeconds(String mm_i_ss) {
    int _output;

    /// timeString format => mm:ss, and this should return s

    if (checkIs_mm_i_ss_format(mm_i_ss) == true){
      final List<String> timeParts = mm_i_ss.trim().split(':');
      final int minutes = Numeric.transformStringToInt(timeParts[0]);
      final int seconds = Numeric.transformStringToInt(timeParts[1]);
      _output = minutes * 60 + seconds;
    }
    else{
      blog('convert_mm_i_ss_toSeconds : something is wrong with ($mm_i_ss)');
    }

    return _output;
  }
  // --------------------
  /// AI TESTED
  static bool checkIs_mm_i_ss_format(String input){
    bool _output;


    if (input == null) {
      _output = false;
    }

    else {

      final parts = input.split(':');

      if (parts.length != 2) {
        _output = false;
      }

      else {
        final minutes = int.tryParse(parts[0]);
        final seconds = int.tryParse(parts[1]);

        if (minutes == null || seconds == null) {
          _output = false;
        }
        else if (minutes < 0) {
          _output = false;
        }
        else if (seconds < 0 || seconds > 59) {
          _output = false;
        }
        else {
          _output = true;
        }

      }

    }

    return _output;
  }
  // --------------------
  /// AI TESTED
  static String convertSecondsTo_mm_i_ss(int seconds){
    String _output;

    if (seconds != null){
      final int minutes = seconds ~/ 60;
      final int remainingSeconds = seconds % 60;
      final String minuteString = minutes.toString().padLeft(2, '0');
      final String secondString = remainingSeconds.toString().padLeft(2, '0');
      _output = '$minuteString:$secondString';
    }

    return _output;
  }
  // --------------------
  /// TASK : TEST ME
  static Map<String, dynamic> convertCheckSubTimeStampToDateTimes({
    @required String checkSubTimeStamp,
  }){
    DateTime _start;
    DateTime _end;

    /// CHECK SUB TIME STAMP LOOKS LIKE THIS : 00:00:00,000 --> 00:00:00,000
    if (TextCheck.isEmpty(checkSubTimeStamp) == false){

      final List<String> _timeStampsStrings = checkSubTimeStamp.split(' --> ');

      /// ASSERT THAT THE TIME STAMPS ARE IN THE CORRECT FORMAT
      assert(_timeStampsStrings.length == 2, 'time stamps are not in the correct format');
      /// ASSERT THAT THE TIME STAMPS ARE NOT EMPTY
      assert(TextCheck.isEmpty(_timeStampsStrings[0]) == false, 'time stamp 1 is empty');
      /// ASSERT THAT A TIME STAMP IN THE CORRECT FORMAT
      // TASK : WRITE ME

      _start = DateTime.parse(_timeStampsStrings[0]);
      _end = DateTime.parse(_timeStampsStrings[1]);

    }

    return {
      'start': _start,
      'end': _end,
    };
  }
  // -----------------------------------------------------------------------------

  /// BLOGGING

  // --------------------
  /// TESTED : WORKS PERFECT
  static void blogCaptions(List<CaptionModel> captions){

    if (Mapper.checkCanLoopList(captions) == true){

      blog('CAPTIONS BLOG : ${captions.length} captions =>>> ');

      for (final CaptionModel caption in captions){

        final String _timeStamp = convertSecondsTo_mm_i_ss(caption.second);
        blog('   -> Caption : $_timeStamp : ${caption.text}');

      }

      blog('CAPTIONS BLOG DONE <<<==');

    }
    else {
      blog('CAPTIONS BLOG : captions are Empty');
    }

  }
  // -----------------------------------------------------------------------------

  /// EQUALITY

  // --------------------
  /// TESTED : WORKS PERFECT
  static bool checkCaptionsAreIdentical(CaptionModel model1, CaptionModel model2){
    bool _identical = false;

    if (model1 == null && model2 == null) {
      _identical = true;
    }

    else if (model1 != null && model2 != null) {

      if (
          model1.second == model2.second
          &&
          model1.text == model2.text
      ) {
        _identical = true;
      }

    }

    return _identical;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static bool checkCaptionsListsAreIdentical({
    @required List<CaptionModel> captions1,
    @required List<CaptionModel> captions2,
  }){

    return Mapper.checkMapsAreIdentical(
        map1: cipherCaptions(captions1),
        map2: cipherCaptions(captions2)
    );

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
    if (other is CaptionModel){
      _areIdentical = checkCaptionsAreIdentical(
        this,
        other,
      );
    }

    return _areIdentical;
  }
  // --------------------
  @override
  int get hashCode =>
      second.hashCode^
      text.hashCode;
  // -----------------------------------------------------------------------------
}
