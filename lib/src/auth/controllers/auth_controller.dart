// Dart imports:
// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:solid_social/exceptions/auth_exception/auth_exception.dart';
import 'package:solid_social/src/app/bootstrap/bootstrap.dart';
import 'package:solid_social/src/auth/domain/entities/solid_social_user/solid_social_user.dart';
import 'package:solid_social/src/auth/domain/services/notifiers/auth_state.dart';

class AuthController extends ChangeNotifier {
  AuthController(this.services, {required this.stateNotifier});

  final Bootstrap services;
  AuthState _state = const AuthState.none();
  AuthState get state => _state;

  late SolidSocialUser _solidSocialUser;
  set solidSocialUser(SolidSocialUser user) {
    _solidSocialUser = user;
    notifyListeners();
  }

  SolidSocialUser get solidSocialUser => _solidSocialUser;

  Function(AuthState) stateNotifier;

  Future<void> checkPersistance() async {
    _state = const AuthState.loggingIn(AuthType.persistance);
    notifyListeners();
    try {
      _solidSocialUser = await services.authService.persistanceLogin();

      _state = AuthState.loggedIn(_solidSocialUser);
    } on AuthException catch (e) {
      e.maybeWhen(
        docDoesNotExist: (message, code) {
          _state = const AuthState.noUser();
          stateNotifier(_state);
        },
        orElse: () {
          _state = AuthState.error(e);
          stateNotifier(_state);
        },
        userNotFound: (m, c) {
          _state = const AuthState.logOut();
        },
      );
    } finally {
      stateNotifier(_state);
      notifyListeners();
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    _state = const AuthState.loggingIn(AuthType.emailAndPassword);
    notifyListeners();
    try {
      _solidSocialUser = await services.authService.loginWithEmailAndPassword(email: email, password: password);

      if (_solidSocialUser.phoneNumber != null) {
        await loginWithPhoneNumber(_solidSocialUser.phoneNumber!);
      } else {
        _state = AuthState.loggedIn(_solidSocialUser);
        notifyListeners();
      }
      stateNotifier(_state);
    } on AuthException catch (e, s) {
      e.maybeWhen(docDoesNotExist: (message, code) {
        _state = const AuthState.noUser();
        stateNotifier(_state);
      }, orElse: () {
        _state = AuthState.error(e);
        stateNotifier(_state);
      });
    } finally {
      stateNotifier(_state);
      notifyListeners();
    }
  }

  Future<void> loginWithPhoneNumber(String phoneNumber, {bool? isLinking = false}) async {
    _state = const AuthState.loggingIn(AuthType.phone);
    notifyListeners();
    try {
      await services.authService.loginWithPhoneNumber(
        phoneNumber,
        verificationCompleted: (PhoneAuthCredential credentials) {
          if (credentials.verificationId == null) {
            throw const AuthException.unknown();
          }
          _state = AuthState.otpSent(phoneNumber, credentials.verificationId!);
          stateNotifier(_state);
        },
        codeSent: (String verificationId, int? otp) {
          _state = AuthState.otpSent(phoneNumber, verificationId);
          stateNotifier(_state);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _state = AuthState.otpSent(phoneNumber, verificationId);
          stateNotifier(_state);
        },
        verificationFailed: (FirebaseAuthException exception) {
          _state = AuthState.error(AuthException.invalidCode(exception.message));
          stateNotifier(_state);
        },
      );
    } on AuthException catch (e, s) {
      _state = AuthState.error(e);
      stateNotifier(_state);
    }
  }

  Future<void> signInWithGoogle({bool? isFromSignup = false}) async {
    _state = const AuthState.loggingIn(AuthType.google);
    notifyListeners();
    try {
      final SolidSocialUser user = await services.authService.signInWithGoogle(isFromSignup: isFromSignup);
      _state = AuthState.loggedIn(user);
      notifyListeners();
    } on AuthException catch (e, s) {
      e.maybeWhen(
        userNotFound: (e, m) {
          _state = const AuthState.noUser();
        },
        orElse: () {
          _state = AuthState.error(e);
        },
      );
    } finally {
      stateNotifier(_state);
      notifyListeners();
    }
  }

  Future<void> signInWithFacebook({bool? isFromSignup = false}) async {
    _state = const AuthState.loggingIn(AuthType.facebook);
    notifyListeners();
    try {
      final SolidSocialUser user = await services.authService.signInWithFacebook(isFromSignup: isFromSignup);
      _state = AuthState.loggedIn(user);
      notifyListeners();
    } on AuthException catch (e, s) {
      e.maybeWhen(
        userNotFound: (e, m) {
          _state = const AuthState.noUser();
        },
        orElse: () {
          _state = AuthState.error(e);
        },
      );
    } catch (e) {
      _state = const AuthState.none();
    } finally {
      stateNotifier(_state);
      notifyListeners();
    }
  }

  Future<void> verifyOtp(String verificationId, String otp, {bool isLinking = false, SolidSocialUser? user}) async {
    _state = const AuthState.loggingIn(AuthType.phone);
    notifyListeners();

    try {
      _solidSocialUser =
          await services.authService.verifyOtp(otpCode: otp, verificationId: verificationId, isLinking: isLinking);
      _state = AuthState.loggedIn(_solidSocialUser);
      notifyListeners();
    } on AuthException catch (e, s) {
      e.maybeWhen(docDoesNotExist: (message, code) {
        _state = const AuthState.noUser();
        stateNotifier(_state);
      }, orElse: () {
        _state = AuthState.error(e);
        stateNotifier(_state);
      });
    } finally {
      stateNotifier(_state);
      notifyListeners();
    }
  }

  Future<void> registerUser(
    String email,
    String password, {
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    _state = const AuthState.loggingIn(AuthType.emailAndPassword);
    notifyListeners();

    try {
      _solidSocialUser = await services.authService
          .registerUser(email, password, firstName: firstName, lastName: lastName, phoneNumber: phoneNumber);
      await loginWithPhoneNumber(phoneNumber);
    } on AuthException catch (e, s) {
      _state = AuthState.error(e);
      notifyListeners();
      stateNotifier(_state);
    }
  }

  Future<void> signOut() async {
    await services.authService.signOut();
    stateNotifier(const AuthState.logOut());
  }

  void dummy(AuthState state) {
    _state = state;
    notifyListeners();
    stateNotifier(_state);
  }
}
