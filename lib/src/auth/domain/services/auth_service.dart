// Dart imports:
// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// Project imports:
import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/exceptions/auth_exception/auth_exception.dart';
import 'package:solid_social/src/app/bootstrap/bootstrap.dart';
import 'package:solid_social/src/auth/domain/entities/solid_social_user/solid_social_user.dart';

abstract class AuthService {
  /// Checks if current user exists in the app. If exists, app should
  /// navigate to the home screen. Else, [Welcome] screen needs to be
  /// displayed.
  Future<SolidSocialUser> persistanceLogin();

  /// Signs user with email and password. Returns the [SolidSocialUser] from the database.
  Future<SolidSocialUser> loginWithEmailAndPassword({required String email, required String password});
  // Future<SolidSocialUser> signUpWithEmailAndPassword

  /// Logs in the user with a phone number. On success, must go to OTP verification screen.
  Future<void> loginWithPhoneNumber(String phoneNumber,
      {required PhoneAuthVerificationCompleted verificationCompleted,
      required PhoneAuthCodeSent codeSent,
      required PhoneAuthRetrievalTimeout codeAutoRetrievalTimeout,
      required PhoneAuthVerificationFailed verificationFailed,
      bool? isRetrying,
      bool? isLinking});

  Future<SolidSocialUser> registerUser(String email, String password,
      {required String firstName, required String lastName, required String phoneNumber});

  /// Verifies a received OTP from Firebase Auth to get user logged in. Returns [SolidSocialUser]
  Future<SolidSocialUser> verifyOtp({
    required String otpCode,
    required String verificationId,
    bool? isLinking,
    SolidSocialUser? user,
  });

  /// Uses Google as Auth provider.
  Future<SolidSocialUser> signInWithGoogle({bool? isFromSignup = false});

  /// Uses Facebook as Auth provider.
  Future<SolidSocialUser> signInWithFacebook({bool? isFromSignup = false});

  /// Uses Apple as Auth provider.
  Future<SolidSocialUser> signInWithApple();

  Future<void> signOut();

  User? get currentUser;
}

typedef PhoneAuthVerificationCompleted = void Function(PhoneAuthCredential credentials);
typedef PhoneAuthVerificationFailed = void Function(FirebaseAuthException error);
typedef PhoneAuthCodeSent = void Function(String verificationId, int? forceResendingToken);
typedef PhoneAuthRetrievalTimeout = void Function(String verificationId);

class IAuthService implements AuthService {
  IAuthService(this.services);

  final Bootstrap services;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<SolidSocialUser> loginWithEmailAndPassword({required String email, required String password}) async {
    try {
      final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return await services.userService.getCurrentUser();
    } on FirebaseAuthException catch (e, s) {
      switch (e.code) {
        case "invalid-verification-code":
          throw AuthException.invalidCode(e.message, e.code);
        case "user-not-found":
          throw AuthException.userNotFound(e.message, e.code);
        case "user-disabled":
          throw AuthException.userDisabled(e.message, e.code);
        case "operation-not-allowed":
          throw AuthException.operationNotAllowed(e.message, e.code);
        case "account-exists-with-different-credential":
          throw AuthException.accountExistsWithDifferentCredentials(e.message, e.code);
        case "credential-already-in-use":
          throw AuthException.accountExistsWithDifferentCredentials(e.message, e.code);
        default:
          throw AuthException.unknown(e.message);
      }
    } on AuthException catch (e, s) {
      rethrow;
    }
  }

