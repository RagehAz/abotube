import 'dart:io';

import 'package:abotube/a_models/caption_model.dart';
import 'package:abotube/a_models/translation_progress_model.dart';
import 'package:abotube/a_models/video_model.dart';
import 'package:abotube/b_views/x_components/buttons/progress_button.dart';
import 'package:abotube/b_views/x_components/dialogs/language_selector_dialog.dart';
import 'package:abotube/b_views/x_components/layout/scroller.dart';
import 'package:abotube/b_views/x_components/super_video_player/super_video_player.dart';
import 'package:abotube/services/protocols/transcription_protocols.dart';
import 'package:abotube/services/protocols/video_protocols.dart';
import 'package:abotube/services/providers/ui_provider.dart';
import 'package:abotube/services/theme/abo_tube_colors.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:bubbles/bubbles.dart';
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:mapper/mapper.dart';
import 'package:stringer/stringer.dart';
import 'package:super_box/super_box.dart';
import 'package:super_text/super_text.dart';

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
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // --------------------
  File _videoFile;
  VideoModel _videoModel;
  List<CaptionModel> _captions = [];
  String _langCode;
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
  TranslationProgressModel _progress = const TranslationProgressModel();
  // --------------------
  void _setProgress({
    @required TranslationProgressModel newModel,
    Function executeThis,
  }){

    if (_progress != newModel){
      setState(() {
        _progress = newModel;
        if (executeThis != null){
          executeThis();
        }
      });
    }

  }
  // -----------------------------------------------------------------------------
  final TextEditingController _textController = TextEditingController();
  // -----------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    _videoModel = UiProvider.proGetCurrentDraft();
  }
  // --------------------
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit && mounted) {

      _triggerLoading(setTo: true).then((_) async {

        final File _file = await VideoProtocols.getVideoFileFromDownloads(
          videoID: _videoModel.id,
        );

        setState(() {
          _videoFile = _file;
        });

        await _triggerLoading(setTo: false);
      });

      _isInit = false;
    }
    super.didChangeDependencies();
  }
  // --------------------
  @override
  void dispose() {
    // _loading.dispose();
    _textController.dispose();
    super.dispose();
  }
  // --------------------
  /*
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
   */
  // --------------------
  /// TESTED : WORKS PERFECT
  Future<void> _translateVideo() async {

    final bool _go = await _selectLanguage();

    if (_go == true){

      /// START LOADING
      await _triggerLoading(setTo: true);

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
      await _triggerLoading(setTo: false);

    }

  }
  // --------------------
  /// TASK : TEST ME
  Future<bool> _selectLanguage() async {

    final String _lang = await showLanguageDialog();

    if (_lang == null){
      setState(() {
        _langCode = null;
      });
      return false;
    }

    else {
      setState(() {
        _langCode = _lang;
      });
      return true;
    }

  }
  // --------------------
  /// TASK: WRITE MEEEEEEEEE
  Future<void> _separateVideoFromAudio() async {

    /// SET LOADING AND PROGRESS
    setState(() {
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

    await _triggerLoading(setTo: false);
  }
  // --------------------
  /// TASK : TEST ME
  Future<void> _getTranscript() async {

    /// SET LOADING AND PROGRESS
    setState(() {
      _progress = _progress.copyWith(
        getTranscript: ProgressStatus.processing,
      );
    });

    final String _transcription = await YouTubeCaptionProtocols.readCheckSubTranscription(
      videoID: _videoModel?.id,
      langCode: _langCode,
    );

    /// SET LOADING AND PROGRESS
    if (_transcription == null) {
      _setProgress(
        newModel: _progress.copyWith(getTranscript: ProgressStatus.error),
        executeThis: () {
          _captions = [];
        },
      );
    }

    else {
      _setProgress(
        newModel: _progress.copyWith(getTranscript: ProgressStatus.done,),
        executeThis: () {
          _captions = <CaptionModel>[CaptionModel(text: _transcription, second: 0,),];
        },
      );
    }

  }
  // --------------------
  /// TASK: WRITE MEEEEEEEEE
  Future<void> _getTranslation() async {

    /// SET LOADING AND PROGRESS
    setState(() {
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
  /// TASK: WRITE MEEEEEEEEE
  Future<void> _getAiGeneratedSpeech() async {

    /// SET LOADING AND PROGRESS
    setState(() {
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
  /// TASK: WRITE MEEEEEEEEE
  Future<void> _getCombinedVideo() async {

    /// SET LOADING AND PROGRESS
    setState(() {
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
  // --------------------
  /*
  /// TESTED : WORKS PERFECT
  Future<void> _onPickVideoFromGallery() async {

    setState(() {
      _videoFile = null;
    });

    final File _file = await VideoProtocols.pickGalleryVideo();

    if (_file != null) {
      setState(() {
        _videoFile = _file;
      });
    }

  }
   */
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --------------------
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20),
        children: <Widget>[

          /// VIDEO
          SuperVideoPlayer(
            width: Bubble.bubbleWidth(context: context),
            file: _videoFile,
            // autoPlay: false,
          ),

          Align(
            alignment: Alignment.centerRight,
            child: SuperBox(
              height: 50,
              width: 150,
              textItalic: true,
              text: 'Translate',
              textFont: BldrsThemeFonts.fontBldrsHeadlineFont,
              color: AboTubeTheme.youtubeColor,
              textColor: Colorz.white200,
              margins: 10,
              onTap: _translateVideo,
            ),
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

          /// CAPTIONS
          Bubble(
            bubbleHeaderVM: const BubbleHeaderVM(
              headlineText: 'Captions',
              // headlineHeight: 30,
              font: BldrsThemeFonts.fontBldrsHeadlineFont,
            ),
            columnChildren: <Widget>[

              if (Mapper.checkCanLoopList(_captions) == true)
                Container(
                  width: Bubble.clearWidth(context: context),
                  height: 150,
                  color: AboTubeTheme.greyLight,
                  child: Scroller(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: _captions.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (_, int index) {

                          final CaptionModel _caption = _captions[index];

                          return Container(
                            width: Bubble.clearWidth(context: context),
                            alignment: Alignment.topLeft,
                            color: Colorz.bloodTest,
                            child: SuperText(
                              boxWidth: Bubble.clearWidth(context: context),
                              text: _caption.text,
                              centered: false,
                              textHeight: 20,
                              maxLines: 1000,
                              textDirection: TextDirection.ltr,
                              onTap: () async {
                                await TextClipBoard.copy(copy: _caption.text);
                              },
                            ),
                          );

                        }),
                  ),
                ),

            ],
          ),

          /// PUBLISH BUTTON
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
