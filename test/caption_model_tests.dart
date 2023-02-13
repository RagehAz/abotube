import 'package:abotube/a_models/caption_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('cipherCaptions', () {

    test('empty list should return empty map', () {
      final result = CaptionModel.cipherCaptions([]);
      expect(result, {});
    });

    test('captions with null seconds should throw an assertion error', () {
      const captions = [
        CaptionModel(second: 1, text: 'first caption'),
        CaptionModel(second: null, text: 'second caption'),
        CaptionModel(second: 3, text: 'third caption'),
      ];

      const Map<String, dynamic> result = {
        '1': 'first caption',
        '3': 'third caption',
      };

      expect(CaptionModel.cipherCaptions(captions), result);
    });

    test('unique captions should be keyed by their seconds', () {
      const captions = [
        CaptionModel(second: 1, text: 'first caption'),
        CaptionModel(second: 2, text: 'second caption'),
        CaptionModel(second: 3, text: 'third caption'),
      ];

      final result = CaptionModel.cipherCaptions(captions);
      expect(result.length, 3);
      expect(result['1'], 'first caption');
      expect(result['2'], 'second caption');
      expect(result['3'], 'third caption');
    });

    test('captions with duplicate seconds should only include the last caption', () {
      const captions = [
        CaptionModel(second: 1, text: 'first caption'),
        CaptionModel(second: 2, text: 'second caption'),
        CaptionModel(second: 1, text: 'duplicate caption'),
      ];

      final result = CaptionModel.cipherCaptions(captions);
      expect(result.length, 2);
      expect(result['1'], 'first caption');
      expect(result['2'], 'second caption');
    });

    test('captions with special characters should be included in the map', () {
      const captions = [
        CaptionModel(second: 1, text: 'caption with [brackets]'),
        CaptionModel(second: 2, text: 'caption with "quotes"'),
      ];
      final result = CaptionModel.cipherCaptions(captions);
      expect(result.length, 2);
      expect(result['1'], 'caption with [brackets]');
      expect(result['2'], 'caption with "quotes"');
    });

  });

  group('decipherCaptions', () {

    test('empty map should return empty list', () {
    final result = CaptionModel.decipherCaptions({});
    expect(result, []);
  });

    test('map with null value should return empty list', () {
      final result = CaptionModel.decipherCaptions({'1': null});
      expect(result, [
        const CaptionModel(
          second: 1,
          text: null,
        ),
      ]);
    });

    test('key is not an int', () {
      final map = {
        '1': 'first caption',
        'not an int': 'second caption'
      };

      const CaptionModel _cap1 = CaptionModel(
          second: 1,
          text: 'first caption',
      );

      expect(CaptionModel.decipherCaptions(map), [_cap1]);

    });

    test('unique captions should be sorted by their seconds', () {
      final map = {'2': 'second caption', '1': 'first caption', '3': 'third caption'};
      final result = CaptionModel.decipherCaptions(map);
      expect(result.length, 3);
      expect(result[0].second, 1);
      expect(result[0].text, 'first caption');
      expect(result[1].second, 2);
      expect(result[1].text, 'second caption');
      expect(result[2].second, 3);
      expect(result[2].text, 'third caption');
    });

    test('captions with special characters should be included in the list', () {
      final map = {'1': 'caption with [brackets]', '2': 'caption with "quotes"'};
      final result = CaptionModel.decipherCaptions(map);
      expect(result.length, 2);
      expect(result[0].second, 1);
      expect(result[0].text, 'caption with [brackets]');
      expect(result[1].second, 2);
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
      const captions1 = [CaptionModel(text: 'first', second: 1)];
      const captions2 = [
        CaptionModel(text: 'first', second: 1),
        CaptionModel(text: 'second', second: 2),
      ];
      final result = CaptionModel.checkCaptionsListsAreIdentical(
        captions1: captions1,
        captions2: captions2,
      );
      expect(result, isFalse);
    });

    test('same lists with different order should be identical', () {
      const captions1 = [
        CaptionModel(text: 'first', second: 1),
        CaptionModel(text: 'second', second: 2),
      ];
      const captions2 = [
        CaptionModel(text: 'second', second: 2),
        CaptionModel(text: 'first', second: 1),
      ];
      final result = CaptionModel.checkCaptionsListsAreIdentical(
        captions1: captions1,
        captions2: captions2,
      );
      expect(result, isTrue);
    });

    test('lists with different captions should not be identical', () {
      const captions1 = [
        CaptionModel(text: 'first', second: 1),
        CaptionModel(text: 'second', second: 2),
      ];
      const captions2 = [
        CaptionModel(text: 'first', second: 1),
        CaptionModel(text: 'different', second: 2),
      ];
      final result = CaptionModel.checkCaptionsListsAreIdentical(
        captions1: captions1,
        captions2: captions2,
      );
      expect(result, isFalse);
    });

    test('identical lists with null value should be identical', () {
      const captions1 = [
        CaptionModel(text: 'first', second: 1),
        CaptionModel(text: null, second: 2)
      ];
      const captions2 = [
        CaptionModel(text: 'first', second: 1),
        CaptionModel(text: null, second: 2)
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
      const input = [CaptionModel(second: 0, text: 'test')];
      final output = CaptionModel.sortCaptionsBySecond(input);
      expect(output, equals(input));
    });

    test('Sorts the list by second', () {
      const input = [
        CaptionModel(second: 1, text: 'test1'),
        CaptionModel(second: 3, text: 'test3'),
        CaptionModel(second: 2, text: 'test2')
      ];
      const expectedOutput = [
        CaptionModel(second: 1, text: 'test1'),
        CaptionModel(second: 2, text: 'test2'),
        CaptionModel(second: 3, text: 'test3')
      ];
      final output = CaptionModel.sortCaptionsBySecond(input);
      expect(output, equals(expectedOutput));
    });

    test('Does not modify the original list', () {
      const input = [
        CaptionModel(second: 1, text: 'test1'),
        CaptionModel(second: 3, text: 'test3'),
        CaptionModel(second: 2, text: 'test2')
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
      const input = [CaptionModel(second: 0, text: 'test')];
      final output = CaptionModel.cleanNullSeconds(input);
      expect(output, equals(input));
    });

    test('Removes items with null seconds', () {
      const input = [
        CaptionModel(second: 1, text: 'test1'),
        CaptionModel(second: null, text: 'test2'),
        CaptionModel(second: 3, text: 'test3')
      ];
      const expectedOutput = [
        CaptionModel(second: 1, text: 'test1'),
        CaptionModel(second: 3, text: 'test3')
      ];
      final output = CaptionModel.cleanNullSeconds(input);
      expect(output, equals(expectedOutput));
    });

    test('Does not modify the original list', () {
      const input = [
        CaptionModel(second: 1, text: 'test1'),
        CaptionModel(second: null, text: 'test2'),
        CaptionModel(second: 3, text: 'test3')
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
