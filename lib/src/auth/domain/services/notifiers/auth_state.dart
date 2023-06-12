// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:solid_social/exceptions/auth_exception/auth_exception.dart';
import 'package:solid_social/src/auth/domain/entities/solid_social_user/solid_social_user.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.none() = _AuthStateNone;
  const factory AuthState.logOut() = _AuthStateLogOut;
  const factory AuthState.loggedIn(SolidSocialUser user) = _AuthStateLoggedIn;
  const factory AuthState.loggingIn(AuthType type) = _AuthStateLoggingIn;
  const factory AuthState.noUser() = _AuthStateNoUser;
  const factory AuthState.error(AuthException e) = _AuthStateError;
  const factory AuthState.otpSent(String phoneNumber, String verificationId) = _AuthStateOtopSent;
}

enum AuthType { emailAndPassword, facebook, google, apple, phone, persistance }
