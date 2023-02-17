import 'dart:io';

import 'package:abotube/a_models/caption_model.dart';
import 'package:abotube/a_models/translation_progress_model.dart';
import 'package:abotube/a_models/video_model.dart';
import 'package:abotube/b_views/x_components/buttons/progress_button.dart';
import 'package:abotube/b_views/x_components/dialogs/language_selector_dialog.dart';
import 'package:abotube/b_views/x_components/super_video_player/super_video_player.dart';
import 'package:abotube/services/protocols/caption_protocols.dart';
import 'package:abotube/services/protocols/exploder_protocols.dart';
import 'package:abotube/services/protocols/video_protocols.dart';
import 'package:abotube/services/providers/ui_provider.dart';
import 'package:abotube/services/theme/abo_tube_colors.dart';
import 'package:animators/animators.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:bubbles/bubbles.dart';
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:mapper/mapper.dart';
import 'package:scale/scale.dart';
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
  final ScrollController _scrollController = ScrollController();
  // --------------------
  File _videoFile;
  File _translatedVideoFile;
  VideoModel _videoModel;
  List<CaptionModel> _captions = [];
  List<CaptionModel> _translatedCaptions = [];
  String _fromLang = 'en';
  String _toLang = 'ar';
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

        final File _file = await VideoProtocols.getDownloadedVideoFile(
          videoID: _videoModel?.id,
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
    _scrollController.dispose();
    super.dispose();
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  Future<void> _translateVideo() async {

      /// START LOADING
      await _triggerLoading(setTo: true);


      /// GET TRANSCRIPT
      await _getTranscript();

      /// TRANSLATE
      await _getTranslation();

      /// GENERATE SPEECH
      await _getAiGeneratedSpeech();

      /// SEPARATE
      await _separateVideoFromAudio();

      /// COMBINE
      await _getCombinedVideo();

      /// END LOADING
      await _triggerLoading(setTo: false);

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  Future<void> _selectFromLang() async {

    final String _lang = await showLanguageDialog();

    if (_lang != null){
      setState(() {
        _fromLang = _lang;
      });
    }

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  Future<void> _selectToLang() async {

    final String _lang = await showLanguageDialog();

    if (_lang != null){
      setState(() {
        _toLang = _lang;
      });
    }

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  Future<void> _getTranscript() async {

    /// SET LOADING AND PROGRESS
    setState(() {
      _progress = _progress.copyWith(
        getTranscript: ProgressStatus.processing,
      );
    });

    final List<CaptionModel> _caps = await ExploderProtocols.readVideoCaptions(
        videoID: _videoModel?.id,
        langCode: _fromLang,
    );

    blog('got this fucking number of captions here in trans page : ${_caps.length}');

    /// SET LOADING AND PROGRESS
    if (Mapper.checkCanLoopList(_caps) == false) {
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
          _captions = _caps;
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

    final List<CaptionModel> _translated = await YouTubeCaptionProtocols.googleTranslateEachCaptionSeparately(
        originalCaptions: _captions,
        toLang: _toLang,
        fromLang: _fromLang
    );

    if (Mapper.checkCanLoopList(_translated) == true){

      /// SET LOADING AND PROGRESS
      _setProgress(
          newModel: _progress.copyWith(
            translation: ProgressStatus.done,
          ),
        executeThis: (){
            _translatedCaptions = _translated;
        }
      );


    }
    else {
      /// SET LOADING AND PROGRESS
      _setProgress(
          newModel: _progress.copyWith(
            translation: ProgressStatus.error,
          )
      );
    }


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
    await Future.delayed(const Duration(milliseconds: 200), (){});

    /// SET LOADING AND PROGRESS
    _setProgress(
        newModel: _progress.copyWith(
        voiceGenerated: ProgressStatus.done,
      )
    );

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
    await Future.delayed(const Duration(milliseconds: 200), (){});

    /// SET LOADING AND PROGRESS
    _setProgress(
        newModel: _progress.copyWith(
        separating: ProgressStatus.done,
      )
    );

    await _triggerLoading(setTo: false);
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
    await Future.delayed(const Duration(milliseconds: 200), (){});

    /// SET LOADING AND PROGRESS
    _setProgress(
        newModel: _progress.copyWith(
        combined: ProgressStatus.done,
      )
    );

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  Future<void> _onReset() async {

    _setProgress(
      newModel: _progress.copyWith(
        combined: ProgressStatus.non,
        separating: ProgressStatus.non,
        getTranscript: ProgressStatus.non,
        translation: ProgressStatus.non,
        voiceGenerated: ProgressStatus.non,
      ),
      executeThis: (){

        _translatedVideoFile = null;
        _captions = [];

      }
    );

    await Sliders.slideToOffset(
        scrollController: _scrollController,
        offset: 0,
    );

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
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(vertical: 20),
        children: <Widget>[

          /// VIDEO
          SuperVideoPlayer(
            width: Bubble.bubbleWidth(context: context),
            file: _videoFile,
            // autoPlay: false,
          ),

          /// TRANSLATION BUTTONS
          Align(
            child: Container(
              width: Bubble.bubbleWidth(context: context),
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  /// FROM LANG
                  SuperBox(
                  height: 50,
                  textItalic: true,
                  text: 'From : $_fromLang',
                  textScaleFactor: 0.8,
                  textFont: BldrsThemeFonts.fontBldrsHeadlineFont,
                  color: AboTubeTheme.greyLight,
                  textColor: Colorz.white200,
                  onTap: _selectFromLang,
                ),

                  const SizedBox(width: 5),

                  /// FROM LANG
                  SuperBox(
                  height: 50,
                  textItalic: true,
                  text: 'To : $_toLang',
                  textScaleFactor: 0.8,
                  textFont: BldrsThemeFonts.fontBldrsHeadlineFont,
                  color: AboTubeTheme.greyMid,
                  textColor: Colorz.white200,
                  onTap: _selectToLang,
                ),

                  /// EXPANDER
                  const Expander(),

                  /// TRANSLATE BUTTON
                  SuperBox(
                    height: 50,
                    width: 150,
                    textItalic: true,
                    text: 'Translate',
                    textFont: BldrsThemeFonts.fontBldrsHeadlineFont,
                    color: Colorz.green255,
                    textColor: Colorz.white200,
                    isDisabled: _videoFile == null,
                    onTap: _translateVideo,
                  ),


                ],
              ),
            ),
          ),

          /// 2- GOT TRANSCRIPT
          ProgressButton(
            text: 'Got transcript : $_fromLang',
            status: _progress.getTranscript,
            onTap: () => blog('transcript : fuck you'),
          ),

          /// ORIGINAL CAPTIONS
          Bubble(
            bubbleHeaderVM: getAboTubeBubbleHeader(
              headline: 'Captions',
            ),
            columnChildren: <Widget>[

                Container(
                  width: Bubble.clearWidth(context: context),
                  height: 150,
                  color: AboTubeTheme.greyLight,
                  child: Mapper.checkCanLoopList(_captions) == false ? const SizedBox() : Scroller(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: _captions.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (_, int index) {

                          return CaptionLine(
                            caption: _captions[index],
                            numberOfCaptions: _captions.length,
                          );

                        }
                        ),
                  ),
                ),

            ],
          ),

          /// 3- Translation Done
          ProgressButton(
            text: 'Translation Done',
            status: _progress.translation,
            onTap: () => blog('translation : fuck you'),
          ),

          /// TRANSLATED CAPTIONS
          Bubble(
            bubbleHeaderVM: getAboTubeBubbleHeader(
              headline: 'Translation',
            ),
            columnChildren: <Widget>[

                Container(
                  width: Bubble.clearWidth(context: context),
                  height: 150,
                  color: AboTubeTheme.greyLight,
                  child: Mapper.checkCanLoopList(_translatedCaptions) == false ? const SizedBox() :
                  Scroller(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: _translatedCaptions.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (_, int index) {

                          return CaptionLine(
                            caption: _translatedCaptions[index],
                            numberOfCaptions: _translatedCaptions.length,
                          );

                        }
                        ),
                  ),
                ),

            ],
          ),

          /// 4 - Speech Generated
          ProgressButton(
            text: 'Ai Speech Audio generated',
            status: _progress.voiceGenerated,
            onTap: () => blog('speech : fuck you'),
          ),

          /// SPEECH BUBBLE
          Bubble(
            bubbleHeaderVM: getAboTubeBubbleHeader(
              headline: 'Speech',
            ),
            columnChildren: const [],
          ),

          /// 1- SEPARATED
          ProgressButton(
            text: 'Separated Video from Original Audio',
            status: _progress.separating,
            onTap: () => blog('separation : fuck you'),
          ),

          /// 5 - Combined new Video
          ProgressButton(
            text: 'Combined new Audio with Original Video',
            status: _progress.combined,
            onTap: () => blog('combine : fuck you'),
          ),

          /// TRANSLATED VIDEO
          SuperVideoPlayer(
            width: Bubble.bubbleWidth(context: context),
            file: _translatedVideoFile,
            // autoPlay: false,
          ),

          /// PUBLISH BUTTON
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[

              SuperBox(
                height: 50,
                textItalic: true,
                text: 'Reset',
                textFont: BldrsThemeFonts.fontBldrsHeadlineFont,
                color: AboTubeTheme.youtubeColor,
                textColor: Colorz.white200,
                margins: 10,
                onTap: _onReset,
              ),

              const SuperBox(
                height: 50,
                width: 150,
                textItalic: true,
                text: 'Publish',
                textFont: BldrsThemeFonts.fontBldrsHeadlineFont,
                color: Colorz.green255,
                textColor: Colorz.white200,
                margins: 10,
                // isDisabled: true,
              ),

          ],
          ),

        ],
      );
    // --------------------
  }
  // --------------------------------------------------------------------------
}

