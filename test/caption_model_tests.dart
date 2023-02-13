import 'package:abotube/a_models/caption_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('TranscriptionProtocols', () {

    test('timeToSeconds returns the correct number of seconds for 01:30', () {
      expect(CaptionModel.convert_mm_i_ss_toSeconds('01:30'), equals(90));
    });

    test('timeToSeconds returns the correct number of seconds for 20:05', () {
      expect(CaptionModel.convert_mm_i_ss_toSeconds('20:05'), equals(1205));
    });

    test('timeToSeconds returns the correct number of seconds for 00:01', () {
      expect(CaptionModel.convert_mm_i_ss_toSeconds('00:01'), equals(1));
    });

    test('timeToSeconds returns the correct number of seconds for 00:55', () {
      expect(CaptionModel.convert_mm_i_ss_toSeconds('00:55'), equals(55));
    });

    test('timeToSeconds returns the correct number of seconds for 01:01', () {
      expect(CaptionModel.convert_mm_i_ss_toSeconds('01:01'), equals(61));
    });

    test('Custom test', () {
      expect(CaptionModel.convert_mm_i_ss_toSeconds('01:01 '), equals(61));
    });

    test('Custom test 1', () {
      expect(CaptionModel.convert_mm_i_ss_toSeconds(null), equals(null));
    });


  });

  group('Test TranscriptionProtocols.convertSecondsTo_mm_i_ss method', () {

    test('Test with 90 seconds', () {
      expect(CaptionModel.convertSecondsTo_mm_i_ss(90), equals('01:30'));
    });

    test('Test with 125 seconds', () {
      expect(CaptionModel.convertSecondsTo_mm_i_ss(125), equals('02:05'));
    });

    test('Test with 1 second', () {
      expect(CaptionModel.convertSecondsTo_mm_i_ss(1), equals('00:01'));
    });

    test('Test with 55 seconds', () {
      expect(CaptionModel.convertSecondsTo_mm_i_ss(55), equals('00:55'));
    });

    test('Test with 61 seconds', () {
      expect(CaptionModel.convertSecondsTo_mm_i_ss(61), equals('01:01'));
    });

    test('Test with null input', () {
      expect(CaptionModel.convertSecondsTo_mm_i_ss(null), isNull);
    });

  });

  group('Test TranscriptionProtocols.checkIs_mm_i_ss_format method', () {

      test('Test with valid input', () {
        expect(CaptionModel.checkIs_mm_i_ss_format('01:30'), isTrue);
      });

      test('Test with valid input', () {
        expect(CaptionModel.checkIs_mm_i_ss_format('60:30'), isTrue);
      });

      test('Test with input containing non-digit characters', () {
        expect(CaptionModel.checkIs_mm_i_ss_format('01:3a'), isFalse);
      });

      test('Test with input missing a colon', () {
        expect(CaptionModel.checkIs_mm_i_ss_format('0130'), isFalse);
      });

      test('Test with input containing too many colons', () {
        expect(CaptionModel.checkIs_mm_i_ss_format('01:30:00'), isFalse);
      });

      test('Test with input containing too many digits for minutes', () {
        expect(CaptionModel.checkIs_mm_i_ss_format('100:00'), isTrue);
      });

      test('Test with input containing too many digits for seconds', () {
        expect(CaptionModel.checkIs_mm_i_ss_format('01:600'), isFalse);
      });

      test('Test with null input', () {
        expect(CaptionModel.checkIs_mm_i_ss_format(null), isFalse);
      });

    });

  group('CaptionModel.convertStringToCaptions', () {

    test('single line caption', () {
      const String inputString = '0:01\nHello, world!';
      const List<CaptionModel> expectedOutput = [
        CaptionModel(text: 'Hello, world!', second: 1),
      ];

      final List<CaptionModel> actualOutput = CaptionModel.convertStringToCaptions(inputString);

      expect(actualOutput, expectedOutput);
    });

    test('multiple line captions', () {
      const String inputString = '0:01\nHello, world!\n0:02\nThis is a test.';
      const List<CaptionModel> expectedOutput = [
        CaptionModel(text: 'Hello, world!', second: 1),
        CaptionModel(text: 'This is a test.', second: 2),
      ];

      final List<CaptionModel> actualOutput = CaptionModel.convertStringToCaptions(inputString);

      expect(actualOutput, expectedOutput);
    });

    test('empty line captions', () {
      const String inputString = '0:01\n\n0:02\nThis is a test.';
      const List<CaptionModel> expectedOutput = [
        CaptionModel(text: 'This is a test.', second: 2),
      ];

      final List<CaptionModel> actualOutput = CaptionModel.convertStringToCaptions(inputString);

      expect(actualOutput, expectedOutput);
    });

    test('mixed line captions', () {
      const String inputString = '0:01\nHello, world!\n\n0:02\nThis is a test.\n0:03\n';
      const List<CaptionModel> expectedOutput = [
        CaptionModel(text: 'Hello, world!', second: 1),
        CaptionModel(text: 'This is a test.', second: 2),
      ];

      final List<CaptionModel> actualOutput = CaptionModel.convertStringToCaptions(inputString);

      expect(actualOutput, expectedOutput);
    });

    test('invalid format caption', () {
      const String inputString = '0:01\nHello, world!\n0:0\nThis is a test.';
      const List<CaptionModel> expectedOutput = [
        CaptionModel(text: 'Hello, world!', second: 1),
        CaptionModel(text: 'This is a test.', second: 0),
      ];

      final List<CaptionModel> actualOutput = CaptionModel.convertStringToCaptions(inputString);

      expect(actualOutput, expectedOutput);
    });

  });

}
