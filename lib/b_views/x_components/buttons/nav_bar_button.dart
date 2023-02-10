import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:super_box/super_box.dart';
import 'package:video_translator/b_views/x_components/layout/layout.dart';
import 'package:video_translator/services/helpers/helper_methods.dart';
import 'package:video_translator/services/navigation/navigators.dart';

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
      height: Layout.navBarHeight * 0.8,
      width: Layout.navBarHeight * 0.8,
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
