import 'package:abotube/a_models/video_model.dart';
import 'package:abotube/b_views/x_components/cards/draft_video_card/draft_video_card.dart';
import 'package:abotube/services/ldb/video_ldb_ops.dart';
import 'package:abotube/services/protocols/youtube_video_protocols.dart';
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:mapper/mapper.dart';
import 'package:numeric/numeric.dart';
import 'package:super_text/super_text.dart';

class HomePage extends StatefulWidget {
  /// --------------------------------------------------------------------------
  const HomePage({
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  @override
  State<HomePage> createState() => _HomePageState();
  /// --------------------------------------------------------------------------
}

class _HomePageState extends State<HomePage> {
  // -----------------------------------------------------------------------------
  List<VideoModel> _videos = [];
  // -----------------------------------------------------------------------------
  /// --- LOADING
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  // --------------------
  Future<void> _triggerLoading({@required bool setTo}) async {
    setNotifier(
      notifier: _loading,
      mounted: mounted,
      value: setTo,
    );
  }
  // -----------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
  }
  // --------------------
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit && mounted) {

      _triggerLoading(setTo: true).then((_) async {

        final List<VideoModel> _stored = await VideoLDBOps.readAll();

        setState(() {
          _videos = _stored;
        });

        await _triggerLoading(setTo: false);
      });

      _isInit = false;
    }
    super.didChangeDependencies();
  }
  // --------------------
  @override
  void dispose() {
    _loading.dispose();
    super.dispose();
  }
  // --------------------------------------------------------------------------
  /// TESTED : WORKS PERFECT
  Future<void> _onDeleteVideo(VideoModel videoModel) async {

    await _triggerLoading(setTo: true);

    await VideoProtocols.wipeVideo(videoID: videoModel.id);

    final List<VideoModel> _updated = VideoModel.removeVideo(
      videoID: videoModel.id,
      videos: _videos,
    );

    setState(() {
      _videos = _updated;
    });

    await _triggerLoading(setTo: false);

  }
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable: _loading,
      builder: (_, bool isLoading, Widget child) {

        if (isLoading == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        else {

          if (Mapper.checkCanLoopList(_videos) == false) {
            return const Center(
              child: SuperText(
                text: 'No Videos Found',
              ),
            );
          }

          else {
            return child;
          }

        }

      },
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _videos.length,
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemBuilder: (_, int index) {

          final int _num = index + 1;
          final String _n = Numeric.formatIndexDigits(
            index: _num,
            listLength: _videos.length,
          );

          final VideoModel _videoModel = _videos[index];

          return DraftVideoCard(
            videoModel: _videoModel,
            number: _n,
            onDeleteVideo: () => _onDeleteVideo(_videoModel),
          );
        },
      ),
    );
  }
  // --------------------------------------------------------------------------
}
