import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:scale/scale.dart';
import 'package:stringer/stringer.dart';
import 'package:super_box/super_box.dart';
import 'package:video_translator/b_views/x_components/layout/layout.dart';
import 'package:video_translator/b_views/x_components/nav_bar/nav_bar_box.dart';
import 'package:video_translator/services/protocols/youtube_protocols.dart';
import 'package:webview_flutter/webview_flutter.dart';
/*
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
 */

class YoutubeWebpageScreen extends StatefulWidget {
  /// --------------------------------------------------------------------------
  const YoutubeWebpageScreen({
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  @override
  _YoutubeWebpageScreenState createState() => _YoutubeWebpageScreenState();
  /// --------------------------------------------------------------------------
}

class _YoutubeWebpageScreenState extends State<YoutubeWebpageScreen> {
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
      final String _without = TextMod.removeTextAfterLastSpecialCharacter(url, '=');
      final String _videoID = TextMod.removeTextBeforeLastSpecialCharacter(url, '=');
      return '$_without\n=$_videoID';
    }
  }
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --------------------
    final double _screenWidth = Scale.screenWidth(context);
    final double _webviewHeight = Layout.getViewHeight() - Layout.navBarHeight;
    const double _topButtonHeight = Layout.navBarHeight - 10;

    return Layout(
      viewWidget: SizedBox(
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
                  onTap: () async {

                    await YoutubeProtocols.downloadYoutubeVideo(
                      url: 'https://m.youtube.com/watch?v=dAHqcEnPIXw',
                    );

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


      ),
    );
    // --------------------
  }
  // --------------------------------------------------------------------------
}
