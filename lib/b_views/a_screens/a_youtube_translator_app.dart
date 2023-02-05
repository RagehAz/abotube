import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/youtube/v3.dart' as yt;
import 'package:super_box/super_box.dart';
import 'package:super_image/helpers/helpers.dart';
import 'package:video_translator/b_views/a_screens/b_home_screen.dart';
import 'package:video_translator/services/navigation/routing.dart';

class YouTubeTranslatorApp extends StatefulWidget {
  /// --------------------------------------------------------------------------
  const YouTubeTranslatorApp({Key key}) : super(key: key);

  /// --------------------------------------------------------------------------
  @override
  State<YouTubeTranslatorApp> createState() => _YouTubeTranslatorAppState();

  /// --------------------------------------------------------------------------
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  /// --------------------------------------------------------------------------
}

class _YouTubeTranslatorAppState extends State<YouTubeTranslatorApp> {
  // -----------------------------------------------------------------------------
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
  // -----------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
  }
  // --------------------
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      _triggerLoading(setTo: true).then((_) async {
        /// END
        await _triggerLoading(setTo: false);
      });
    }

    _isInit = false;
    super.didChangeDependencies();
  }
  // --------------------
  @override
  void dispose() {
    _loading.dispose();
    super.dispose();
  }
  // -----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Youtube Translator',

      /// DEBUG
      debugShowCheckedModeBanner: false,
      // debugShowMaterialGrid: false,
      // showPerformanceOverlay: false,
      // checkerboardRasterCacheImages: false,
      // showSemanticsDebugger: ,
      // checkerboardOffscreenLayers: ,

      /// THEME
      theme: ThemeData(
        canvasColor: Colorz.nothing,
        primarySwatch: const MaterialColor(0xFF13244b, {
          50: Color(0xFF13244b),
          100: Color(0xFF13244b),
          200: Color(0xFF13244b),
          300: Color(0xFF13244b),
          400: Color(0xFF13244b),
          500: Color(0xFF13244b),
          600: Color(0xFF13244b),
          700: Color(0xFF13244b),
          800: Color(0xFF13244b),
          900: Color(0xFF13244b),
        }),
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Colorz.yellow255,
          selectionColor: Colorz.white50,
        ),
      ),

      /// ROUTES
      home: const HomeScreen(),
      // navigatorObservers: [],
      // onGenerateInitialRoutes: ,
      // onUnknownRoute: ,
      navigatorKey: YouTubeTranslatorApp.navigatorKey,
      onGenerateRoute: Routing.allRoutes,
      initialRoute: Routing.homeRoute,
      routes: Routing.routesMap,

      builder: (context, child) {

        return Stack(

          children: [
            child,
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () async {
                  final _googleSignIn = GoogleSignIn(
                    scopes: [
                      'email',
                      'https://www.googleapis.com/auth/youtube.force-ssl',
                      'https://www.googleapis.com/auth/youtubepartner'
                    ],
                  );
                  try {
                    await _googleSignIn.signIn();
                  } catch (error) {
                    print(error);
                  }
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SuperBox(
                height: 100,
                width: 100,
                color: Colors.green,
                onTap: () async {
                  final _googleSignIn = GoogleSignIn(
                    scopes: [
                      'email',
                      yt.YouTubeApi.youtubeForceSslScope,
                      yt.YouTubeApi.youtubepartnerScope
                    ],
                  );
                  await _googleSignIn.signIn();
                  final client = await _googleSignIn.authenticatedClient();
                  // get captions using youtube api
                  final yt.YouTubeApi ytApi = yt.YouTubeApi(client);
                  final captionListResponse =
                      await ytApi.captions.list(['id','snippet'], 'QRS8MkLhQmM');
                  print(captionListResponse.items.first.snippet);

                  // {etag: Nw8zsyeakXPebhD7p_lco001UFY, id: AUieDaZJvCxYN_YF11eqr6XSB3OMpoQa7E9sTBliDb_p6472IBA, kind: youtube#caption}

                  final caption = await ytApi.captions.download(
                    captionListResponse.items.first.id,
                  );
                  print(caption);
                },
              ),
            )
          ],

        );
      },
    );
  }
  // -----------------------------------------------------------------------------
}
