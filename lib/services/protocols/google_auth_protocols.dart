import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
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
    final _googleSignIn = GoogleSignIn(
      scopes: scopes,
      // clientId: clientID,
      // forceCodeForRefreshToken: ,
      // hostedDomain: ,
      // serverClientId: ,
      // signInOption: ,
    );

    await _googleSignIn.signIn();

    final gapis.AuthClient client = await _googleSignIn.authenticatedClient();

    return client;
  }
  // -----------------------------------------------------------------------------
}
