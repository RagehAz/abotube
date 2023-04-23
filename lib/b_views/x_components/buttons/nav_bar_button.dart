import 'package:abotube/b_views/x_components/bars/app_bar/abo_tube_app_bar.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:layouts/layouts.dart';
import 'package:super_box/super_box.dart';
import 'package:abotube/services/helpers/helper_methods.dart';

class NavBarButton extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const NavBarButton({
    @required this.icon,
    @required this.route,
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  final String icon;
  final String route;
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    final String _route = getRoute(context);
    final bool _isSelected = _route == route;

    return  SuperBox(
      height: AboTubeAppBar.appBarButtonSize,
      width: AboTubeAppBar.appBarButtonSize,
      corners: AboTubeAppBar.appBarButtonSize / 2,
      icon: icon,
      iconSizeFactor: 0.7,
      margins: 5,
      color: _isSelected == true ? Colorz.yellow255 : Colorz.nothing,
      iconColor: _isSelected == true ? Colorz.black255 : Colorz.white200,
      onTap: () => Nav.pushNamedAndRemoveAllBelow(context: context, goToRoute: route),
    );

  }
  /// --------------------------------------------------------------------------
}
