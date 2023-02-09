import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:scale/scale.dart';
import 'package:video_translator/b_views/x_components/buttons/nav_bar_button.dart';
import 'package:video_translator/services/helpers/helper_methods.dart';
import 'package:video_translator/services/navigation/navigators.dart';
import 'package:video_translator/services/navigation/routing.dart';

class Layout extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const Layout({
    @required this.viewWidget,
    this.canGoBack = true,
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
  static const double navBarHeight = 60;
  // --------------------
  /// TESTED : WORKS PERFECT
  static double getViewHeight(){
    final BuildContext context = getContext();
    final double _screenHeight = Scale.screenHeight(context);
    return _screenHeight - navBarHeight;
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

          /// INSETS
          resizeToAvoidBottomInset: false, /// if false : prevents keyboard from pushing pyramids up / bottom sheet
          // resizeToAvoidBottomPadding: false,
          backgroundColor: Colorz.skyDarkBlue,

          body: Column(
            children: <Widget>[

              SizedBox(
                  width: _screenWidth,
                  height: _viewHeight,
                  child: viewWidget
              ),

              /// NAVBAR
              Container(
                width: _screenWidth,
                height: navBarHeight,
                color: Colorz.white20,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  children: const <Widget>[

                    /// LAB SCREEN
                    NavBarButton(
                      icon: Iconz.bxPropertiesOff,
                      route: Routing.homeRoute,
                    ),

                    /// LAB SCREEN
                    NavBarButton(
                      route: Routing.labRoute,
                      icon: Iconz.lab,
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }
  /// --------------------------------------------------------------------------
}
