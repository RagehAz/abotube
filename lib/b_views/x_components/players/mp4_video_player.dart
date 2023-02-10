import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MP4VideoPlayerScreen extends StatefulWidget {
  /// --------------------------------------------------------------------------
  const MP4VideoPlayerScreen({
    this.link,
    Key key
  }) : super(key: key);

  final String link;
  /// --------------------------------------------------------------------------
  @override
  _MP4VideoPlayerScreenState createState() => _MP4VideoPlayerScreenState();
  /// --------------------------------------------------------------------------
}

class _MP4VideoPlayerScreenState extends State<MP4VideoPlayerScreen> {
  // --------------------------------------------------------------------------
  VideoPlayerController _videoPlayerController;
  VideoPlayerValue _value;
  // --------------------
  String _link;
  // --------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();

    _link = widget.link ?? 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';

    _videoPlayerController = VideoPlayerController.network(
        _link,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
      ..initialize()
      ..setVolume(10)
      ..play()
      ..addListener(() => setState(() => _value = _videoPlayerController.value));
  }
  // --------------------
  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: const Text('Testing Video Player'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                // _value.log();
                setState(() {
                  _videoPlayerController.setVolume(100);
                });
              },
              icon: const Icon(Icons.local_activity))
        ],
      ),
      body: Center(

          child: GestureDetector(
            onTap: () {
              setState(() {
                _videoPlayerController.play();
                _videoPlayerController.setLooping(false);
              });
            },
            child: SizedBox(
              height: 500,
              width: 350,
              child: Stack(
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias, // to clip the child corners to be circular forcefully
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 20,
                    child: _value == null || _value.isBuffering ?
                    const Center(child: Icon(Icons.close, size: 50))
                        :
                    VideoPlayer(_videoPlayerController),
                  ),
                  if (_value?.isPlaying == false)
                    const Center(
                        child: Icon(Icons.play_arrow,
                            size: 50,
                            color: Colors.red
                        )
                    )
                ],
              ),
            ),
          )),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            heroTag: 'play',
            onPressed: () {
              setState(() {
                _videoPlayerController.play();
                _videoPlayerController.setLooping(true);
              });
              // _value.isPlaying.log();
            },
            child: const Icon(Icons.play_arrow),
          ),

          const SizedBox(height: 10),

          FloatingActionButton(
            heroTag: 'pause',
            onPressed: () {
              setState(() {
                _videoPlayerController.pause();
                _videoPlayerController.setLooping(false);
              });
              // _value.isPlaying.log();
            },
            child: const Icon(Icons.pause),
          ),
        ],
      ),
    );
  }
}
