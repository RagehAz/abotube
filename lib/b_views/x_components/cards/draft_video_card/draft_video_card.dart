import 'dart:io';

import 'package:abotube/a_models/caption_model.dart';
import 'package:abotube/a_models/video_model.dart';
import 'package:abotube/b_views/x_components/cards/draft_video_card/video_info_line.dart';
import 'package:abotube/b_views/x_components/dialogs/bottom_dialog.dart';
import 'package:abotube/b_views/x_components/super_video_player/super_video_player.dart';
import 'package:abotube/services/helpers/helper_methods.dart';
import 'package:abotube/services/navigation/navigators.dart';
import 'package:abotube/services/protocols/video_protocols.dart';
import 'package:abotube/services/theme/abo_tube_colors.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:bubbles/bubbles.dart';
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:super_text/super_text.dart';

class DraftVideoCard extends StatefulWidget {
  // --------------------------------------------------------------------------
  const DraftVideoCard({
    @required this.videoModel,
    @required this.number,
    @required this.onDeleteVideo,
    @required this.onRedownloadVideo,
    Key key
  }) : super(key: key);
  // --------------------------------------------------------------------------
  final VideoModel videoModel;
  final String number;
  final Function onDeleteVideo;
  final Function onRedownloadVideo;
  // --------------------------------------------------------------------------
  @override
  State<DraftVideoCard> createState() => _DraftVideoCardState();
  // --------------------------------------------------------------------------
}

class _DraftVideoCardState extends State<DraftVideoCard> {
  // -----------------------------------------------------------------------------
  String _url;
  File _file;
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

        await _initializeVideoModel();

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
  // --------------------
  @override
  void didUpdateWidget(DraftVideoCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.videoModel != oldWidget.videoModel) {
      _initializeVideoModel();
    }
  }
  // --------------------------------------------------------------------------
  /// TESTED : WORKS PERFECT
  Future<void> _initializeVideoModel() async {

    final String _path = await VideoProtocols.getDownloadedVideoPath(
      videoID: widget.videoModel?.id,
    );

    if (_path == null){
      setState(() {
        _url = widget.videoModel?.url;
        _file = null;
      });
    }

    else {
      setState(() {
        _url = null;
        _file = File(_path);
      });
    }

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  Future<void> onMoreTap() async {

    final BuildContext context = getContext();

    await BottomDialog.showBottomDialog(
        context: context,
        draggable: true,
        title: widget.videoModel.id,
        child: Column(
          children: <Widget>[

            /// RE DOWNLOAD
            BottomDialog.wideButton(
              context: context,
              text: 'RE DOWNLOAD',
              icon: Iconz.flyerCollection,
              color: Colorz.white10,
              onTap: () async {

                await widget.onRedownloadVideo();
                await Nav.goBack(context: context);

              }
            ),

            /// SPACER
            const SizedBox(height: 5),

            /// DELETE
            BottomDialog.wideButton(
              context: context,
              text: 'DELETE',
              icon: Iconz.xSmall,
              color: AboTubeTheme.youtubeColor,
              onTap: () async {

                await widget.onDeleteVideo();
                await Nav.goBack(context: context);

              }
            ),

          ],
        ),
    );

  }
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    final double _bubbleWidth = Bubble.bubbleWidth(
      context: context,
    );

    final double _clearWidth = Bubble.clearWidth(
      context: context,
    );

    final String _timeString = VideoModel.calculateSuperTimeDifferenceString(
      from: widget.videoModel?.createdAt,
      to: DateTime.now(),
    );

    final String _isDownloadedText = _file == null ? 'NO' : 'YES';

    return Bubble(
      width: _bubbleWidth,
      bubbleHeaderVM: BubbleHeaderVM(
        headlineText: '${widget.number}. ${widget.videoModel.id} . $_timeString',
        headlineHeight: 20,
        font: BldrsThemeFonts.fontBldrsHeadlineFont,

        // moreButtonIcon: Iconz.more,
        moreButtonIconSizeFactor: 0.7,
        hasMoreButton: true,
        onMoreButtonTap: onMoreTap,

      ),
      margin: 10,
      // onBubbleTap: onAddVideo,
      // onBubbleDoubleTap: onAddVideo,
      columnChildren: <Widget>[

        /// VIDEO PLAYER
        SuperVideoPlayer(
          url: _url,
          file: _file,
          width: _clearWidth,
        ),

        /// TITLE
        VideoInfoLine(
          width: _clearWidth,
          text: widget.videoModel?.title,
          title: 'Title',
        ),

        /// URL
        VideoInfoLine(
          width: _clearWidth,
          text: widget.videoModel?.url,
          title: 'URL',
        ),

        /// IS DOWNLOADED
        VideoInfoLine(
          width: _clearWidth,
          title: 'is Downloaded ?',
          text: _isDownloadedText,
        ),

        /// CAPTIONS
        BulletPoints(
            boxWidth: _clearWidth,
            textHeight: 15,
            bulletPoints: CaptionModel.getTexts(widget.videoModel?.captions),
        ),

      ],
    );

  }
}
