// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'live_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LiveUser _$LiveUserFromJson(Map<String, dynamic> json) {
  return _LiveUser.fromJson(json);
}

/// @nodoc
mixin _$LiveUser {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get joinedAt => throw _privateConstructorUsedError;
  bool get isHost => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  StreamStatus get streamStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveUserCopyWith<LiveUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveUserCopyWith<$Res> {
  factory $LiveUserCopyWith(LiveUser value, $Res Function(LiveUser) then) = _$LiveUserCopyWithImpl<$Res, LiveUser>;
  @useResult
  $Res call(
      {String id,
      String name,
      @DateTimeTimestampConverter() DateTime joinedAt,
      bool isHost,
      String? photoUrl,
      StreamStatus streamStatus});
}

/// @nodoc
class _$LiveUserCopyWithImpl<$Res, $Val extends LiveUser> implements $LiveUserCopyWith<$Res> {
  _$LiveUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? joinedAt = null,
    Object? isHost = null,
    Object? photoUrl = freezed,
    Object? streamStatus = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isHost: null == isHost
          ? _value.isHost
          : isHost // ignore: cast_nullable_to_non_nullable
              as bool,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      streamStatus: null == streamStatus
          ? _value.streamStatus
          : streamStatus // ignore: cast_nullable_to_non_nullable
              as StreamStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LiveUserCopyWith<$Res> implements $LiveUserCopyWith<$Res> {
  factory _$$_LiveUserCopyWith(_$_LiveUser value, $Res Function(_$_LiveUser) then) = __$$_LiveUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @DateTimeTimestampConverter() DateTime joinedAt,
      bool isHost,
      String? photoUrl,
      StreamStatus streamStatus});
}

/// @nodoc
class __$$_LiveUserCopyWithImpl<$Res> extends _$LiveUserCopyWithImpl<$Res, _$_LiveUser>
    implements _$$_LiveUserCopyWith<$Res> {
  __$$_LiveUserCopyWithImpl(_$_LiveUser _value, $Res Function(_$_LiveUser) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? joinedAt = null,
    Object? isHost = null,
    Object? photoUrl = freezed,
    Object? streamStatus = null,
  }) {
    return _then(_$_LiveUser(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isHost: null == isHost
          ? _value.isHost
          : isHost // ignore: cast_nullable_to_non_nullable
              as bool,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      streamStatus: null == streamStatus
          ? _value.streamStatus
          : streamStatus // ignore: cast_nullable_to_non_nullable
              as StreamStatus,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_LiveUser extends _LiveUser {
  const _$_LiveUser(
      {required this.id,
      required this.name,
      @DateTimeTimestampConverter() required this.joinedAt,
      required this.isHost,
      this.photoUrl,
      this.streamStatus = StreamStatus.broadcasting})
      : super._();

  factory _$_LiveUser.fromJson(Map<String, dynamic> json) => _$$_LiveUserFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @DateTimeTimestampConverter()
  final DateTime joinedAt;
  @override
  final bool isHost;
  @override
  final String? photoUrl;
  @override
  @JsonKey()
  final StreamStatus streamStatus;

  @override
  String toString() {
    return 'LiveUser(id: $id, name: $name, joinedAt: $joinedAt, isHost: $isHost, photoUrl: $photoUrl, streamStatus: $streamStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LiveUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt) &&
            (identical(other.isHost, isHost) || other.isHost == isHost) &&
            (identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl) &&
            (identical(other.streamStatus, streamStatus) || other.streamStatus == streamStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, joinedAt, isHost, photoUrl, streamStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LiveUserCopyWith<_$_LiveUser> get copyWith => __$$_LiveUserCopyWithImpl<_$_LiveUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LiveUserToJson(
      this,
    );
  }
}

abstract class _LiveUser extends LiveUser {
  const factory _LiveUser(
      {required final String id,
      required final String name,
      @DateTimeTimestampConverter() required final DateTime joinedAt,
      required final bool isHost,
      final String? photoUrl,
      final StreamStatus streamStatus}) = _$_LiveUser;
  const _LiveUser._() : super._();

  factory _LiveUser.fromJson(Map<String, dynamic> json) = _$_LiveUser.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @DateTimeTimestampConverter()
  DateTime get joinedAt;
  @override
  bool get isHost;
  @override
  String? get photoUrl;
  @override
  StreamStatus get streamStatus;
  @override
  @JsonKey(ignore: true)
  _$$_LiveUserCopyWith<_$_LiveUser> get copyWith => throw _privateConstructorUsedError;
}
