import 'package:abotube/b_views/a_screens/a_main_screen/a_main_screen.dart';
import 'package:abotube/b_views/x_components/bars/nav_bar/nav_bar_box.dart';
import 'package:abotube/b_views/x_components/buttons/downloader_button.dart';
import 'package:abotube/services/protocols/youtube_video_protocols.dart';
import 'package:abotube/services/providers/ui_provider.dart';
import 'package:abotube/services/theme/abo_tube_colors.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';
import 'package:provider/provider.dart';
import 'package:scale/scale.dart';
import 'package:stringer/stringer.dart';
import 'package:super_text/super_text.dart';
import 'package:webview_flutter/webview_flutter.dart';
/*
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
 */

class DownloaderPage extends StatefulWidget {
  /// --------------------------------------------------------------------------
  const DownloaderPage({
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  @override
  _DownloaderPageState createState() => _DownloaderPageState();
  /// --------------------------------------------------------------------------
}

class _DownloaderPageState extends State<DownloaderPage> {
  // -----------------------------------------------------------------------------
  static const String _link = 'https://www.youtube.com';
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
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) async {

            if (progress == 100){
              await _getCurrentURl();
            }

          },
          onPageStarted: (String url) {
            // WORKS ONLY ON INIT : NOT USEFUL
          },
          onPageFinished: (String url) {
            // WORKS ONLY ON INIT : NOT USEFUL
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AboTubeTheme.blackLight)
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
    UiProvider.proSetDownloaderURL(
        url: _url,
        notify: true,
    );
  }
  // --------------------------------------------------------------------------
  ///
  Future<void> _onComposeVideo() async {
    await _getCurrentURl();
    final String _url = UiProvider.proGetDownloaderURL(listen: false);
    final bool _isAtHomePage = _url == 'https://m.youtube.com/';

    if (_isAtHomePage == false) {
      final String _title = await controller.getTitle();
      await YoutubeProtocols.composeVideoModel(
        url: _url,
        videoTitle: _title,
      );
    }

  }
  // --------------------
  ///
  Future<void> _copyURL() async {
    await _getCurrentURl();
    final String _url = UiProvider.proGetDownloaderURL(listen: false);
    await TextClipBoard.copy(copy: _url);
  }
  // --------------------
  ///
  Future<void> _copyStreamLink() async {

    blog('Extracting link...');
    final String _url = UiProvider.proGetDownloaderURL(listen: false);
    final String link = await FlutterYoutubeDownloader.extractYoutubeLink(_url, 18);
    await TextClipBoard.copy(copy: link);
    blog('Link copied to clipboard.');

  }
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --------------------
    final double _screenWidth = Scale.screenWidth(context);
    const double _urlBarHeight = 20;
    final double _webviewHeight = Layout.getViewHeight() - Layout.navBarHeight - _urlBarHeight;
    // --------------------
    _getCurrentURl();
    // --------------------
    return SizedBox(
      width: Scale.screenWidth(context),
      height: Layout.getViewHeight(),
      child: Column(
        children: <Widget>[

          /// URL LINE
          Container(
            width: Scale.screenWidth(context),
            height: _urlBarHeight,
            color: AboTubeTheme.greyDark,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Selector(
                key: const ValueKey<String>('DownloaderButton'),
                selector: (_, UiProvider uiProvider) => uiProvider.downloaderURL,
                builder: (_, String currentURL, Widget child) {
                  return SuperText(
                    text: currentURL,
                    textHeight: _urlBarHeight - 2,
                    boxColor: Colorz.white20,
                    margins: const EdgeInsets.symmetric(horizontal: 5),
                  );
                },
              ),
            ),
          ),

          /// DOWNLOADER PANEL
          NavBarBox(
            children: <Widget>[

              /// COPY URL
              DownloaderButton(
                icon: Iconz.flyerCollection,
                text: 'COPY URL',
                onTap: _copyURL,
              ),

              /// DOWNLOAD
              DownloaderButton(
                icon: Iconz.addFlyer,
                text: 'COMPOSE',
                onTap: _onComposeVideo,
              ),

              /// GET STREAM LINK
              DownloaderButton(
                icon: Iconz.play,
                text: 'STREAM LINK',
                onTap: _copyStreamLink,
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
          ),

        ],
        ),

      );
    // --------------------
  }
  // --------------------------------------------------------------------------
}
