import 'package:abotube/a_models/caption_model.dart';
import 'package:abotube/a_models/video_model.dart';
import 'package:abotube/b_views/x_components/cards/draft_video_card/video_info_line.dart';
import 'package:abotube/b_views/x_components/dialogs/bottom_dialog.dart';
import 'package:abotube/b_views/x_components/super_video_player/super_video_player.dart';
import 'package:abotube/services/helpers/helper_methods.dart';
import 'package:abotube/services/navigation/navigators.dart';
import 'package:abotube/services/protocols/gallery_protocols.dart';
import 'package:abotube/services/theme/abo_tube_colors.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:bubbles/bubbles.dart';
import 'package:flutter/material.dart';
import 'package:super_text/super_text.dart';

class DraftVideoCard extends StatelessWidget {
  // --------------------------------------------------------------------------
  const DraftVideoCard({
    @required this.videoModel,
    @required this.number,
    @required this.onDeleteVideo,
    Key key
  }) : super(key: key);
  // --------------------------------------------------------------------------
  final VideoModel videoModel;
  final String number;
  final Function onDeleteVideo;
  // --------------------------------------------------------------------------
  Future<void> onMoreTap() async {

    final BuildContext context = getContext();

    await BottomDialog.showBottomDialog(
        context: context,
        draggable: true,
        title: videoModel.id,
        child: Column(
          children: <Widget>[

            BottomDialog.wideButton(
              context: context,
              text: 'Delete',
              icon: Iconz.xSmall,
              color: AboTubeTheme.youtubeColor,
              onTap: () async {

                await onDeleteVideo();
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

    return Bubble(
      width: _bubbleWidth,
      bubbleHeaderVM: BubbleHeaderVM(
        headlineText: '$number. ${videoModel.id}',
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
            url: videoModel?.url,
            width: _clearWidth,
          ),

        /// TITLE
        VideoInfoLine(
          width: _clearWidth,
          text: videoModel?.title,
          title: 'Title',
        ),

        /// URL
        VideoInfoLine(
          width: _clearWidth,
          text: videoModel?.url,
          title: 'URL',
        ),

        /// IS DOWNLOADED
        FutureBuilder(
          future: GalleryProtocols.doesFileExistInGallery(videoModel?.title),
          builder: (_, AsyncSnapshot<bool> snapshot) {

            final bool _isDownloaded = snapshot.data ?? false;

            final String text = snapshot.connectionState == ConnectionState.done
              ? _isDownloaded ? 'YES' : 'NO'
              : '...';

            return VideoInfoLine(
              width: _clearWidth,
              title: 'is Downloaded ?',
              text: text,
            );
          }
        ),

        /// CAPTIONS
        BulletPoints(
            boxWidth: _clearWidth,
            textHeight: 15,
            bulletPoints: CaptionModel.getTexts(videoModel?.captions),
        ),

      ],
    );

  }
  // --------------------------------------------------------------------------
}
