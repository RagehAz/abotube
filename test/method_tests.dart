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

}
