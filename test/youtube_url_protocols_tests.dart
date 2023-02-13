import 'package:abotube/services/protocols/youtube_url_protocols.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('isValidYoutubeLink', () {
    test('Test valid Youtube links', () {
      expect(YoutubeURLProtocols.isValidYoutubeLink('https://www.youtube.com/watch?v=cIZ7625Ts6A'),
          true);
      expect(YoutubeURLProtocols.isValidYoutubeLink('youtu.be/cIZ7625Ts6A'), true);
    });

    test('Test invalid Youtube links', () {
      expect(YoutubeURLProtocols.isValidYoutubeLink('https://www.youtube.com/watch?v='), false);
      expect(YoutubeURLProtocols.isValidYoutubeLink('https://www.youtube.com'), false);
      expect(YoutubeURLProtocols.isValidYoutubeLink('https://www.google.com'), false);
      expect(YoutubeURLProtocols.isValidYoutubeLink('https://www.google.com/watch?v=cIZ7625Ts6A'),
          false);
    });

    test('Test valid Youtube links', () {
      expect(YoutubeURLProtocols.isValidYoutubeLink('https://www.youtube.com/watch?v=cIZ7625Ts6A'),
          true);
      expect(YoutubeURLProtocols.isValidYoutubeLink('youtu.be/cIZ7625Ts6A'), true);
    });

    test('Test invalid Youtube links', () {
      expect(YoutubeURLProtocols.isValidYoutubeLink('https://www.youtube.com/watch?v='), false);
      expect(YoutubeURLProtocols.isValidYoutubeLink('https://www.youtube.com'), false);
      expect(YoutubeURLProtocols.isValidYoutubeLink('https://www.google.com'), false);
      expect(YoutubeURLProtocols.isValidYoutubeLink('https://www.google.com/watch?v=cIZ7625Ts6A'),
          false);
    });

    test('Test links with different parameters', () {
      expect(
          YoutubeURLProtocols.isValidYoutubeLink(
              'https://www.youtube.com/watch?v=cIZ7625Ts6A&list=PLjxrf2q8roU23XGwz3Km7sKzDZDw1O5tX'),
          true);
      expect(
          YoutubeURLProtocols.isValidYoutubeLink(
              'https://www.youtube.com/watch?v=cIZ7625Ts6A&feature=youtu.be'),
          true);
      expect(
          YoutubeURLProtocols.isValidYoutubeLink(
              'https://www.youtube.com/watch?v=cIZ7625Ts6A&t=2s'),
          true);
    });

    test('Test links with different protocols', () {
      expect(YoutubeURLProtocols.isValidYoutubeLink('http://www.youtube.com/watch?v=cIZ7625Ts6A'),
          true);
      expect(YoutubeURLProtocols.isValidYoutubeLink('ftp://www.youtube.com/watch?v=cIZ7625Ts6A'),
          false);
    });

    test('Test links with different subdomains', () {
      expect(YoutubeURLProtocols.isValidYoutubeLink('https://m.youtube.com/watch?v=cIZ7625Ts6A'),
          true);
      expect(
          YoutubeURLProtocols.isValidYoutubeLink(
              'https://youtube-nocookie.com/watch?v=cIZ7625Ts6A'),
          false);
    });
  });

  group('extractVideoID', () {
    test('Test valid Youtube links', () {
      expect(YoutubeURLProtocols.extractVideoID('https://www.youtube.com/watch?v=cIZ7625Ts6A'),
          'cIZ7625Ts6A');
      expect(YoutubeURLProtocols.extractVideoID('youtu.be/cIZ7625Ts6A'), 'cIZ7625Ts6A');
      expect(YoutubeURLProtocols.extractVideoID('https://m.youtube.com/watch?v=cIZ7625Ts6A'),
          'cIZ7625Ts6A');
    });

    test('Test invalid Youtube links', () {
      expect(YoutubeURLProtocols.extractVideoID('https://www.youtube.com/watch?v='), null);
      expect(YoutubeURLProtocols.extractVideoID('https://www.youtube.com'), null);
      expect(YoutubeURLProtocols.extractVideoID('https://www.google.com'), null);
      expect(
          YoutubeURLProtocols.extractVideoID('https://www.google.com/watch?v=cIZ7625Ts6A'), null);
    });

    test('Test links with different parameters', () {
      expect(
          YoutubeURLProtocols.extractVideoID('https://www.youtube'
              '.com/watch?v=cIZ7625Ts6A&list=PLjxrf2q8roU23XGwz3Km7sKzDZDw1O5tX'),
          'cIZ7625Ts6A');
      expect(
          YoutubeURLProtocols.extractVideoID(
              'https://www.youtube.com/watch?v=cIZ7625Ts6A&feature=youtu.be'),
          'cIZ7625Ts6A');
      expect(YoutubeURLProtocols.extractVideoID('https://www.youtube.com/watch?v=cIZ7625Ts6A&t=2s'),
          'cIZ7625Ts6A');
    });

    test('Test links with different protocols', () {
      expect(YoutubeURLProtocols.extractVideoID('http://www.youtube.com/watch?v=cIZ7625Ts6A'),
          'cIZ7625Ts6A');
      expect(YoutubeURLProtocols.extractVideoID('ftp://www.youtube.com/watch?v=cIZ7625Ts6A'), null);
    });

    test('Test links with different subdomains', () {
      expect(YoutubeURLProtocols.extractVideoID('https://m.youtube.com/watch?v=cIZ7625Ts6A'),
          'cIZ7625Ts6A');
      expect(YoutubeURLProtocols.extractVideoID('https://youtube-nocookie.com/watch?v=cIZ7625Ts6A'),
          null);
    });
  });

  group('isValidYoutubeVideoID', () {
    test('Test valid Youtube video IDs', () {
      expect(YoutubeURLProtocols.isValidYoutubeVideoID('cIZ7625Ts6A'), true);
      expect(YoutubeURLProtocols.isValidYoutubeVideoID('jNQXAC9IVRw'), true);
      expect(YoutubeURLProtocols.isValidYoutubeVideoID('0_5IHQ6_cG4'), true);
    });

    test('Test invalid Youtube video IDs', () {
      expect(YoutubeURLProtocols.isValidYoutubeVideoID(''), false);
      expect(YoutubeURLProtocols.isValidYoutubeVideoID('cIZ7625Ts6A!'), false);
      expect(YoutubeURLProtocols.isValidYoutubeVideoID('cIZ7625Ts6A@'), false);
      expect(YoutubeURLProtocols.isValidYoutubeVideoID('cIZ7625Ts6A#'), false);
      expect(YoutubeURLProtocols.isValidYoutubeVideoID(r'cIZ7625Ts6A$'), false);
      expect(YoutubeURLProtocols.isValidYoutubeVideoID('cIZ7625Ts6A%'), false);
      expect(YoutubeURLProtocols.isValidYoutubeVideoID('cIZ7625Ts6A^'), false);
      expect(YoutubeURLProtocols.isValidYoutubeVideoID('cIZ7625Ts6A&'), false);
      expect(YoutubeURLProtocols.isValidYoutubeVideoID('cIZ7625Ts6A*'), false);
      expect(YoutubeURLProtocols.isValidYoutubeVideoID('cIZ7625Ts6A('), false);
      expect(YoutubeURLProtocols.isValidYoutubeVideoID('cIZ7625Ts6A)'), false);
      expect(YoutubeURLProtocols.isValidYoutubeVideoID('cIZ7625Ts6A_'), false);
      expect(YoutubeURLProtocols.isValidYoutubeVideoID('cIZ7625Ts6A-'), false);
    });
  });
}
