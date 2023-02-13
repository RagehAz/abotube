import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:scale/scale.dart';
import 'package:stringer/stringer.dart';
import 'package:super_box/super_box.dart';
import 'package:abotube/b_views/a_structure/b_layout.dart';
import 'package:abotube/b_views/x_components/bars/nav_bar/nav_bar_box.dart';
import 'package:abotube/services/protocols/youtube_protocols.dart';
import 'package:webview_flutter/webview_flutter.dart';
/*
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
 */

class YoutubeWebPage extends StatefulWidget {
  /// --------------------------------------------------------------------------
  const YoutubeWebPage({
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  @override
  _YoutubeWebPageState createState() => _YoutubeWebPageState();
  /// --------------------------------------------------------------------------
}

class _YoutubeWebPageState extends State<YoutubeWebPage> {
  // -----------------------------------------------------------------------------
  static const String _link = 'https://www.youtube.com';
  String _currentURL;
  // --------------------
  WebViewController controller;
  // -----------------------------------------------------------------------------
  /*
  /// --- LOADING
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  // --------------------
  Future<void> _triggerLoading({@required bool setTo}) async {
    setNotifier(
      notifier: _loading,
      mounted: mounted,
      value: setTo,
    );
  }
   */
  // -----------------------------------------------------------------------------
  @override
  void initState() {

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(_link));

    _getCurrentURl();

    super.initState();
  }
  // --------------------
  /*
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit && mounted) {

      _triggerLoading(setTo: true).then((_) async {

        /// FUCK

        await _triggerLoading(setTo: false);
      });

      _isInit = false;
    }
    super.didChangeDependencies();
  }
   */
  // --------------------
  @override
  void dispose() {
    // _loading.dispose();
    super.dispose();
  }
  // --------------------------------------------------------------------------
  Future<void> _getCurrentURl() async {
    final String _url = await controller.currentUrl();
    setState(() {
      _currentURL = _url;
    });
  }
  // --------------------------------------------------------------------------
  String _formatURL(String url) {
    if (url == null) {
      return '';
    }
    else {
      const int _number = 22;

      final String _end = TextMod.removeNumberOfCharactersFromBeginningOfAString(
        numberOfCharacters: _number,
        string: url,
      );

      final String _start = TextMod.removeAllCharactersAfterNumberOfCharacters(
          input: url,
          numberOfChars: _number
      );

      return '$_start\n$_end';
    }
  }
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --------------------
    final double _screenWidth = Scale.screenWidth(context);
    final double _webviewHeight = Layout.getViewHeight() - Layout.navBarHeight;
    const double _topButtonHeight = Layout.navBarHeight - 10;
    // --------------------
    // _getCurrentURl();
    // --------------------
    return SizedBox(
        width: Scale.screenWidth(context),
        height: Layout.getViewHeight(),
        child: Column(
          children: <Widget>[

            NavBarBox(
              children: <Widget>[

                /// CURRENT URL
                SuperBox(
                  height: _topButtonHeight,
                  icon: Iconz.comWebsite,
                  iconSizeFactor: 0.5,
                  text: _formatURL(_currentURL),
                  onTap: () async {
                    await _getCurrentURl();
                  },
                  textMaxLines: 2,
                  textCentered: false,
                ),

                /// COPY
                SuperBox(
                  height: _topButtonHeight,
                  icon: Iconz.bxProductsOff,
                  iconSizeFactor: 0.5,
                  text: 'Copy\nURL',
                  isDisabled: _currentURL == 'https://m.youtube.com/',
                  onTap: () async {
                    await TextClipBoard.copy(copy: _currentURL);
                  },
                  textMaxLines: 2,
                  textCentered: false,
                ),

                /// DOWNLOAD
                SuperBox(
                  height: _topButtonHeight,
                  icon: Iconz.arrowDown,
                  iconSizeFactor: 0.3,
                  textScaleFactor: 1.5,
                  text: 'Download\nVideo',
                  isDisabled: _currentURL == 'https://m.youtube.com/',
                  onTap: () async {

                    await _getCurrentURl();

                    final bool _isAtHomePage = _currentURL == 'https://m.youtube.com/';

                    if (_isAtHomePage == false){

                      final String _title = await controller.getTitle();

                      await YoutubeProtocols.downloadYoutubeVideo(
                        url: _currentURL,
                        videoTitle: _title,
                      );
                    }

                  },
                  textMaxLines: 2,
                  textCentered: false,
                ),

              ],
            ),

            /// WEB VIEW
            SizedBox(
              width: _screenWidth,
              height: _webviewHeight,
              child: WebViewWidget(
                controller: controller,
                // gestureRecognizers: ,
                // layoutDirection: ,
                // key: ,
              ),
            )

          ],
        ),

      );
    // --------------------
  }
  // --------------------------------------------------------------------------
}
