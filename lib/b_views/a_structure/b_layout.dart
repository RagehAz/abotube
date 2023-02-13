import 'package:abotube/b_views/x_components/bars/app_bar/abo_tube_app_bar.dart';
import 'package:abotube/b_views/x_components/layout/tabs.dart';
import 'package:abotube/providers/ui_provider.dart';
import 'package:abotube/services/helpers/helper_methods.dart';
import 'package:abotube/services/navigation/navigators.dart';
import 'package:abotube/services/theme/abo_tube_colors.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:flutter/material.dart';
import 'package:scale/scale.dart';

class Layout extends StatefulWidget {
  /// --------------------------------------------------------------------------
  const Layout({
    // @required this.viewWidget,
    this.canGoBack = false,
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  // final Widget viewWidget;
  final bool canGoBack;
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
  @override
  State<Layout> createState() => _LayoutState();
  // -----------------------------------------------------------------------------
}

class _LayoutState extends State<Layout> with TickerProviderStateMixin{

  TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(
        length: AboTubeTabs.allTabs.length,
        vsync: this,
    );

    _controller.addListener(() {

      UiProvider.proSetCurrentTab(
          tab: AboTubeTabs.getTabByIndex(index: _controller.index),
          notify: true,
      );

    });

  }
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

      if (widget.canGoBack == true){
        await Nav.goBack(
          context: context,
          invoker: 'MainLayout._onBack',
        );
      }

    // }

  }
  // -----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

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
          backgroundColor: AboTubeTheme.blackLight,

            bottomNavigationBar: Material(
              child: DecoratedTabBar(
                tabBar: TabBar(
                  isScrollable: true,
                  physics: const BouncingScrollPhysics(),

                  /// DIVIDER
                  // dividerColor: AboTubeTheme.youtubeColor,
                  indicatorColor: AboTubeTheme.youtubeColor,

                  padding: EdgeInsets.zero,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 10),

                  tabs: AboTubeTabs.allTabs,
                  controller: _controller,
                  labelColor: Colorz.white255,
                  unselectedLabelColor: Colorz.white80,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AboTubeTheme.greyLight,
                      width: AboTubeAppBar.lineThickness,
                    ),
                  ),
                ),
              ),
            ),

          body: TabBarView(
            physics: const BouncingScrollPhysics(),
            controller: _controller,
            children: AboTubeTabs.allViews,
          ),

        ),
      ),
    );

  }
  // -----------------------------------------------------------------------------
}

class DecoratedTabBar extends StatelessWidget implements PreferredSizeWidget {

  const DecoratedTabBar({
    @required this.tabBar,
    @required this.decoration,
    Key key,
  }) : super(key: key);

  final TabBar tabBar;
  final BoxDecoration decoration;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Container(decoration: decoration)),
        tabBar,
      ],
    );

  }
}
