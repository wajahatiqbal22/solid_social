// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Member _$MemberFromJson(Map<String, dynamic> json) {
  return _Member.fromJson(json);
}

/// @nodoc
mixin _$Member {
  String get userId => throw _privateConstructorUsedError;
  String get communityId => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get joinedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberCopyWith<Member> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) then) = _$MemberCopyWithImpl<$Res, Member>;
  @useResult
  $Res call({String userId, String communityId, @DateTimeTimestampConverter() DateTime joinedAt});
}

/// @nodoc
class _$MemberCopyWithImpl<$Res, $Val extends Member> implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? communityId = null,
    Object? joinedAt = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      communityId: null == communityId
          ? _value.communityId
          : communityId // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MemberCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$$_MemberCopyWith(_$_Member value, $Res Function(_$_Member) then) = __$$_MemberCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String communityId, @DateTimeTimestampConverter() DateTime joinedAt});
}

/// @nodoc
class __$$_MemberCopyWithImpl<$Res> extends _$MemberCopyWithImpl<$Res, _$_Member> implements _$$_MemberCopyWith<$Res> {
  __$$_MemberCopyWithImpl(_$_Member _value, $Res Function(_$_Member) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? communityId = null,
    Object? joinedAt = null,
  }) {
    return _then(_$_Member(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      communityId: null == communityId
          ? _value.communityId
          : communityId // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Member extends _Member {
  const _$_Member(
      {required this.userId, required this.communityId, @DateTimeTimestampConverter() required this.joinedAt})
      : super._();

  factory _$_Member.fromJson(Map<String, dynamic> json) => _$$_MemberFromJson(json);

  @override
  final String userId;
  @override
  final String communityId;
  @override
  @DateTimeTimestampConverter()
  final DateTime joinedAt;

  @override
  String toString() {
    return 'Member(userId: $userId, communityId: $communityId, joinedAt: $joinedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Member &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.communityId, communityId) || other.communityId == communityId) &&
            (identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, communityId, joinedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemberCopyWith<_$_Member> get copyWith => __$$_MemberCopyWithImpl<_$_Member>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberToJson(
      this,
    );
  }
}

abstract class _Member extends Member {
  const factory _Member(
      {required final String userId,
      required final String communityId,
      @DateTimeTimestampConverter() required final DateTime joinedAt}) = _$_Member;
  const _Member._() : super._();

  factory _Member.fromJson(Map<String, dynamic> json) = _$_Member.fromJson;

  @override
  String get userId;
  @override
  String get communityId;
  @override
  @DateTimeTimestampConverter()
  DateTime get joinedAt;
  @override
  @JsonKey(ignore: true)
  _$$_MemberCopyWith<_$_Member> get copyWith => throw _privateConstructorUsedError;
}
