// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'solid_social_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SolidSocialUser _$SolidSocialUserFromJson(Map<String, dynamic> json) {
  return _SolidSocialUser.fromJson(json);
}

/// @nodoc
mixin _$SolidSocialUser {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get fcmToken => throw _privateConstructorUsedError;
  UserDetails get userDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolidSocialUserCopyWith<SolidSocialUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolidSocialUserCopyWith<$Res> {
  factory $SolidSocialUserCopyWith(SolidSocialUser value, $Res Function(SolidSocialUser) then) =
      _$SolidSocialUserCopyWithImpl<$Res, SolidSocialUser>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String uid,
      String? phoneNumber,
      String? fcmToken,
      UserDetails userDetails});

  $UserDetailsCopyWith<$Res> get userDetails;
}

/// @nodoc
class _$SolidSocialUserCopyWithImpl<$Res, $Val extends SolidSocialUser> implements $SolidSocialUserCopyWith<$Res> {
  _$SolidSocialUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? uid = null,
    Object? phoneNumber = freezed,
    Object? fcmToken = freezed,
    Object? userDetails = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userDetails: null == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetails,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDetailsCopyWith<$Res> get userDetails {
    return $UserDetailsCopyWith<$Res>(_value.userDetails, (value) {
      return _then(_value.copyWith(userDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SolidSocialUserCopyWith<$Res> implements $SolidSocialUserCopyWith<$Res> {
  factory _$$_SolidSocialUserCopyWith(_$_SolidSocialUser value, $Res Function(_$_SolidSocialUser) then) =
      __$$_SolidSocialUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String uid,
      String? phoneNumber,
      String? fcmToken,
      UserDetails userDetails});

  @override
  $UserDetailsCopyWith<$Res> get userDetails;
}

/// @nodoc
class __$$_SolidSocialUserCopyWithImpl<$Res> extends _$SolidSocialUserCopyWithImpl<$Res, _$_SolidSocialUser>
    implements _$$_SolidSocialUserCopyWith<$Res> {
  __$$_SolidSocialUserCopyWithImpl(_$_SolidSocialUser _value, $Res Function(_$_SolidSocialUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? uid = null,
    Object? phoneNumber = freezed,
    Object? fcmToken = freezed,
    Object? userDetails = null,
  }) {
    return _then(_$_SolidSocialUser(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userDetails: null == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetails,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SolidSocialUser extends _SolidSocialUser {
  const _$_SolidSocialUser(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.uid,
      this.phoneNumber,
      this.fcmToken,
      this.userDetails = const UserDetails()})
      : super._();

  factory _$_SolidSocialUser.fromJson(Map<String, dynamic> json) => _$$_SolidSocialUserFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String uid;
  @override
  final String? phoneNumber;
  @override
  final String? fcmToken;
  @override
  @JsonKey()
  final UserDetails userDetails;

  @override
  String toString() {
    return 'SolidSocialUser(firstName: $firstName, lastName: $lastName, email: $email, uid: $uid, phoneNumber: $phoneNumber, fcmToken: $fcmToken, userDetails: $userDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SolidSocialUser &&
            (identical(other.firstName, firstName) || other.firstName == firstName) &&
            (identical(other.lastName, lastName) || other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber) &&
            (identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken) &&
            (identical(other.userDetails, userDetails) || other.userDetails == userDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, email, uid, phoneNumber, fcmToken, userDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SolidSocialUserCopyWith<_$_SolidSocialUser> get copyWith =>
      __$$_SolidSocialUserCopyWithImpl<_$_SolidSocialUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SolidSocialUserToJson(
      this,
    );
  }
}

abstract class _SolidSocialUser extends SolidSocialUser {
  const factory _SolidSocialUser(
      {required final String firstName,
      required final String lastName,
      required final String email,
      required final String uid,
      final String? phoneNumber,
      final String? fcmToken,
      final UserDetails userDetails}) = _$_SolidSocialUser;
  const _SolidSocialUser._() : super._();

  factory _SolidSocialUser.fromJson(Map<String, dynamic> json) = _$_SolidSocialUser.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get uid;
  @override
  String? get phoneNumber;
  @override
  String? get fcmToken;
  @override
  UserDetails get userDetails;
  @override
  @JsonKey(ignore: true)
  _$$_SolidSocialUserCopyWith<_$_SolidSocialUser> get copyWith => throw _privateConstructorUsedError;
}

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) {
  return _UserDetails.fromJson(json);
}

/// @nodoc
mixin _$UserDetails {
  String? get profileUrl => throw _privateConstructorUsedError;
  String? get bannerUrl => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDetailsCopyWith<UserDetails> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsCopyWith<$Res> {
  factory $UserDetailsCopyWith(UserDetails value, $Res Function(UserDetails) then) =
      _$UserDetailsCopyWithImpl<$Res, UserDetails>;
  @useResult
  $Res call({String? profileUrl, String? bannerUrl, String? bio});
}

/// @nodoc
class _$UserDetailsCopyWithImpl<$Res, $Val extends UserDetails> implements $UserDetailsCopyWith<$Res> {
  _$UserDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileUrl = freezed,
    Object? bannerUrl = freezed,
    Object? bio = freezed,
  }) {
    return _then(_value.copyWith(
      profileUrl: freezed == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDetailsCopyWith<$Res> implements $UserDetailsCopyWith<$Res> {
  factory _$$_UserDetailsCopyWith(_$_UserDetails value, $Res Function(_$_UserDetails) then) =
      __$$_UserDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? profileUrl, String? bannerUrl, String? bio});
}

/// @nodoc
class __$$_UserDetailsCopyWithImpl<$Res> extends _$UserDetailsCopyWithImpl<$Res, _$_UserDetails>
    implements _$$_UserDetailsCopyWith<$Res> {
  __$$_UserDetailsCopyWithImpl(_$_UserDetails _value, $Res Function(_$_UserDetails) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileUrl = freezed,
    Object? bannerUrl = freezed,
    Object? bio = freezed,
  }) {
    return _then(_$_UserDetails(
      profileUrl: freezed == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDetails extends _UserDetails {
  const _$_UserDetails({this.profileUrl, this.bannerUrl, this.bio}) : super._();

  factory _$_UserDetails.fromJson(Map<String, dynamic> json) => _$$_UserDetailsFromJson(json);

  @override
  final String? profileUrl;
  @override
  final String? bannerUrl;
  @override
  final String? bio;

  @override
  String toString() {
    return 'UserDetails(profileUrl: $profileUrl, bannerUrl: $bannerUrl, bio: $bio)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDetails &&
            (identical(other.profileUrl, profileUrl) || other.profileUrl == profileUrl) &&
            (identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl) &&
            (identical(other.bio, bio) || other.bio == bio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, profileUrl, bannerUrl, bio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDetailsCopyWith<_$_UserDetails> get copyWith =>
      __$$_UserDetailsCopyWithImpl<_$_UserDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDetailsToJson(
      this,
    );
  }
}

abstract class _UserDetails extends UserDetails {
  const factory _UserDetails({final String? profileUrl, final String? bannerUrl, final String? bio}) = _$_UserDetails;
  const _UserDetails._() : super._();

  factory _UserDetails.fromJson(Map<String, dynamic> json) = _$_UserDetails.fromJson;

  @override
  String? get profileUrl;
  @override
  String? get bannerUrl;
  @override
  String? get bio;
  @override
  @JsonKey(ignore: true)
  _$$_UserDetailsCopyWith<_$_UserDetails> get copyWith => throw _privateConstructorUsedError;
}
