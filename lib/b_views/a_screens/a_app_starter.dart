import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:abotube/b_views/a_screens/b_home_screen.dart';
import 'package:abotube/services/navigation/routing.dart';

class AppStarter extends StatefulWidget {
  /// --------------------------------------------------------------------------
  const AppStarter({
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  @override
  State<AppStarter> createState() => _AppStarterState();
  /// --------------------------------------------------------------------------
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  /// --------------------------------------------------------------------------
}

class _AppStarterState extends State<AppStarter> {
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
    super.initState();
  }
  // --------------------
  /*
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
   */
  // --------------------
  @override
  void dispose() {
    // _loading.dispose();
    super.dispose();
  }
  // -----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'AboTube',

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
          selectionHandleColor: Colorz.white255,
          selectionColor: Colorz.white50,
        ),
      ),

      /// ROUTES
      home: const HomeScreen(),
      // navigatorObservers: [],
      // onGenerateInitialRoutes: ,
      // onUnknownRoute: ,
      navigatorKey: AppStarter.navigatorKey,
      onGenerateRoute: Routing.allRoutes,
      initialRoute: Routing.homeRoute,
      routes: Routing.routesMap,
    );

  }
  // -----------------------------------------------------------------------------
}
