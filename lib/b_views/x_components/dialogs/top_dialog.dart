import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:scale/scale.dart';
import 'package:super_box/super_box.dart';
import 'package:super_text/super_text.dart';

class TopDialog extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const TopDialog({
    @required this.text,
    @required this.onTap,
    this.duration = 3,
    Key key,
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  final String text;
  final Function onTap;
  final int duration;
  // --------------------------------------------------------------------------
  /// TESTED : WORKS PERFECT
  static Future<void> closeTopDialog({
    @required GlobalKey globalKey,
  }) async {
    final Flushbar _flushbar = globalKey?.currentWidget;

    if (_flushbar?.isDismissed() == false) {
      SchedulerBinding.instance.addPostFrameCallback((_) async {
        await _flushbar.dismiss();
      });
    }

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<void> showTopDialog({
    @required GlobalKey globalKey,
    @required String firstText,
    String secondText,
    Color color = Colorz.yellow255,
    Color textColor = Colorz.black255,
    Function onTap,
    int milliseconds = 5000,
    dynamic corners,
    double height = 70,
    double width,
    dynamic margins,
    double firstTextHeight = 30,
    double secondTextHeight = 15,
    String firstFont,
    String secondFont,
    TextDirection textDirection = TextDirection.ltr,
    bool appIsLTR = true,
  }) async {

    final BuildContext _context = globalKey.currentContext;

    await closeTopDialog(
      globalKey: globalKey,
    );

    final double _screenWidth = Scale.screenWidth(_context);
    final double _bubbleWidth = width ?? Scale.screenWidth(_context);
    final BorderRadius _corners = Borderers.superCorners(context: _context, corners: corners);

    await Flushbar(
      key: globalKey,

      /// BEHAVIOUR - POSITIONING ----------------------------------------------
      // dismissDirection: FlushbarDismissDirection.VERTICAL,
      flushbarPosition: FlushbarPosition.TOP,
      // flushbarStyle: FlushbarStyle.FLOATING,
      // isDismissible: true,
      // blockBackgroundInteraction: false, // prevents gestures on background widgets

      /// SIZING ----------------------------------------------
      maxWidth: _screenWidth,
      borderRadius: _corners,
      padding: EdgeInsets.zero,
      margin: Scale.superMargins(margin: margins),

      /// COLORING ----------------------------------------------
      // routeColor: null, // SCREEN BACKGROUND COLOR
      backgroundColor: color, // DIALOG BACKGROUND COLOR
      // barBlur: 50,
      // backgroundGradient: null,
      boxShadows: Shadower.appBarShadow,
      // routeBlur: null,

      /// BORDERS ----------------------------------------------
      // borderColor: Colorz.Black255,
      // borderWidth: 1,

      /// ANIMATION ----------------------------------------------
      forwardAnimationCurve: Curves.easeOutBack,
      duration: Duration(milliseconds: milliseconds ?? 1000),
      animationDuration: const Duration(milliseconds: 150),
      reverseAnimationCurve: Curves.elasticOut,

      ///   LEFT BAR INDICATOR ----------------------------------------------
      // leftBarIndicatorColor: null,

      /// LEADING ----------------------------------------------
      // icon: null,

      /// TITLE ----------------------------------------------
      titleText: Container(
        width: _bubbleWidth,
        constraints: BoxConstraints(
          minHeight: height,
        ),
        decoration: BoxDecoration(
          // color: Colorz.Black255,
          borderRadius: _corners,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            /// FIRST LINE
            SuperText(
              boxWidth: _bubbleWidth,
              text: firstText,
              textColor: textColor,
              maxLines: 3,
              margins: 5,
              appIsLTR: appIsLTR,
              textDirection: textDirection,
              font: firstFont,
              textHeight: firstTextHeight,
            ),

            /// SECOND LINE
            if (secondText != null)
              SuperText(
                boxWidth: _bubbleWidth,
                text: secondText,
                textHeight: secondTextHeight,
                textColor: textColor,
                weight: FontWeight.w100,
                italic: true,
                maxLines: 2,
                margins: 5,
                appIsLTR: appIsLTR,
                textDirection: textDirection,
                font: secondFont,
              ),

          ],
        ),
      ),

      /// BODY ----------------------------------------------
      messageText: const SizedBox(),
      // messageColor: null,
      // messageSize: null,

      /// ACTION BUTTON ----------------------------------------------
      // mainButton: null,
      // DreamBox(
      //   height: 40,
      //   width: 100,
      //   verse:  'main button',
      //   verseScaleFactor: 0.5,
      // ),

      /// PROGRESS INDICATOR ----------------------------------------------
      // showProgressIndicator: false,
      progressIndicatorBackgroundColor: Colorz.yellow255,
      // progressIndicatorController: AnimationController(),
      // progressIndicatorValueColor: ,

      /// INTERACTIONS ----------------------------------------------
      onTap: (Flushbar<dynamic> flushbar) {

        closeTopDialog(
          globalKey: globalKey,
        );
        // blog('on tap : flushbar : ${flushbar.onTap}');

      },

      onStatusChanged: (FlushbarStatus status) {

        // switch (status) {
        //   case FlushbarStatus.SHOWING:
        //     {
        //       doSomething();
        //       break;
        //     }
        //   case FlushbarStatus.IS_APPEARING:
        //     {
        //       doSomethingElse();
        //       break;
        //     }
        //   case FlushbarStatus.IS_HIDING:
        //     {
        //       doSomethingElse();
        //       break;
        //     }
        //   case FlushbarStatus.DISMISSED:
        //     {
        //       doSomethingElse();
        //       break;
        //     }
        // }

      },

      /// UNKNOWN ----------------------------------------------
      message: '...',
      title: '...',
      endOffset: Offset.zero,
      shouldIconPulse: false,
      // positionOffset: 0,
      // userInputForm: ,
    ).show(_context);
  }
  // --------------------
  /// BUG THE SHIT OUT OF LIFE
  /*
  static void showUnawaitedTopDialog({
    @required BuildContext context,
    @required Verse firstVerse,
    Verse secondVerse,
    Color color = Colorz.yellow255,
    Color textColor = Colorz.black255,
    Function onTap,
    int milliseconds = 5000,
  }){

    unawaited(showTopDialog(
      context: context,
      firstVerse: firstVerse,
      secondVerse: secondVerse,
      color: color,
      textColor: textColor,
      onTap: onTap,
      milliseconds: milliseconds,
    ));

  }
   */
  // -----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    final double _screenWidth = Scale.screenWidth(context);

    return Flushbar(
      message: text,
      onTap: onTap,
      duration: const Duration(milliseconds: 5000),
      // title: 'wtf',
      // padding: EdgeInsets.zero,
      // margin: EdgeInsets.zero,
      borderRadius: BorderRadius.zero,
      animationDuration: const Duration(milliseconds: 5000),
      backgroundColor: Colorz.black10,
      barBlur: 5,
      // backgroundGradient: null,
      blockBackgroundInteraction: true,
      // borderColor: null,
      borderWidth: _screenWidth,
      // dismissDirection: FlushbarDismissDirection.VERTICAL,
      flushbarPosition: FlushbarPosition.TOP,
      boxShadows: const <BoxShadow>[],
      endOffset: Offset.zero,
      // flushbarStyle: FlushbarStyle.FLOATING,
      forwardAnimationCurve: Curves.easeInOut,
      // isDismissible: true,
      leftBarIndicatorColor: Colorz.blue125,
      // mainButton: const DreamBox(
      //   height: 40,
      //   width: 100,
      //   verse:  'main button',
      //   verseScaleFactor: 0.5,
      // ),
      maxWidth: _screenWidth,
      messageColor: Colorz.white255,
      messageSize: 20,
      // messageText: const SuperVerse(
      //   verse:  'Message text',
      //   size: 1,
      // ),
      // onStatusChanged: (FlushbarStatus status) {
      //   blog('status is : $status');
      // },
      // positionOffset: 0,
      progressIndicatorBackgroundColor: Colorz.cyan50,
      // progressIndicatorController: AnimationController(),
      // progressIndicatorValueColor: ,
      reverseAnimationCurve: Curves.easeInOut,
      routeBlur: 0,
      routeColor: Colorz.black255,
      // shouldIconPulse: true,
      showProgressIndicator: true,
      titleColor: Colorz.bloodTest,
      titleSize: 15,
      // titleText: const SuperVerse(
      //   verse:  'title text',
      //   size: 1,
      // ),
      // userInputForm: ,
      icon: const SuperBox(
        width: 40,
        height: 40,
        icon: Iconz.dvGouran,
        color: Colorz.darkRed255,
        margins: EdgeInsets.zero,
      ),
    )..show(context);

  }
  // --------------------
}
