import 'package:abotube/a_models/video_model.dart';
import 'package:abotube/b_views/x_components/cards/draft_video_card/draft_video_card.dart';
import 'package:abotube/services/ldb/video_ldb_ops.dart';
import 'package:abotube/services/protocols/video_protocols.dart';
import 'package:abotube/services/providers/ui_provider.dart';
import 'package:abotube/services/theme/abo_tube_colors.dart';
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:layouts/layouts.dart';
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
          _videos = _stored.reversed.toList();
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

    final List<VideoModel> _updated = VideoModel.removeVideoFromVideos(
      videoID: videoModel.id,
      videos: _videos,
    );

    setState(() {
      _videos = _updated;
    });

    await _triggerLoading(setTo: false);

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  Future<void> _onRedownloadVideo(VideoModel videoModel) async {

    VideoProtocols.downloadYoutubeVideo(
        url: videoModel.url,
    );

  }
  // --------------------
  ///
  Future<void> _onTranslate(VideoModel videoModel) async {

    final TabController _controller  = UiProvider.proGetTabController(listen: false);

    UiProvider.proSetCurrentDraft(
      videoModel: videoModel,
      notify: true,
    );

    _controller.animateTo(
      1,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );

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
      child: PullToRefresh(
        indicatorColor: AboTubeTheme.youtubeColor,
        fadeOnBuild: true,
        onRefresh: (){
          setState(() {});
        },
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: _videos.length,
          padding: const EdgeInsets.only(top: 20, bottom: 200),
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
              onRedownloadVideo: () => _onRedownloadVideo(_videoModel),
              onTranslate: () => _onTranslate(_videoModel),
            );

          },
        ),
      ),
    );
  }
  // --------------------------------------------------------------------------
}
