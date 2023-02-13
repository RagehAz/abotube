import 'package:abotube/b_views/x_components/bars/app_bar/abo_tube_app_bar.dart';
import 'package:abotube/providers/ui_provider.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_box/super_box.dart';

class TabButton extends StatelessWidget {
  // -----------------------------------------------------------------------------
  const TabButton({
    @required this.icon,
    @required this.text,
    @required this.iconSizeFactor,
    this.colorize = false,
    Key key
  }) : super(key: key);
  // -----------------------------------------------------------------------------
  final String icon;
  final String text;
  final double iconSizeFactor;
  final bool colorize;
  // -----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return Selector(
      key: const ValueKey<String>('ObeliskVersesBuilder'),
      selector: (_, UiProvider uiProvider) => uiProvider.currentTab,
      builder: (_, String tab, Widget child) {

        final bool _isSelected = tab == text;

        return SuperBox(
          height: AboTubeAppBar.appBarButtonSize,
          // color: Colorz.white10,
          icon: icon,
          text: text,
          bubble: false,
          textFont: BldrsThemeFonts.fontBldrsHeadlineFont,
          textItalic: true,
          iconColor: colorize == true ?
          null
              :
          _isSelected == true ?
          Colorz.white255
              :
          Colorz.white80,
          textColor: _isSelected == true ? Colorz.white255 : Colorz.white80,
          textCentered: false,
          iconSizeFactor: iconSizeFactor,
          textScaleFactor: 1 / iconSizeFactor,
        );

      },
    );

  }
  // -----------------------------------------------------------------------------
}