class CaptionLine extends StatelessWidget {
  // -----------------------------------------------------------------------------
  const CaptionLine({
    @required this.caption,
    @required this.numberOfCaptions,
    Key key
  }) : super(key: key);
  // -----------------------------------------------------------------------------
  final CaptionModel caption;
  final int numberOfCaptions;
  // -----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    final String _captionSecond = caption?.start?.toString();

    final double _clearWidth = Bubble.clearWidth(context: context);
    const double _secondWidth = 50;

    return Container(
      width: _clearWidth,
      alignment: Alignment.topLeft,
      color: Colorz.bloodTest,
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          /// SECOND
          SuperText(
            boxWidth: _secondWidth,
            text: _captionSecond,
            centered: false,
            textHeight: 20,
            textDirection: TextDirection.ltr,
            boxColor: Colorz.black255,
            onTap: () async {
              await TextClipBoard.copy(copy: caption?.text);
            },
          ),

          /// TEXT
          SuperText(
            boxWidth: _clearWidth - _secondWidth,
            text: caption?.text,
            centered: false,
            textHeight: 20,
            maxLines: 1000,
            textDirection: TextDirection.ltr,
            boxColor: Colorz.black255,
            onTap: () async {
              await TextClipBoard.copy(copy: caption?.text);
            },
          ),

        ],
      ),
    );

  }
  // -----------------------------------------------------------------------------
}

BubbleHeaderVM getAboTubeBubbleHeader({
  @required String headline,
}){

  return BubbleHeaderVM(
    headlineText: headline,
    headlineColor: Colorz.white200,
    // headlineHeight: 30,
    font: BldrsThemeFonts.fontBldrsHeadlineFont,
  );

}
