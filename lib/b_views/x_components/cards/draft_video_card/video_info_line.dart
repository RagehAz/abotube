import 'package:abotube/services/theme/abo_tube_colors.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:super_text/super_text.dart';

class VideoInfoLine extends StatelessWidget {
  // --------------------------------------------------------------------------
  const VideoInfoLine({
    @required this.title,
    @required this.text,
    @required this.width,
    Key key
  }) : super(key: key);
  // --------------------------------------------------------------------------
  final String title;
  final String text;
  final double width;
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return Container(
      width: width,
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[

          /// TITLE
          SuperText(
            text: title,
            boxWidth: width,
            textHeight: 20,
            boxColor: AboTubeTheme.youtubeColorDark,
            centered: false,
            textDirection: TextDirection.ltr,
            // margins: const,
          ),

          /// TEXT
          SuperText(
            text: text,
            boxWidth: width,
            textHeight: 20,
            boxColor: Colorz.black255,
            centered: false,
            textDirection: TextDirection.ltr,
            margins: const EdgeInsets.only(bottom: 5),
            maxLines: 2,
          ),
        ],
      ),

    );
  }
  // --------------------------------------------------------------------------
}
