import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stc_training/features/authentication/state/models/auth_results.dart';
import 'package:stc_training/features/authentication/typedefs/user_id.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/helper/methods.dart';

class Authenticator {
  User? get currentUser => FirebaseAuth.instance.currentUser;
  UserId? get userId => currentUser?.uid;
  bool get isAlreadyLoggedIn => userId != null;
  String get displayName => currentUser?.displayName ?? '';
  String? get email => currentUser?.email;

  FirebaseAuth get firebaseInstance => FirebaseAuth.instance;

  //Todo: Implement the logout functionality
  Future<void> logOut() async {
    //Todo: Logout from firebase
    await firebaseInstance.signOut();
    //Todo: Logout form google
    await GoogleSignIn().signOut();
    //Todo: Logout from facebook
  }

  //Todo: Facebook login

  //Todo: login with google
  Future<AuthResult> loginWithGoogle() async {
    //Todo: initialize the google sign in
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
      AppConstants.emailScope,
    ]);
    //Todo: Start the proccess of sign in
    //? This will display the google sign in dialog to the user
    try {
      final signInAccount = await googleSignIn.signIn();
      //Todo: if the result is null, this mean the user is aborted the sign in.
      if (signInAccount == null) {
        return AuthResult.aborted;
      }

      final googleAuth = await signInAccount.authentication;
      LOG_THE_DEBUG_DATA(messag: signInAccount);
      LOG_THE_DEBUG_DATA(messag: googleAuth, type: 'd');
    } catch (e) {
      LOG_THE_DEBUG_DATA(messag: e, type: 'e');
    }
    //Todo: Get the user credentail
    // final oAuthCrendential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth.accessToken,
    //   idToken: googleAuth.idToken,
    // );
    // //////////////////////////////////////////////
    // //TODO: Sign in to firebase with the google
    // //////////////////////////////////////////////
    // try {
    //   await firebaseInstance.signInWithCredential(
    //     oAuthCrendential,
    //   );
    //   return AuthResult.success;
    // } catch (e) {
    //   return AuthResult.failure;
    // }
    return AuthResult.success;
  }
}
