// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'community_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommunityMetadata _$CommunityMetadataFromJson(Map<String, dynamic> json) {
  return _CommunityMetadata.fromJson(json);
}

/// @nodoc
mixin _$CommunityMetadata {
  String get ownerId => throw _privateConstructorUsedError;
  String get communityName => throw _privateConstructorUsedError;
  String get requesterId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get communityId => throw _privateConstructorUsedError;
  List<String>? get areaOfInterests => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  @DateTimeOptionTimestampConverter()
  DateTime? get joinedAt => throw _privateConstructorUsedError;
  CommunityRequestStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommunityMetadataCopyWith<CommunityMetadata> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityMetadataCopyWith<$Res> {
  factory $CommunityMetadataCopyWith(
          CommunityMetadata value, $Res Function(CommunityMetadata) then) =
      _$CommunityMetadataCopyWithImpl<$Res, CommunityMetadata>;
  @useResult
  $Res call(
      {String ownerId,
      String communityName,
      String requesterId,
      String id,
      String communityId,
      List<String>? areaOfInterests,
      String? photoUrl,
      @DateTimeOptionTimestampConverter() DateTime? joinedAt,
      CommunityRequestStatus status});
}

/// @nodoc
class _$CommunityMetadataCopyWithImpl<$Res, $Val extends CommunityMetadata>
    implements $CommunityMetadataCopyWith<$Res> {
  _$CommunityMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerId = null,
    Object? communityName = null,
    Object? requesterId = null,
    Object? id = null,
    Object? communityId = null,
    Object? areaOfInterests = freezed,
    Object? photoUrl = freezed,
    Object? joinedAt = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      communityName: null == communityName
          ? _value.communityName
          : communityName // ignore: cast_nullable_to_non_nullable
              as String,
      requesterId: null == requesterId
          ? _value.requesterId
          : requesterId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      communityId: null == communityId
          ? _value.communityId
          : communityId // ignore: cast_nullable_to_non_nullable
              as String,
      areaOfInterests: freezed == areaOfInterests
          ? _value.areaOfInterests
          : areaOfInterests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      joinedAt: freezed == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommunityRequestStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommunityMetadataCopyWith<$Res> implements $CommunityMetadataCopyWith<$Res> {
  factory _$$_CommunityMetadataCopyWith(
          _$_CommunityMetadata value, $Res Function(_$_CommunityMetadata) then) =
      __$$_CommunityMetadataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ownerId,
      String communityName,
      String requesterId,
      String id,
      String communityId,
      List<String>? areaOfInterests,
      String? photoUrl,
      @DateTimeOptionTimestampConverter() DateTime? joinedAt,
      CommunityRequestStatus status});
}

/// @nodoc
class __$$_CommunityMetadataCopyWithImpl<$Res>
    extends _$CommunityMetadataCopyWithImpl<$Res, _$_CommunityMetadata>
    implements _$$_CommunityMetadataCopyWith<$Res> {
  __$$_CommunityMetadataCopyWithImpl(
      _$_CommunityMetadata _value, $Res Function(_$_CommunityMetadata) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerId = null,
    Object? communityName = null,
    Object? requesterId = null,
    Object? id = null,
    Object? communityId = null,
    Object? areaOfInterests = freezed,
    Object? photoUrl = freezed,
    Object? joinedAt = freezed,
    Object? status = null,
  }) {
    return _then(_$_CommunityMetadata(
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      communityName: null == communityName
          ? _value.communityName
          : communityName // ignore: cast_nullable_to_non_nullable
              as String,
      requesterId: null == requesterId
          ? _value.requesterId
          : requesterId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      communityId: null == communityId
          ? _value.communityId
          : communityId // ignore: cast_nullable_to_non_nullable
              as String,
      areaOfInterests: freezed == areaOfInterests
          ? _value._areaOfInterests
          : areaOfInterests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      joinedAt: freezed == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommunityRequestStatus,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CommunityMetadata extends _CommunityMetadata {
  const _$_CommunityMetadata(
      {required this.ownerId,
      required this.communityName,
      required this.requesterId,
      required this.id,
      required this.communityId,
      final List<String>? areaOfInterests,
      this.photoUrl,
      @DateTimeOptionTimestampConverter() this.joinedAt,
      this.status = CommunityRequestStatus.pending})
      : _areaOfInterests = areaOfInterests,
        super._();

  factory _$_CommunityMetadata.fromJson(Map<String, dynamic> json) =>
      _$$_CommunityMetadataFromJson(json);

  @override
  final String ownerId;
  @override
  final String communityName;
  @override
  final String requesterId;
  @override
  final String id;
  @override
  final String communityId;
  final List<String>? _areaOfInterests;
  @override
  List<String>? get areaOfInterests {
    final value = _areaOfInterests;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? photoUrl;
  @override
  @DateTimeOptionTimestampConverter()
  final DateTime? joinedAt;
  @override
  @JsonKey()
  final CommunityRequestStatus status;

  @override
  String toString() {
    return 'CommunityMetadata(ownerId: $ownerId, communityName: $communityName, requesterId: $requesterId, id: $id, communityId: $communityId, areaOfInterests: $areaOfInterests, photoUrl: $photoUrl, joinedAt: $joinedAt, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommunityMetadata &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.communityName, communityName) ||
                other.communityName == communityName) &&
            (identical(other.requesterId, requesterId) || other.requesterId == requesterId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.communityId, communityId) || other.communityId == communityId) &&
            (identical(other.areaOfInterests, areaOfInterests) ||
                other.areaOfInterests == areaOfInterests) &&
            (identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl) &&
            (identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ownerId, communityName, requesterId, id, communityId,
      areaOfInterests, photoUrl, joinedAt, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommunityMetadataCopyWith<_$_CommunityMetadata> get copyWith =>
      __$$_CommunityMetadataCopyWithImpl<_$_CommunityMetadata>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommunityMetadataToJson(
      this,
    );
  }
}

abstract class _CommunityMetadata extends CommunityMetadata {
  const factory _CommunityMetadata(
      {required final String ownerId,
      required final String communityName,
      required final String requesterId,
      required final String id,
      required final String communityId,
      final List<String>? areaOfInterests,
      final String? photoUrl,
      @DateTimeOptionTimestampConverter() final DateTime? joinedAt,
      final CommunityRequestStatus status}) = _$_CommunityMetadata;
  const _CommunityMetadata._() : super._();

  factory _CommunityMetadata.fromJson(Map<String, dynamic> json) = _$_CommunityMetadata.fromJson;

  @override
  String get ownerId;
  @override
  String get communityName;
  @override
  String get requesterId;
  @override
  String get id;
  @override
  String get communityId;
  @override
  List<String>? get areaOfInterests;
  @override
  String? get photoUrl;
  @override
  @DateTimeOptionTimestampConverter()
  DateTime? get joinedAt;
  @override
  CommunityRequestStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_CommunityMetadataCopyWith<_$_CommunityMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}
