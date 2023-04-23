import 'dart:io';
import 'dart:typed_data';

import 'package:abotube/b_views/a_screens/a_main_screen/pages/b_translator_page.dart';
import 'package:abotube/b_views/x_components/cards/draft_video_card/video_info_line.dart';
import 'package:abotube/b_views/x_components/dialogs/language_selector_dialog.dart';
import 'package:abotube/services/protocols/audio_protocols.dart';
import 'package:abotube/services/protocols/google_auth_protocols.dart';
import 'package:abotube/services/protocols/google_voices_map.dart';
import 'package:abotube/services/theme/abo_tube_colors.dart';
import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:bubbles/bubbles.dart';
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/texttospeech/v1.dart';
import 'package:googleapis_auth/googleapis_auth.dart' as gapis;
import 'package:layouts/layouts.dart';
import 'package:ldb/ldb.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:scale/scale.dart';
import 'package:stringer/stringer.dart';
import 'package:super_box/super_box.dart';
class SpeechScreen extends StatefulWidget {
  /// --------------------------------------------------------------------------
  const SpeechScreen({
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  @override
  _SpeechScreenState createState() => _SpeechScreenState();
  /// --------------------------------------------------------------------------
}

class _SpeechScreenState extends State<SpeechScreen> {
  // -----------------------------------------------------------------------------
  final TextEditingController _textController = TextEditingController();
  String _selectedVoiceID;
  String _toLang = 'ar';
  File _translatedVoiceFile;
  File _currentFile;
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
  // --------------------
  Future<void> _onPaste() async {

    /// PASTE TEXT
    final String value = await TextClipBoard.paste();
    setState(() {
      _textController.text = value;
    });

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  Future<void> _onChangeVoice() async {

    final String _voice = await GoogleVoice.showVoiceDialog(
      langCode: _toLang,
      selectedCode: _selectedVoiceID,
    );

    if (_voice != null){
      setState(() {
        _selectedVoiceID = _voice;
      });
    }

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  bool _isPlaying = false;
  Future<void> _onPlayVoice() async {

    if (_currentFile != null){

      if (_isPlaying == true) {
        setState(() {
        _isPlaying = false;
      });
        await AudioProtocols.stopPlaying();
      }

      else {
        setState(() {
        _isPlaying = true;
      });
        await AudioProtocols.playFile(
          filePath: _currentFile.path,
        );
      }


    }

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  Future<void> _getAiGeneratedSpeech() async {

    File _newVoiceFile;

    if (_selectedVoiceID != null){

      final gapis.AuthClient client = await GoogleAuthProtocols.signIn(
        scopes: ['email', TexttospeechApi.cloudPlatformScope],
      );

      _newVoiceFile = await AudioProtocols.createVoiceFile(
          videoID: 'xyz',
          text: _textController.text,
          voiceID: _selectedVoiceID,
          client: client
      );

    }

    if (_newVoiceFile != null){

      setState(() {
          _translatedVoiceFile = _newVoiceFile;
          _currentFile = _translatedVoiceFile;
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
  @override
  Widget build(BuildContext context) {

    final double _bubbleWidth = Bubble.bubbleWidth(
      context: context,
    );

    return BasicLayout(
      body: Container(
        color: Colorz.black255,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[

            /// SPEECH BUBBLE
            Bubble(
              bubbleHeaderVM: getAboTubeBubbleHeader(
                headline: 'Speech',
              ),
              columnChildren: <Widget>[
                Row(
                  children: <Widget>[

                    /// VOICE
                    SuperBox(
                      height: 50,
                      text: 'Voice : $_selectedVoiceID',
                      textScaleFactor: 0.7,
                      onTap: _onChangeVoice,
                    ),

                    /// REGENERATE
                    SuperBox(
                      height: 50,
                      text: 'Gen',
                      textScaleFactor: 0.7,
                      onTap: _getAiGeneratedSpeech,
                    ),

                    const Expander(),

                    /// PLAY
                    SuperBox(
                      height: 50,
                      icon: _isPlaying == true ? Iconz.pause : Iconz.play,
                      iconSizeFactor: 0.7,
                      isDisabled: _currentFile == null,
                      onTap: _onPlayVoice,
                    ),

                  ],
                ),
              ],
            ),

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

            /// TEXT FIELD
            TextFieldBubble(
              // formKey: _formKey,
              isFormField: true,
              bubbleHeaderVM: const BubbleHeaderVM(
                font: BldrsThemeFonts.fontBldrsHeadlineFont,
                headlineText: 'Script',
              ),
              bubbleWidth: _bubbleWidth,
              pasteFunction: _onPaste,
              hintText: 'Script',
              textController: _textController,
              fieldTextFont: BldrsThemeFonts.fontBldrsBodyFont,
              maxLines: 100,
              keyboardTextInputAction: TextInputAction.newline,
              keyboardTextInputType: TextInputType.multiline,
              fieldTextDirection: TextDirection.rtl,

            ),

            /// SAVE FILE
            SuperBox(
              height: 50,
              textItalic: true,
              text: 'SAVE FILE',
              textScaleFactor: 0.8,
              textFont: BldrsThemeFonts.fontBldrsHeadlineFont,
              color: AboTubeTheme.greyMid,
              textColor: Colorz.white200,
              isDisabled: _translatedVoiceFile == null,
              onTap: () async {

                const String _videoID = 'xxx';

                final String _fileName = AudioProtocols.generateTranslatedVoiceFileName(
                  videoID: _videoID,
                  voiceID: _selectedVoiceID,
                );

                final Uint8List bytes = await Floaters.getUint8ListFromFile(_translatedVoiceFile);
                final List<int> _ints = Floaters.getIntsFromUint8List(bytes);

                await LDBOps.insertMap(
                    docName: 'records',
                    primaryKey: 'id',
                    input: {
                      'id': _fileName,
                      'path': _translatedVoiceFile.path,
                      'ints': _ints,
                    },
                );

                setState(() {

                });

              },
            ),

            FutureBuilder(
              future: LDBOps.readAllMaps(docName: 'records'),
              builder: (_, AsyncSnapshot snap) {

                final List<Map<String, dynamic>> _maps = snap.data;

                return ListView.builder(
                    itemCount: _maps?.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: (_, int index){

                      final Map<String, dynamic> _map = _maps[index];

                        return VideoInfoLine(
                          width: Bubble.clearWidth(context: context),
                          title: 'Record ${_map['id']}',
                          text: _map['path'],
                          onTap: () async {

                            setState(() {
                              _currentFile = File(_map['path']);
                            });

                            await _onPlayVoice();

                          },
                        );
                      }
                );
              }
            ),

            /// SEND
            SuperBox(
              height: 80,
              width: 300,
              textItalic: true,
              text: 'SEND : ${_currentFile?.path}',
              textMaxLines: 3,
              textScaleFactor: 0.4,
              textFont: BldrsThemeFonts.fontBldrsHeadlineFont,
              color: AboTubeTheme.youtubeColor,
              textColor: Colorz.white200,
              isDisabled: _currentFile == null,
              onTap: () async {

                await sendEmailWithMP3(
                  _currentFile
                );

              },
            ),

          ],
        ),
      ),
    );

  }
  // --------------------------------------------------------------------------
}
/*


في هذا الفيلم نتعرف على توني ستارك رجل الأعمال الذي يمتلك شركة أسلحة كبيرة. يتعرض توني للهجوم من قبل مجموعة مسلحة مما يؤدي إلى إصابته بجروح خطيرة.
يتم اختطافه وتحويله إلى أسير حيث يعلم أن المسلحين يستخدمون أسلحة تحمل اسم شركته.
وفي محاولة للهرب، يتمكن ستارك من تصميم بدلة حديدية تساعده على الهروب.
ثم يعود إلى معمله للعمل على تطويرها ليلاً ونهارًا، ليتمكن من الرجوع إليهم والانتقام منهم واحدًا تلو الآخر.
ثم تتوالى الأحداث في الفيلم حيث يعود ستارك إلى معمله مجددًا. وفي لحظة مفاجأة يقوم شريكه بسرقة مفاعل الطاقة الذي يمد البدلة الحديدية بالطاقة والمسؤول عن الحفاظ على دقات قلبه.
يتصاعد الصراع بين ستارك وشريكه في مصنعهما ويتبادلان الضربات باستخدام البدلات الحديدية حيث ينتصر ستارك في النهاية.
وعندما سأله الصحفيون عن هوية الشخص وراء البدلة الحديدية، يقوم بالإعلان عن نفسه بأنه الرجل الحديدي.

 */



const String appSpecificGmailPassword = 'jmvpmxjqhyomekcv';
const String fromEmail = 'rageh.az@gmail.com';
const String toEmail = 'rageh-@hotmail.com';
const String oAuthToken = '';

Future<void> sendEmailWithMP3(File file) async {
  // Read the file as a Uint8List.
 final Uint8List uint8list = await file.readAsBytes();

  // Create an MP3 file from the Uint8List.
  final mp3File = File('${file.path}.mp3');
  await mp3File.writeAsBytes(uint8list);

  // Configure the SMTP server for the email.
  final smtpServer = SmtpServer('smtp.gmail.com',
      username: fromEmail,
      password: appSpecificGmailPassword,
      port: 465,
      ssl: true,
      xoauth2Token: 'your-oauth2-token',
      // allowInsecure: false,
      // ignoreBadCertificate: false,
      name: 'Rageh from Abotube'
  );

  // Create the email message.
  final message = Message()
    ..from = const Address(fromEmail)
    ..recipients.add(toEmail)
    ..subject = 'MP3 File'
    ..attachments.add(FileAttachment(mp3File));

  try {
    // Send the email using the SMTP server.
    await send(message, smtpServer);
    blog('Email sent successfully');
  } on MailerException catch (e) {
    blog('Failed to send email. $e');
  }
}

/*
To obtain an OAuth2 token for your Gmail account, you can follow these steps:

Go to the Google Developers Console and create a new project.

Once you've created a new project, go to the Credentials page, then click on the Create credentials button and select OAuth client ID.

Select the application type that best matches your use case.
For example, if you're developing a desktop application, you can select Desktop app.

Follow the prompts to configure your OAuth consent screen, then click on the Create button.

On the next screen, you'll see your client ID and client secret.
 You'll need these to authenticate with the Gmail API.

Now, you'll need to get an authorization code by prompting the user
 to grant access to your app. You can do this by directing the user to a URL that looks something like this:

makefile
Copy code
https://accounts.google.com/o/oauth2/v2/auth?
scope=https://www.googleapis.com/auth/gmail.send&
response_type=code&
redirect_uri=urn:ietf:wg:oauth:2.0:oob&
client_id=your-client-id
Replace your-client-id with the client ID you obtained in step 5.

When the user visits this URL, they'll be prompted to grant access to your app. If they grant access, they'll be redirected to a page with an authorization code.

Exchange the authorization code for an access token and a refresh token. You can do this by making a POST request to the following URL:

bash
Copy code
https://www.googleapis.com/oauth2/v4/token
Include the following parameters in the request body:

makefile
Copy code
code=your-authorization-code
client_id=your-client-id
client_secret=your-client-secret
redirect_uri=urn:ietf:wg:oauth:2.0:oob
grant_type=authorization_code
Replace your-authorization-code, your-client-id, and your-client-secret with the values you obtained in steps 6 and 5, respectively.

The response to the POST request will include an access token and a refresh token. You can use the access token to authenticate with the Gmail API, and you can use the refresh token to obtain a new access token when the current one expires.

Once you have the access token, you can use it as the xoauth2Token parameter when configuring the SMTP server in your code.
 */