  @override
  Future<void> loginWithPhoneNumber(
    String phoneNumber, {
    required PhoneAuthVerificationCompleted verificationCompleted,
    required PhoneAuthCodeSent codeSent,
    required PhoneAuthRetrievalTimeout codeAutoRetrievalTimeout,
    required PhoneAuthVerificationFailed verificationFailed,
    bool? isRetrying = false,
    bool? isLinking = false,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  @override
  Future<SolidSocialUser> persistanceLogin() async {
    try {
      final currentUser = _firebaseAuth.currentUser;

      if (currentUser == null) {
        throw const AuthException.userNotFound('User token not found!');
      }
      return await services.userService.getCurrentUser();

      // final SolidSocialUser user =
    } on FirebaseAuthException catch (e, s) {
      // Implement
      rethrow;
    } catch (e) {
      rethrow;
      // TODO: Implement error
    }
  }

  @override
  Future<SolidSocialUser> signInWithApple() async {
    try {
      final AuthorizationCredentialAppleID authorizationCredentialAppleID = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oAuthProvider = OAuthProvider(kAppleProvider);

      //Create OAuth credential for apple logged in token
      final OAuthCredential credential = oAuthProvider.credential(
        idToken: authorizationCredentialAppleID.identityToken,
        accessToken: authorizationCredentialAppleID.authorizationCode,
      );

      final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
      return await services.userService.getUserById(userId: userCredential.user!.uid);
      // return authorizationCredentialAppleID.email;
    } on SignInWithAppleAuthorizationException catch (error, stacktrace) {
      switch (error.code) {
        case AuthorizationErrorCode.canceled:
          throw "User cancelled signing in with Apple";
        case AuthorizationErrorCode.failed:
          throw "Failed signing in with Apple: $error";
        default:
          throw "There was an unknown error from Apple: $error";
      }
    } on FirebaseAuthException catch (e, stk) {
      switch (e.code) {
        case "invalid-verification-code":
          throw AuthException.invalidCode(e.message, e.code);
        case "user-not-found":
          throw AuthException.userNotFound(e.message, e.code);
        case "user-disabled":
          throw AuthException.userDisabled(e.message, e.code);
        case "operation-not-allowed":
          throw AuthException.operationNotAllowed(e.message, e.code);
        case "account-exists-with-different-credential":
          throw AuthException.accountExistsWithDifferentCredentials(e.message, e.code);
        default:
          throw AuthException.unknown(e.message);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SolidSocialUser> signInWithFacebook({bool? isFromSignup = false}) async {
    final result = await _facebookAuth.login();

    if (result.status == LoginStatus.cancelled) {
      throw "cancelled_by_user";
    }
    final accessToken = result.accessToken!;

    final AuthCredential facebookAuthCred = FacebookAuthProvider.credential(accessToken.token);
    try {
      final userCredentials = await _firebaseAuth.signInWithCredential(facebookAuthCred);
      if (isFromSignup!) {
        final firebaseUser = userCredentials.user;
        final nameSplit = firebaseUser?.displayName?.split(" ");
        final Map<String, dynamic> solidSocialUser = {
          "firstName": nameSplit?.elementAt(0) ?? "",
          "lastName": nameSplit?.elementAt(1) ?? "",
          "email": firebaseUser?.email ?? "",
          "uid": ""
        };
        return await services.userService.registerUser(user: SolidSocialUser.fromJson(solidSocialUser));
      }
      return await services.userService.getUserById(userId: userCredentials.user!.uid);
    } on FirebaseException catch (e, stk) {
      switch (e.code) {
        case "invalid-verification-code":
          throw AuthException.invalidCode(e.message, e.code);
        case "user-not-found":
          throw AuthException.userNotFound(e.message, e.code);
        case "user-disabled":
          throw AuthException.userDisabled(e.message, e.code);
        case "operation-not-allowed":
          throw AuthException.operationNotAllowed(e.message, e.code);
        case "account-exists-with-different-credential":
          throw AuthException.accountExistsWithDifferentCredentials(e.message, e.code);
        case "credential-already-in-use":
          throw AuthException.accountExistsWithDifferentCredentials(e.message, e.code);
        default:
          throw AuthException.unknown(e.message);
      }
    } catch (e) {
      rethrow;
    } finally {}
  }

  @override
  Future<SolidSocialUser> signInWithGoogle({bool? isFromSignup = false}) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw const AuthException.unknown();
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      // get the credentials to (access / id token)
      // to sign in via Firebase Authentication
      final AuthCredential credential =
          GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);

      if (isFromSignup!) {
        final nameSplit = googleUser.displayName?.split(" ");
        final Map<String, dynamic> solidSocialUser = {
          "firstName": nameSplit?.elementAt(0) ?? "",
          "lastName": nameSplit?.elementAt(1) ?? "",
          "email": googleUser.email,
          "uid": ""
        };

        return await services.userService.registerUser(user: SolidSocialUser.fromJson(solidSocialUser));
      }
      return await services.userService.getUserById(userId: userCredential.user!.uid);
    } on FirebaseAuthException catch (e, stk) {
      switch (e.code) {
        case "invalid-verification-code":
          throw AuthException.invalidCode(e.message, e.code);
        case "user-not-found":
          throw AuthException.userNotFound(e.message, e.code);
        case "user-disabled":
          throw AuthException.userDisabled(e.message, e.code);
        case "operation-not-allowed":
          throw AuthException.operationNotAllowed(e.message, e.code);
        case "account-exists-with-different-credential":
          throw AuthException.accountExistsWithDifferentCredentials(e.message, e.code);
        default:
          throw AuthException.unknown(e.message);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SolidSocialUser> verifyOtp(
      {required String otpCode, required verificationId, bool? isLinking = false, SolidSocialUser? user}) async {
    try {
      final PhoneAuthCredential phoneCredentials =
          PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpCode);

      final UserCredential userCredential = isLinking!
          ? await _firebaseAuth.currentUser!.linkWithCredential(phoneCredentials)
          : await _firebaseAuth.signInWithCredential(phoneCredentials);

      return await services.userService.getCurrentUser();
    } on FirebaseAuthException catch (e, s) {
      switch (e.code) {
        case "invalid-verification-code":
          throw AuthException.invalidCode(e.message, e.code);
        case "user-not-found":
          throw AuthException.userNotFound(e.message, e.code);
        case "user-disabled":
          throw AuthException.userDisabled(e.message, e.code);
        case "operation-not-allowed":
          throw AuthException.operationNotAllowed(e.message, e.code);
        case "account-exists-with-different-credential":
          throw AuthException.accountExistsWithDifferentCredentials(e.message, e.code);
        case "credential-already-in-use":
          throw AuthException.accountExistsWithDifferentCredentials(e.message, e.code);
        default:
          throw AuthException.unknown(e.message);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SolidSocialUser> registerUser(String email, String password,
      {required String firstName, required String lastName, required String phoneNumber}) async {
    try {
      final userCreds = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      if (userCreds.user == null) throw const AuthException.unknown();

      final SolidSocialUser user =
          SolidSocialUser(email: email, phoneNumber: phoneNumber, firstName: firstName, lastName: lastName, uid: "");
      return await services.userService.registerUser(user: user);
    } on FirebaseAuthException catch (e, s) {
      switch (e.code) {
        case "invalid-verification-code":
          throw AuthException.invalidCode(e.message, e.code);
        case "user-not-found":
          throw AuthException.userNotFound(e.message, e.code);
        case "user-disabled":
          throw AuthException.userDisabled(e.message, e.code);
        case "operation-not-allowed":
          throw AuthException.operationNotAllowed(e.message, e.code);
        case "account-exists-with-different-credential":
          throw AuthException.accountExistsWithDifferentCredentials(e.message, e.code);
        case "credential-already-in-use":
          throw AuthException.accountExistsWithDifferentCredentials(e.message, e.code);
        default:
          throw AuthException.unknown(e.message);
      }
    } on AuthException catch (e, s) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await _facebookAuth.logOut();
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
    await services.chatClient.disconnectUser();
  }
}
