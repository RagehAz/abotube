import 'package:abotube/a_models/video_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('isValidYouTubeLink', () {

    test('Test valid YouTube links', () {
      expect(VideoModel.isValidYouTubeLink('https://www.youtube.com/watch?v=cIZ7625Ts6A'), true);
      expect(VideoModel.isValidYouTubeLink('youtu.be/cIZ7625Ts6A'), true);
    });

    test('Test invalid YouTube links', () {
      expect(VideoModel.isValidYouTubeLink('https://www.youtube.com/watch?v='), false);
      expect(VideoModel.isValidYouTubeLink('https://www.youtube.com'), false);
      expect(VideoModel.isValidYouTubeLink('https://www.google.com'), false);
      expect(VideoModel.isValidYouTubeLink('https://www.google.com/watch?v=cIZ7625Ts6A'), false);
    });

    test('Test valid YouTube links', () {
      expect(VideoModel.isValidYouTubeLink('https://www.youtube.com/watch?v=cIZ7625Ts6A'), true);
      expect(VideoModel.isValidYouTubeLink('youtu.be/cIZ7625Ts6A'), true);
    });

    test('Test invalid YouTube links', () {
      expect(VideoModel.isValidYouTubeLink('https://www.youtube.com/watch?v='), false);
      expect(VideoModel.isValidYouTubeLink('https://www.youtube.com'), false);
      expect(VideoModel.isValidYouTubeLink('https://www.google.com'), false);
      expect(VideoModel.isValidYouTubeLink('https://www.google.com/watch?v=cIZ7625Ts6A'), false);
    });

    test('Test links with different parameters', () {
      expect(
          VideoModel.isValidYouTubeLink(
              'https://www.youtube.com/watch?v=cIZ7625Ts6A&list=PLjxrf2q8roU23XGwz3Km7sKzDZDw1O5tX'),
          true);
      expect(
          VideoModel.isValidYouTubeLink(
              'https://www.youtube.com/watch?v=cIZ7625Ts6A&feature=youtu.be'),
          true);
      expect(
          VideoModel.isValidYouTubeLink('https://www.youtube.com/watch?v=cIZ7625Ts6A&t=2s'), true);
    });

    test('Test links with different protocols', () {
      expect(VideoModel.isValidYouTubeLink('http://www.youtube.com/watch?v=cIZ7625Ts6A'), true);
      expect(VideoModel.isValidYouTubeLink('ftp://www.youtube.com/watch?v=cIZ7625Ts6A'), false);
    });

    test('Test links with different subdomains', () {
      expect(VideoModel.isValidYouTubeLink('https://m.youtube.com/watch?v=cIZ7625Ts6A'), true);
      expect(
          VideoModel.isValidYouTubeLink('https://youtube-nocookie.com/watch?v=cIZ7625Ts6A'), false);
    });

  });

  group('extractVideoID', (){

    test('Test valid YouTube links', () {
      expect(VideoModel.extractVideoID('https://www.youtube.com/watch?v=cIZ7625Ts6A'), 'cIZ7625Ts6A');
      expect(VideoModel.extractVideoID('youtu.be/cIZ7625Ts6A'), 'cIZ7625Ts6A');
      expect(VideoModel.extractVideoID('https://m.youtube.com/watch?v=cIZ7625Ts6A'), 'cIZ7625Ts6A');
    });

    test('Test invalid YouTube links', () {
      expect(VideoModel.extractVideoID('https://www.youtube.com/watch?v='), null);
      expect(VideoModel.extractVideoID('https://www.youtube.com'), null);
      expect(VideoModel.extractVideoID('https://www.google.com'), null);
      expect(VideoModel.extractVideoID('https://www.google.com/watch?v=cIZ7625Ts6A'), null);
    });

    test('Test links with different parameters', () {
      expect(VideoModel.extractVideoID('https://www.youtube'
          '.com/watch?v=cIZ7625Ts6A&list=PLjxrf2q8roU23XGwz3Km7sKzDZDw1O5tX'), 'cIZ7625Ts6A');
      expect(VideoModel.extractVideoID('https://www.youtube.com/watch?v=cIZ7625Ts6A&feature=youtu.be'), 'cIZ7625Ts6A');
      expect(VideoModel.extractVideoID('https://www.youtube.com/watch?v=cIZ7625Ts6A&t=2s'), 'cIZ7625Ts6A');
    });

    test('Test links with different protocols', () {
      expect(VideoModel.extractVideoID('http://www.youtube.com/watch?v=cIZ7625Ts6A'), 'cIZ7625Ts6A');
      expect(VideoModel.extractVideoID('ftp://www.youtube.com/watch?v=cIZ7625Ts6A'), null);
    });

    test('Test links with different subdomains', () {
      expect(VideoModel.extractVideoID('https://m.youtube.com/watch?v=cIZ7625Ts6A'), 'cIZ7625Ts6A');
      expect(VideoModel.extractVideoID('https://youtube-nocookie.com/watch?v=cIZ7625Ts6A'), null);
    });

  });

  group('isValidYouTubeVideoId', (){

    test('Test valid YouTube video IDs', () {
      expect(VideoModel.isValidYouTubeVideoID('cIZ7625Ts6A'), true);
      expect(VideoModel.isValidYouTubeVideoID('jNQXAC9IVRw'), true);
      expect(VideoModel.isValidYouTubeVideoID('0_5IHQ6_cG4'), true);
    });

    test('Test invalid YouTube video IDs', () {
      expect(VideoModel.isValidYouTubeVideoID(''), false);
      expect(VideoModel.isValidYouTubeVideoID('cIZ7625Ts6A!'), false);
      expect(VideoModel.isValidYouTubeVideoID('cIZ7625Ts6A@'), false);
      expect(VideoModel.isValidYouTubeVideoID('cIZ7625Ts6A#'), false);
      expect(VideoModel.isValidYouTubeVideoID(r'cIZ7625Ts6A$'), false);
      expect(VideoModel.isValidYouTubeVideoID('cIZ7625Ts6A%'), false);
      expect(VideoModel.isValidYouTubeVideoID('cIZ7625Ts6A^'), false);
      expect(VideoModel.isValidYouTubeVideoID('cIZ7625Ts6A&'), false);
      expect(VideoModel.isValidYouTubeVideoID('cIZ7625Ts6A*'), false);
      expect(VideoModel.isValidYouTubeVideoID('cIZ7625Ts6A('), false);
      expect(VideoModel.isValidYouTubeVideoID('cIZ7625Ts6A)'), false);
      expect(VideoModel.isValidYouTubeVideoID('cIZ7625Ts6A_'), false);
      expect(VideoModel.isValidYouTubeVideoID('cIZ7625Ts6A-'), false);
    });

  });


  group('formatTranscript test', () {

    test('correctly formats a transcript with short sentences and 0-1:30 time durations', () {
      const transcript = '''
              0:00 Short sentence one
              0:10 Short sentence two
              0:20 Short sentence three
              0:30 Short sentence four
              1:00 Short sentence five
              1:10 Short sentence six
              1:20 Short sentence seven
              1:30 Short sentence eight
                   ''';

      final expectedOutput = {
        '0': 'Short sentence one',
        '10': 'Short sentence two',
        '20': 'Short sentence three',
        '30': 'Short sentence four',
        '100': 'Short sentence five',
        '110': 'Short sentence six',
        '120': 'Short sentence seven',
        '130': 'Short sentence eight',
      };

      expect(VideoModel.formatTranscript(transcript), expectedOutput);
    });

  });

}
