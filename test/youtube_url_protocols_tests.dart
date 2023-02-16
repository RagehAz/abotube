import 'package:abotube/a_models/video_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('isValidYoutubeLink', () {
    test('Test valid Youtube links', () {
      expect(VideoModel.checkIsValidYoutubeLink('https://www.youtube.com/watch?v=cIZ7625Ts6A'),
          true);
      expect(VideoModel.checkIsValidYoutubeLink('youtu.be/cIZ7625Ts6A'), true);
    });

    test('Test invalid Youtube links', () {
      expect(VideoModel.checkIsValidYoutubeLink('https://www.youtube.com/watch?v='), false);
      expect(VideoModel.checkIsValidYoutubeLink('https://www.youtube.com'), false);
      expect(VideoModel.checkIsValidYoutubeLink('https://www.google.com'), false);
      expect(VideoModel.checkIsValidYoutubeLink('https://www.google.com/watch?v=cIZ7625Ts6A'),
          false);
    });

    test('Test valid Youtube links', () {
      expect(VideoModel.checkIsValidYoutubeLink('https://www.youtube.com/watch?v=cIZ7625Ts6A'),
          true);
      expect(VideoModel.checkIsValidYoutubeLink('youtu.be/cIZ7625Ts6A'), true);
    });

    test('Test invalid Youtube links', () {
      expect(VideoModel.checkIsValidYoutubeLink('https://www.youtube.com/watch?v='), false);
      expect(VideoModel.checkIsValidYoutubeLink('https://www.youtube.com'), false);
      expect(VideoModel.checkIsValidYoutubeLink('https://www.google.com'), false);
      expect(VideoModel.checkIsValidYoutubeLink('https://www.google.com/watch?v=cIZ7625Ts6A'),
          false);
    });

    test('Test links with different parameters', () {
      expect(
          VideoModel.checkIsValidYoutubeLink(
              'https://www.youtube.com/watch?v=cIZ7625Ts6A&list=PLjxrf2q8roU23XGwz3Km7sKzDZDw1O5tX'),
          true);
      expect(
          VideoModel.checkIsValidYoutubeLink(
              'https://www.youtube.com/watch?v=cIZ7625Ts6A&feature=youtu.be'),
          true);
      expect(
          VideoModel.checkIsValidYoutubeLink(
              'https://www.youtube.com/watch?v=cIZ7625Ts6A&t=2s'),
          true);
    });

    test('Test links with different protocols', () {
      expect(VideoModel.checkIsValidYoutubeLink('http://www.youtube.com/watch?v=cIZ7625Ts6A'),
          true);
      expect(VideoModel.checkIsValidYoutubeLink('ftp://www.youtube.com/watch?v=cIZ7625Ts6A'),
          false);
    });

    test('Test links with different subdomains', () {
      expect(VideoModel.checkIsValidYoutubeLink('https://m.youtube.com/watch?v=cIZ7625Ts6A'),
          true);
      expect(
          VideoModel.checkIsValidYoutubeLink(
              'https://youtube-nocookie.com/watch?v=cIZ7625Ts6A'),
          false);
    });
  });

  group('extractVideoID', () {
    test('Test valid Youtube links', () {
      expect(VideoModel.extractVideoIDFromYoutubeURL('https://www.youtube.com/watch?v=cIZ7625Ts6A'),
          'cIZ7625Ts6A');
      expect(VideoModel.extractVideoIDFromYoutubeURL('youtu.be/cIZ7625Ts6A'), 'cIZ7625Ts6A');
      expect(VideoModel.extractVideoIDFromYoutubeURL('https://m.youtube.com/watch?v=cIZ7625Ts6A'),
          'cIZ7625Ts6A');
    });

    test('Test invalid Youtube links', () {
      expect(VideoModel.extractVideoIDFromYoutubeURL('https://www.youtube.com/watch?v='), null);
      expect(VideoModel.extractVideoIDFromYoutubeURL('https://www.youtube.com'), null);
      expect(VideoModel.extractVideoIDFromYoutubeURL('https://www.google.com'), null);
      expect(
          VideoModel.extractVideoIDFromYoutubeURL('https://www.google.com/watch?v=cIZ7625Ts6A'), null);
    });

    test('Test links with different parameters', () {
      expect(
          VideoModel.extractVideoIDFromYoutubeURL('https://www.youtube'
              '.com/watch?v=cIZ7625Ts6A&list=PLjxrf2q8roU23XGwz3Km7sKzDZDw1O5tX'),
          'cIZ7625Ts6A');
      expect(
          VideoModel.extractVideoIDFromYoutubeURL(
              'https://www.youtube.com/watch?v=cIZ7625Ts6A&feature=youtu.be'),
          'cIZ7625Ts6A');
      expect(VideoModel.extractVideoIDFromYoutubeURL('https://www.youtube.com/watch?v=cIZ7625Ts6A&t=2s'),
          'cIZ7625Ts6A');
    });

    test('Test links with different protocols', () {
      expect(VideoModel.extractVideoIDFromYoutubeURL('http://www.youtube.com/watch?v=cIZ7625Ts6A'),
          'cIZ7625Ts6A');
      expect(VideoModel.extractVideoIDFromYoutubeURL('ftp://www.youtube.com/watch?v=cIZ7625Ts6A'), null);
    });

    test('Test links with different subdomains', () {
      expect(VideoModel.extractVideoIDFromYoutubeURL('https://m.youtube.com/watch?v=cIZ7625Ts6A'),
          'cIZ7625Ts6A');
      expect(VideoModel.extractVideoIDFromYoutubeURL('https://youtube-nocookie.com/watch?v=cIZ7625Ts6A'),
          null);
    });
  });

  group('isValidYoutubeVideoID', () {
    test('Test valid Youtube video IDs', () {
      expect(VideoModel.checkIsValidYoutubeVideoID('cIZ7625Ts6A'), true);
      expect(VideoModel.checkIsValidYoutubeVideoID('jNQXAC9IVRw'), true);
      expect(VideoModel.checkIsValidYoutubeVideoID('0_5IHQ6_cG4'), true);
    });

    test('Test invalid Youtube video IDs', () {
      expect(VideoModel.checkIsValidYoutubeVideoID(''), false);
      expect(VideoModel.checkIsValidYoutubeVideoID('cIZ7625Ts6A!'), false);
      expect(VideoModel.checkIsValidYoutubeVideoID('cIZ7625Ts6A@'), false);
      expect(VideoModel.checkIsValidYoutubeVideoID('cIZ7625Ts6A#'), false);
      expect(VideoModel.checkIsValidYoutubeVideoID(r'cIZ7625Ts6A$'), false);
      expect(VideoModel.checkIsValidYoutubeVideoID('cIZ7625Ts6A%'), false);
      expect(VideoModel.checkIsValidYoutubeVideoID('cIZ7625Ts6A^'), false);
      expect(VideoModel.checkIsValidYoutubeVideoID('cIZ7625Ts6A&'), false);
      expect(VideoModel.checkIsValidYoutubeVideoID('cIZ7625Ts6A*'), false);
      expect(VideoModel.checkIsValidYoutubeVideoID('cIZ7625Ts6A('), false);
      expect(VideoModel.checkIsValidYoutubeVideoID('cIZ7625Ts6A)'), false);
      expect(VideoModel.checkIsValidYoutubeVideoID('cIZ7625Ts6A_'), false);
      expect(VideoModel.checkIsValidYoutubeVideoID('cIZ7625Ts6A-'), false);
    });
  });

}
