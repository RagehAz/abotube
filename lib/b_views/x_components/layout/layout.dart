import 'package:abotube/b_views/x_components/app_bar/abo_tube_app_bar.dart';
import 'package:abotube/b_views/x_components/nav_bar/nav_bar.dart';
import 'package:abotube/services/helpers/helper_methods.dart';
import 'package:abotube/services/navigation/navigators.dart';
import 'package:abotube/services/theme/abo_tube_colors.dart';
import 'package:flutter/material.dart';
import 'package:scale/scale.dart';

class Layout extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const Layout({
    @required this.viewWidget,
    this.canGoBack = false,
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  final Widget viewWidget;
  final bool canGoBack;
  // -----------------------------------------------------------------------------

  /// GO BACK

  // --------------------
  /// TESTED : WORKS PERFECT
  Future<void> _onBack(BuildContext context) async {

    // if (onBack != null){
    //   await onBack();
    // }
    //
    // else {
    //
    //   final UiProvider _uiProvider = Provider.of<UiProvider>(context, listen: false);
    //   if (_uiProvider.keyboardIsOn == true){
    //     Keyboard.closeKeyboard(context);
    //   }

      if (canGoBack == true){
        await Nav.goBack(
          context: context,
          invoker: 'MainLayout._onBack',
        );
      }

    // }

  }
  // -----------------------------------------------------------------------------

  /// DELEGATE

  // --------------------
  static const double navBarHeight = 50;
  // --------------------
  /// TESTED : WORKS PERFECT
  static double getViewHeight(){
    final BuildContext context = getContext();
    final double _screenHeight = Scale.screenHeight(context);
    return _screenHeight - (navBarHeight * 2);
  }
  // -----------------------------------------------------------------------------

  /// DELEGATE

  // --------------------
  @override
  Widget build(BuildContext context) {

    final double _screenWidth = Scale.screenWidth(context);
    final double _viewHeight = getViewHeight();

    return WillPopScope(
      key: const ValueKey<String>('Main_layout'),
      onWillPop: () async {
        await _onBack(context);
        return false;
      },
      child: SafeArea(

        child: Scaffold(
          appBar: AboTubeAppBar.getAppBar(),

          /// INSETS
          resizeToAvoidBottomInset: false, /// if false : prevents keyboard from pushing pyramids up / bottom sheet
          // resizeToAvoidBottomPadding: false,
          backgroundColor: AboTubeTheme.youtubeDarkBlack,

          body: Column(
            children: <Widget>[

              SizedBox(
                  width: _screenWidth,
                  height: _viewHeight,
                  child: viewWidget
              ),

              /// NAVBAR
              const NavBar(),

            ],
          ),

        ),
      ),
    );

  }
  /// --------------------------------------------------------------------------
}
