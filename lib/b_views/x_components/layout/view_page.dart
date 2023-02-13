import 'package:abotube/b_views/a_structure/b_layout.dart';
import 'package:abotube/services/theme/abo_tube_colors.dart';
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:scale/scale.dart';

class ViewPage extends StatelessWidget {
  // -----------------------------------------------------------------------------
   const ViewPage({
    @required this.title,
    this.child,
    Key key,
  }) : super(key: key);
  // -----------------------------------------------------------------------------
  final Widget child;
  final String title;
  // -----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    blog('Building Page : $title');

    return Container(
      width: Scale.screenWidth(context),
      height: Layout.getViewHeight(),
      color: AboTubeTheme.blackLight ,
      child: child,
    );

  }
  // -----------------------------------------------------------------------------
}
