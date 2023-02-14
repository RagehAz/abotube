import 'dart:io';

import 'package:abotube/a_models/translation_progress_model.dart';
import 'package:abotube/b_views/x_components/buttons/progress_button.dart';
import 'package:abotube/b_views/x_components/cards/video_card.dart';
import 'package:abotube/services/helpers/former.dart';
import 'package:abotube/services/theme/abo_tube_colors.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:bubbles/bubbles.dart';
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:stringer/stringer.dart';
import 'package:super_box/super_box.dart';

class TranslatorPage extends StatefulWidget {
  /// --------------------------------------------------------------------------
  const TranslatorPage({
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  @override
  _TranslatorPageState createState() => _TranslatorPageState();
  /// --------------------------------------------------------------------------
}

class _TranslatorPageState extends State<TranslatorPage> {
  // -----------------------------------------------------------------------------
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // --------------------
  File _videoFile;
  // -----------------------------------------------------------------------------
  bool _loading = false;
  // --------------------
  void _setLoading({
    @required bool setTo,
  }){

    if (_loading != setTo){
      setState(() {
        _loading = setTo;
      });
    }

  }
  // -----------------------------------------------------------------------------
  TranslationProgressModel _progress = const TranslationProgressModel();
  // --------------------
  void _setProgress({
    @required TranslationProgressModel newModel,
  }){

    if (_progress != newModel){
      setState(() {
        _progress = newModel;
      });
    }

  }
  // -----------------------------------------------------------------------------
  final TextEditingController _textController = TextEditingController();
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
    _textController.dispose();
    super.dispose();
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  Future<void> _onPaste() async {

    /// PASTE TEXT
    final String value = await TextClipBoard.paste();
    _textController.text = value;

    final bool _isValid = Formers.validateForm(_formKey);

    if (_isValid == true){

      await _processVideo();

    }

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  Future<void> _processVideo() async {

        /// START LOADING
    _setLoading(setTo: true);

    /// 1 - SEPARATE
    await _separateVideoFromAudio();

    /// 2 - GET TRANSCRIPT
    await _getTranscript();

    /// 3 - TRANSLATE
    await _getTranslation();

    /// 4 - GENERATE SPEECH
    await _getAiGeneratedSpeech();

    /// 5 - COMBINE
    await _getCombinedVideo();

    /// END LOADING
    _setLoading(setTo: false);

  }
  // --------------------
  /// TASK: WRITE ME
  Future<void> _separateVideoFromAudio() async {

    /// SET LOADING AND PROGRESS
    setState(() {
      _loading = true;
      _progress = _progress.copyWith(
        separating: ProgressStatus.processing,
      );
    });

    /// DO MAGIC
    await Future.delayed(const Duration(seconds: 1), (){});

    /// SET LOADING AND PROGRESS
    _setProgress(
        newModel: _progress.copyWith(
        separating: ProgressStatus.done,
      )
    );

  }
  // --------------------
  /// TASK : WRITE ME
  Future<void> _getTranscript() async {

    /// SET LOADING AND PROGRESS
    setState(() {
      _loading = true;
      _progress = _progress.copyWith(
        getTranscript: ProgressStatus.processing,
      );
    });

    /// DO MAGIC
    await Future.delayed(const Duration(seconds: 1), (){});

    /// SET LOADING AND PROGRESS
    _setProgress(
        newModel: _progress.copyWith(
        getTranscript: ProgressStatus.done,
      )
    );

  }
  // --------------------
  /// TASK : WRITE ME
  Future<void> _getTranslation() async {

    /// SET LOADING AND PROGRESS
    setState(() {
      _loading = true;
      _progress = _progress.copyWith(
        translation: ProgressStatus.processing,
      );
    });

    /// DO MAGIC
    await Future.delayed(const Duration(seconds: 1), (){});

    /// SET LOADING AND PROGRESS
    _setProgress(
        newModel: _progress.copyWith(
        translation: ProgressStatus.done,
      )
    );

  }
  // --------------------
  /// TASK : WRITE ME
  Future<void> _getAiGeneratedSpeech() async {

    /// SET LOADING AND PROGRESS
    setState(() {
      _loading = true;
      _progress = _progress.copyWith(
        voiceGenerated: ProgressStatus.processing,
      );
    });

    /// DO MAGIC
    await Future.delayed(const Duration(seconds: 1), (){});

    /// SET LOADING AND PROGRESS
    _setProgress(
        newModel: _progress.copyWith(
        voiceGenerated: ProgressStatus.error,
      )
    );

  }
  // --------------------
  /// TASK : WRITE ME
  Future<void> _getCombinedVideo() async {

    /// SET LOADING AND PROGRESS
    setState(() {
      _loading = true;
      _progress = _progress.copyWith(
        combined: ProgressStatus.processing,
      );
    });

    /// DO MAGIC
    await Future.delayed(const Duration(seconds: 1), (){});

    /// SET LOADING AND PROGRESS
    _setProgress(
        newModel: _progress.copyWith(
        combined: ProgressStatus.done,
      )
    );

  }
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --------------------
    final double _bubbleWidth = Bubble.bubbleWidth(context: context);
    // --------------------
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20),
        children: <Widget>[

          /// TEXT FIELD
          Form(
            key: _formKey,
            child: TextFieldBubble(
              formKey: _formKey,
              isFormField: true,
              bubbleHeaderVM: const BubbleHeaderVM(
                font: BldrsThemeFonts.fontBldrsHeadlineFont,
                headlineText: 'Youtube URL',
              ),
              bubbleWidth: _bubbleWidth,
              pasteFunction: _onPaste,
              hintText: 'https://www.youtube.com/watch?v=5UTmN8jPJS0',
              textController: _textController,
              validator: (String text) => Formers.webSiteValidator(
                context: context,
                website: _textController.text,
              ),
              fieldTextFont: BldrsThemeFonts.fontBldrsBodyFont,
            ),
          ),

          /// SPACER
          const SizedBox(
            width: 10,
            height: 50,
          ),

          /// 1- SEPARATED
          ProgressButton(
            text: 'Separated Video from Original Audio',
            status: _progress.separating,
            onTap: () => blog('separation : fuck you'),
          ),

          /// 2- GOT TRANSCRIPT
          ProgressButton(
            text: 'Got transcript',
            status: _progress.getTranscript,
            onTap: () => blog('transcript : fuck you'),
          ),

          /// 3- Translation Done
          ProgressButton(
            text: 'Translation Done',
            status: _progress.translation,
            onTap: () => blog('translation : fuck you'),
          ),

          /// 4 - Speech Generated
          ProgressButton(
            text: 'Ai Speech Audio generated',
            status: _progress.voiceGenerated,
            onTap: () => blog('speech : fuck you'),
          ),

          /// 5 - Combined new Video
          ProgressButton(
            text: 'Combined new Audio with Original Video',
            status: _progress.combined,
            onTap: () => blog('combine : fuck you'),
          ),

          /// VIDEO
          VideoCard(
            headline: 'New Video',
            loading: _loading,
            url: 'https://rr5---sn-uxaxjvhxbt2u-j5pl6.googlevideo.com/videoplayback?expire=1676440323&ei=ox7sY8z4FYSz0wWw94vwCg&ip=156.213.106.139&id=o-AEkoKOIbu3ab2rJPW-Y3fK_OAqYm4oEwVXCUD04yvO2k&itag=18&source=youtube&requiressl=yes&mh=d7&mm=31%2C29&mn=sn-uxaxjvhxbt2u-j5pl6%2Csn-hgn7rn7k&ms=au%2Crdu&mv=m&mvi=5&pl=23&initcwndbps=706250&vprv=1&mime=video%2Fmp4&ns=zS394KhvPqVAoSd3C47kjwML&cnr=14&ratebypass=yes&dur=393.090&lmt=1665465590358048&mt=1676418292&fvip=4&fexp=24007246&c=WEB&txp=5438434&n=iVR1kAwOocbr9Xhici&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIgCwcGsyQ3-VUNBEQrZw8WuPDKGx4EMFAtuC2sUCyHkLsCIQCH7l8PTjvjN3NaoK7NCrg1ewfC7nORyO-7_CSwqDulcQ%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIgcTEU71RZYNla-45TRasO42VnC4p-BKbMUu3h3cKGwkICIQDUPo3pcTmWdOE3LThkKQOvB_wtkIhB6_YLG13e_PaRKw%3D%3D',
          ),

          const Align(
            alignment: Alignment.centerRight,
            child: SuperBox(
              height: 50,
              width: 150,
              textItalic: true,
              text: 'Publish',
              textFont: BldrsThemeFonts.fontBldrsHeadlineFont,
              color: AboTubeTheme.youtubeColor,
              textColor: Colorz.white200,
              margins: 10,
              isDisabled: true,
            ),
          ),

        ],
      );
    // --------------------
  }
  // --------------------------------------------------------------------------
}
