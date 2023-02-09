import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:scale/scale.dart';
import 'package:super_box/super_box.dart';
import 'package:video_translator/a_models/translation_progress_model.dart';

class ProgressButton extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const ProgressButton({
    @required this.text,
    @required this.status,
    @required this.onTap,
    Key key,
  }) : super(key: key);
  // --------------------------------------------------------------------------
  final String text;
  final ProgressStatus status;
  final Function onTap;
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    final Color _color = TranslationProgressModel.getStatusColor(status);

    return SuperBox(
      height: 25,
      icon: TranslationProgressModel.getStatusIcon(status),
      iconSizeFactor: TranslationProgressModel.getStatusIconSizeFactor(status),
      textScaleFactor: TranslationProgressModel.getStatusTextSizeFactor(status) * 1.3,
      iconColor: _color,
      text: text,
      width: Scale.screenWidth(context) - 20,
      margins: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      color: Colorz.white10,
      corners: 5,
      textColor: _color,
      bubble: false,
      textCentered: false,
      textItalic: true,
      loading: status == ProgressStatus.processing,
      onTap: onTap,
    );

  }
  /// --------------------------------------------------------------------------
}
