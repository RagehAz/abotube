import 'package:abotube/a_models/caption_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('cipherCheckSubCaptions(captions)', () {

    test('empty list should return empty map', () {
      final result = CaptionModel.cipherCheckSubCaptions([]);
      expect(result, {});
    });

    test('captions with null seconds should throw an assertion error', () {
      const captions = [
        CaptionModel(start: 1, text: 'first caption', duration: null),
        CaptionModel(start: null, text: 'second caption', duration: null),
        CaptionModel(start: 3, text: 'third caption', duration: null),
      ];

      const Map<String, dynamic> result = {
        '1': 'first caption',
        '3': 'third caption',
      };

      expect(CaptionModel.cipherCheckSubCaptions(captions), result);
    });

    test('unique captions should be keyed by their seconds', () {
      const captions = [
        CaptionModel(start: 1, text: 'first caption', duration: null),
        CaptionModel(start: 2, text: 'second caption', duration: null),
        CaptionModel(start: 3, text: 'third caption', duration: null),
      ];

      final result = CaptionModel.cipherCheckSubCaptions(captions);
      expect(result.length, 3);
      expect(result['1'], 'first caption');
      expect(result['2'], 'second caption');
      expect(result['3'], 'third caption');
    });

    test('captions with duplicate seconds should only include the last caption', () {
      const captions = [
        CaptionModel(start: 1, text: 'first caption', duration: null),
        CaptionModel(start: 2, text: 'second caption', duration: null),
        CaptionModel(start: 1, text: 'duplicate caption', duration: null),
      ];

      final result = CaptionModel.cipherCheckSubCaptions(captions);
      expect(result.length, 2);
      expect(result['1'], 'first caption');
      expect(result['2'], 'second caption');
    });

    test('captions with special characters should be included in the map', () {
      const captions = [
        CaptionModel(start: 1, text: 'caption with [brackets]', duration: null),
        CaptionModel(start: 2, text: 'caption with "quotes"', duration: null),
      ];
      final result = CaptionModel.cipherCheckSubCaptions(captions);
      expect(result.length, 2);
      expect(result['1'], 'caption with [brackets]');
      expect(result['2'], 'caption with "quotes"');
    });

  });

  group('decipherChecksubCaptions(map)', () {

    test('empty map should return empty list', () {
    final result = CaptionModel.decipherChecksubCaptions({});
    expect(result, []);
  });

    test('map with null value should return empty list', () {
      final result = CaptionModel.decipherChecksubCaptions({'1': null});
      expect(result, [
        const CaptionModel(
          start: 1,
          text: null,
          duration: null,
        ),
      ]);
    });

    test('key is not an int', () {
      final map = {
        '1': 'first caption',
        'not an int': 'second caption'
      };

      const CaptionModel _cap1 = CaptionModel(
        start: 1,
        text: 'first caption',
        duration: null,
      );

      expect(CaptionModel.decipherChecksubCaptions(map), [_cap1]);

    });

    test('unique captions should be sorted by their seconds', () {
      final map = {'2': 'second caption', '1': 'first caption', '3': 'third caption'};
      final result = CaptionModel.decipherChecksubCaptions(map);
      expect(result.length, 3);
      expect(result[0].start, 1);
      expect(result[0].text, 'first caption');
      expect(result[1].start, 2);
      expect(result[1].text, 'second caption');
      expect(result[2].start, 3);
      expect(result[2].text, 'third caption');
    });

    test('captions with special characters should be included in the list', () {
      final map = {'1': 'caption with [brackets]', '2': 'caption with "quotes"'};
      final result = CaptionModel.decipherChecksubCaptions(map);
      expect(result.length, 2);
      expect(result[0].start, 1);
      expect(result[0].text, 'caption with [brackets]');
      expect(result[1].start, 2);
      expect(result[1].text, 'caption with "quotes"');
    });

  });

  group('checkCaptionsListsAreIdentical', () {
    test('both empty lists should be identical', () {
      final result = CaptionModel.checkCaptionsListsAreIdentical(
        captions1: [],
        captions2: [],
      );
      expect(result, isTrue);
    });

    test('different-sized lists should not be identical', () {
      const captions1 = [CaptionModel(text: 'first', start: 1, duration: null)];
      const captions2 = [
        CaptionModel(text: 'first', start: 1, duration: null),
        CaptionModel(text: 'second', start: 2, duration: null),
      ];
      final result = CaptionModel.checkCaptionsListsAreIdentical(
        captions1: captions1,
        captions2: captions2,
      );
      expect(result, isFalse);
    });

    test('same lists with different order should be identical', () {
      const captions1 = [
        CaptionModel(text: 'first', start: 1, duration: null),
        CaptionModel(text: 'second', start: 2, duration: null),
      ];
      const captions2 = [
        CaptionModel(text: 'second', start: 2, duration: null),
        CaptionModel(text: 'first', start: 1, duration: null),
      ];
      final result = CaptionModel.checkCaptionsListsAreIdentical(
        captions1: captions1,
        captions2: captions2,
      );
      expect(result, isTrue);
    });

    test('lists with different captions should not be identical', () {
      const captions1 = [
        CaptionModel(text: 'first', start: 1, duration: null),
        CaptionModel(text: 'second', start: 2, duration: null),
      ];
      const captions2 = [
        CaptionModel(text: 'first', start: 1, duration: null),
        CaptionModel(text: 'different', start: 2, duration: null),
      ];
      final result = CaptionModel.checkCaptionsListsAreIdentical(
        captions1: captions1,
        captions2: captions2,
      );
      expect(result, isFalse);
    });

    test('identical lists with null value should be identical', () {
      const captions1 = [
        CaptionModel(text: 'first', start: 1, duration: null),
        CaptionModel(text: null, start: 2, duration: null),
      ];
      const captions2 = [
        CaptionModel(text: 'first', start: 1, duration: null),
        CaptionModel(text: null, start: 2, duration: null),
      ];
      final result = CaptionModel.checkCaptionsListsAreIdentical(
        captions1: captions1,
        captions2: captions2,
      );
      expect(result, isTrue);
    });
  });

  group('sortCaptionsBySecond', () {

    test('Returns an empty list for empty input list', () {
      expect(CaptionModel.sortCaptionsBySecond([]), isEmpty);
    });

    test('Returns the same list for a single item list', () {
      const input = [CaptionModel(start: 0, text: 'test', duration: null)];
      final output = CaptionModel.sortCaptionsBySecond(input);
      expect(output, equals(input));
    });

    test('Sorts the list by second', () {
      const input = [
        CaptionModel(start: 1, text: 'test1', duration: null),
        CaptionModel(start: 3, text: 'test3', duration: null),
        CaptionModel(start: 2, text: 'test2', duration: null),
      ];
      const expectedOutput = [
        CaptionModel(start: 1, text: 'test1', duration: null),
        CaptionModel(start: 2, text: 'test2', duration: null),
        CaptionModel(start: 3, text: 'test3', duration: null),
      ];
      final output = CaptionModel.sortCaptionsBySecond(input);
      expect(output, equals(expectedOutput));
    });

    test('Does not modify the original list', () {
      const input = [
        CaptionModel(start: 1, text: 'test1', duration: null),
        CaptionModel(start: 3, text: 'test3', duration: null),
        CaptionModel(start: 2, text: 'test2', duration: null),
      ];
      final originalInput = List<CaptionModel>.from(input);
      CaptionModel.sortCaptionsBySecond(input);
      expect(input, equals(originalInput));
    });

  });

  group('CaptionModel.cleanNullSeconds', () {

    test('Returns an empty list for empty input list', () {
      expect(CaptionModel.cleanNullSeconds([]), isEmpty);
    });

    test('Returns the same list for a single item list without null second', () {
      const input = [CaptionModel(start: 0, text: 'test', duration: null)];
      final output = CaptionModel.cleanNullSeconds(input);
      expect(output, equals(input));
    });

    test('Removes items with null seconds', () {
      const input = [
        CaptionModel(start: 1, text: 'test1', duration: null),
        CaptionModel(start: null, text: 'test2', duration: null),
        CaptionModel(start: 3, text: 'test3', duration: null),
      ];
      const expectedOutput = [
        CaptionModel(start: 1, text: 'test1', duration: null),
        CaptionModel(start: 3, text: 'test3', duration: null),
      ];
      final output = CaptionModel.cleanNullSeconds(input);
      expect(output, equals(expectedOutput));
    });

    test('Does not modify the original list', () {
      const input = [
        CaptionModel(start: 1, text: 'test1', duration: null),
        CaptionModel(start: null, text: 'test2', duration: null),
        CaptionModel(start: 3, text: 'test3', duration: null),
      ];
      final originalInput = List<CaptionModel>.from(input);
      CaptionModel.cleanNullSeconds(input);
      expect(input, equals(originalInput));
    });

  });

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
        CaptionModel(text: 'Hello, world!', start: 1, duration: null),
      ];

      final List<CaptionModel> actualOutput = CaptionModel.convertCheckSubStringToCaptions(
          inputString: inputString,
      );

      expect(actualOutput, expectedOutput);
    });

    test('multiple line captions', () {
      const String inputString = '0:01\nHello, world!\n0:02\nThis is a test.';
      const List<CaptionModel> expectedOutput = [
        CaptionModel(text: 'Hello, world!', start: 1, duration: null),
        CaptionModel(text: 'This is a test.', start: 2, duration: null),
      ];

      final List<CaptionModel> actualOutput = CaptionModel.convertCheckSubStringToCaptions(
        inputString: inputString,
      );

      expect(actualOutput, expectedOutput);
    });

    test('empty line captions', () {
      const String inputString = '0:01\n\n0:02\nThis is a test.';
      const List<CaptionModel> expectedOutput = [
        CaptionModel(text: 'This is a test.', start: 2, duration: null),
      ];

      final List<CaptionModel> actualOutput = CaptionModel.convertCheckSubStringToCaptions(
        inputString: inputString,
      );

      expect(actualOutput, expectedOutput);
    });

    test('mixed line captions', () {
      const String inputString = '0:01\nHello, world!\n\n0:02\nThis is a test.\n0:03\n';
      const List<CaptionModel> expectedOutput = [
        CaptionModel(text: 'Hello, world!', start: 1, duration: null),
        CaptionModel(text: 'This is a test.', start: 2, duration: null),
      ];

      final List<CaptionModel> actualOutput = CaptionModel.convertCheckSubStringToCaptions(
        inputString: inputString,
      );

      expect(actualOutput, expectedOutput);
    });

    test('invalid format caption', () {
      const String inputString = '0:01\nHello, world!\n0:0\nThis is a test.';
      const List<CaptionModel> expectedOutput = [
        CaptionModel(text: 'Hello, world!', start: 1, duration:  null),
        CaptionModel(text: 'This is a test.', start: 0, duration:  null),
      ];

      final List<CaptionModel> actualOutput = CaptionModel.convertCheckSubStringToCaptions(
        inputString: inputString,
      );

      expect(actualOutput, expectedOutput);
    });

  });

}
