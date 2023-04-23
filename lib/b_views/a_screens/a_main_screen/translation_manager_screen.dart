import 'package:abotube/a_models/caption_model.dart';
import 'package:abotube/b_views/a_screens/a_main_screen/pages/b_translator_page.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:layouts/layouts.dart';
import 'package:scale/scale.dart';

class TranslationManagerScreen extends StatefulWidget {
  /// --------------------------------------------------------------------------
  const TranslationManagerScreen({
    @required this.captions,
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  final List<CaptionModel> captions;
  /// --------------------------------------------------------------------------
  @override
  _TranslationManagerScreenState createState() => _TranslationManagerScreenState();
  /// --------------------------------------------------------------------------
}

class _TranslationManagerScreenState extends State<TranslationManagerScreen> {
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
    if (_isInit && mounted) {

      _triggerLoading(setTo: true).then((_) async {

        /// FUCK

        await _triggerLoading(setTo: false);
      });

      _isInit = false;
    }
    super.didChangeDependencies();
  }
  // --------------------
  @override
  void dispose() {
    _loading.dispose();
    super.dispose();
  }
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --------------------
    return BasicLayout(
      body: Container(
        width: Scale.screenWidth(context),
        height: Scale.screenHeight(context),
        color: Colorz.bloodTest,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: widget.captions.length,
            padding: EdgeInsets.zero,
            itemBuilder: (_, int index) {
              return CaptionLine(
                caption: widget.captions[index],
                numberOfCaptions: widget.captions.length,
              );
            }),
      ),
    );
    // --------------------
  }
  // --------------------------------------------------------------------------
}
