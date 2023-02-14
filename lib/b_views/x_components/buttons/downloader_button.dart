import 'package:abotube/b_views/a_screens/a_main_screen/a_main_screen.dart';
import 'package:abotube/services/providers/ui_provider.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_box/super_box.dart';

class DownloaderButton extends StatelessWidget {
  // --------------------------------------------------------------------------
  const DownloaderButton({
    @required this.icon,
    @required this.text,
    @required this.onTap,
    Key key
  }) : super(key: key);
  // --------------------------------------------------------------------------
  final String icon;
  final String text;
  final Function onTap;
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return Selector(
      key: const ValueKey<String>('DownloaderButton'),
      selector: (_, UiProvider uiProvider) => uiProvider.downloaderURL,
      builder: (_, String currentURL, Widget child) {

        return SuperBox(
          height: Layout.navBarHeight - 15,
          icon: icon,
          text: text,
          bubble: false,
          textFont: BldrsThemeFonts.fontBldrsHeadlineFont,
          textItalic: true,
          textCentered: false,
          iconSizeFactor: 0.7,
          textScaleFactor: (1 / 0.7) * 0.8,
          onTap: onTap,
          color: Colorz.white20,
          margins: const EdgeInsets.symmetric(horizontal: 5),
          isDisabled: currentURL == 'https://m.youtube.com/',

        );

      },
    );

  }
  // --------------------------------------------------------------------------
}
