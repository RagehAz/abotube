import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:filers/filers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis_auth/googleapis_auth.dart' as gapis;

class GoogleAuthProtocols {
  // --------------------
  GoogleAuthProtocols.singleton();
  static final GoogleAuthProtocols _singleton = GoogleAuthProtocols.singleton();
  static GoogleAuthProtocols get instance => _singleton;
  // -----------------------------------------------------------------------------

  /// AUDIO PLAYER SINGLETON

  // --------------------
  GoogleSignIn _googleSignIn;
  GoogleSignIn get googleSignIn => _googleSignIn ??= GoogleSignIn();
  static GoogleSignIn getGoogleSignIn() => GoogleAuthProtocols.instance.googleSignIn;
  // -----------------------------------------------------------------------------

  /// TEXT TO SPEECH

  // --------------------
  ///
  static Future<gapis.AuthClient> signIn({
    List<String> scopes,
    // String clientID,
  }) async {
    gapis.AuthClient client;

    final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: scopes,
      // clientId: clientID,
      // forceCodeForRefreshToken: ,
      // hostedDomain: ,
      // serverClientId: ,
      // signInOption: ,
    );

    await tryAndCatch(
      invoker: 'googleSignIn',
        functions: () async {

          await _googleSignIn.signIn();

          client = await _googleSignIn.authenticatedClient();

        },
    );

    return client;
  }
  // -----------------------------------------------------------------------------
}
