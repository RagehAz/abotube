import 'package:abotube/b_views/a_structure/b_layout.dart';
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
      backgroundColor: AboTubeTheme.blackLight,
      toolbarHeight: Layout.navBarHeight,
      leading: const SizedBox(), // to close default back button
      flexibleSpace: const AboTubeAppBar(),
    );

  }

  static PreferredSizeWidget getBackAppBar(){

    return AppBar(
      backgroundColor: AboTubeTheme.blackLight,
      toolbarHeight: Layout.navBarHeight,
      // leading: IconButton(
      //   icon: Iconz.back,
      //   onPressed: () => Navigator.pop(getContext()),
      // ),
      // flexibleSpace: const AboTubeAppBar(),
    );

  }
  /// --------------------------------------------------------------------------
  static const double lineThickness = 0.5;
  static const double appbarClearHeight = Layout.navBarHeight - lineThickness;
  static const double appBarButtonSize = appbarClearHeight - 10;
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {


    return SizedBox(
        width: Scale.screenWidth(context),
        height: Layout.navBarHeight,
        // color: AboTubeTheme.youtubeColor,
        child: Column(
          children: <Widget>[

            /// CONTENTS
            SizedBox(
              width: Scale.screenWidth(context),
              height: appbarClearHeight,
              child: Row(
                children: <Widget>[

                  /// ABOTUBE LOGO
                  const SuperImage(
                    height: Layout.navBarHeight,
                    width: Layout.navBarHeight * 2.5,
                    pic: AboTubeTheme.abotube_logo_white_name,
                  ),

                  /// EXPANDER
                  const Expanded(child: SizedBox()),

                  /// GO TO LAB
                  SuperBox(
                    width: appBarButtonSize,
                    height: appBarButtonSize,
                    icon: Iconz.dvRageh,
                    corners: appBarButtonSize / 2,
                    margins: const EdgeInsets.symmetric(horizontal: 5),
                    onTap: () => blog('This is Awesome'),
                  ),

                ],
              ),
            ),

            /// LINE
            const BarLine(),

          ],
        ),
      );

  }
  /// --------------------------------------------------------------------------
}

class BarLine extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const BarLine({
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return Container(
      width: Scale.screenWidth(context),
      height: AboTubeAppBar.lineThickness,
      color: AboTubeTheme.greyLight,
    );

  }
  /// --------------------------------------------------------------------------
}
