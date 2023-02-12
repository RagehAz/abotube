import 'package:abotube/b_views/x_components/layout/layout.dart';
import 'package:abotube/services/theme/abo_tube_colors.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:scale/scale.dart';
import 'package:super_box/super_box.dart';
import 'package:super_image/super_image.dart';

class AboTubeAppBar extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const AboTubeAppBar({
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  static PreferredSizeWidget getAppBar(){

    return AppBar(
      backgroundColor: AboTubeTheme.youtubeDarkBlack,
      toolbarHeight: Layout.navBarHeight,
      leading: const SizedBox(), // to close default back button
      flexibleSpace: const AboTubeAppBar(),
    );

  }
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    const double _lineThickness = 0.5;

    const double _appbarClearHeight = Layout.navBarHeight - _lineThickness;
    const double _appBarButtonSize = _appbarClearHeight - 10;

    return SizedBox(
        width: Scale.screenWidth(context),
        height: Layout.navBarHeight,
        // color: AboTubeTheme.youtubeColor,
        child: Column(
          children: <Widget>[

            /// CONTENTS
            SizedBox(
              width: Scale.screenWidth(context),
              height: _appbarClearHeight,
              child: Row(
                children: <Widget>[

                  /// ABOTUBE LOGO
                  const SuperImage(
                    height: Layout.navBarHeight,
                    width: Layout.navBarHeight * 2.5,
                    pic: AboTubeTheme.abotube_logo_white_name,
                  ),

                  const Expanded(child: SizedBox()),

                  SuperBox(
                    width: _appBarButtonSize,
                    height: _appBarButtonSize,
                    icon: Iconz.lab,
                    iconSizeFactor: 0.6,
                    corners: _appBarButtonSize / 2,
                    margins: const EdgeInsets.symmetric(horizontal: 5),
                    onTap: () => blog('Go to Lab'),
                  ),

                ],
              ),
            ),

            /// LINE
            Container(
              width: Scale.screenWidth(context),
              height: _lineThickness,
              color: AboTubeTheme.youTubeLightGrey,
            ),

          ],
        ),
      );

  }
  /// --------------------------------------------------------------------------
}
