// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'community.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Community _$CommunityFromJson(Map<String, dynamic> json) {
  return _Community.fromJson(json);
}

/// @nodoc
mixin _$Community {
  String get communityName => throw _privateConstructorUsedError;
  List<String> get areaOfInterest => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeOptionTimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  CommunityPrivacy get privacy => throw _privateConstructorUsedError;
  String? get shareLink => throw _privateConstructorUsedError;
  Map<String, bool> get members => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommunityCopyWith<Community> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityCopyWith<$Res> {
  factory $CommunityCopyWith(Community value, $Res Function(Community) then) =
      _$CommunityCopyWithImpl<$Res, Community>;
  @useResult
  $Res call(
      {String communityName,
      List<String> areaOfInterest,
      String ownerId,
      String? id,
      String? photoUrl,
      @DateTimeTimestampConverter() DateTime createdAt,
      @DateTimeOptionTimestampConverter() DateTime? updatedAt,
      CommunityPrivacy privacy,
      String? shareLink,
      Map<String, bool> members});
}

/// @nodoc
class _$CommunityCopyWithImpl<$Res, $Val extends Community> implements $CommunityCopyWith<$Res> {
  _$CommunityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? communityName = null,
    Object? areaOfInterest = null,
    Object? ownerId = null,
    Object? id = freezed,
    Object? photoUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? privacy = null,
    Object? shareLink = freezed,
    Object? members = null,
  }) {
    return _then(_value.copyWith(
      communityName: null == communityName
          ? _value.communityName
          : communityName // ignore: cast_nullable_to_non_nullable
              as String,
      areaOfInterest: null == areaOfInterest
          ? _value.areaOfInterest
          : areaOfInterest // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      privacy: null == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as CommunityPrivacy,
      shareLink: freezed == shareLink
          ? _value.shareLink
          : shareLink // ignore: cast_nullable_to_non_nullable
              as String?,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommunityCopyWith<$Res> implements $CommunityCopyWith<$Res> {
  factory _$$_CommunityCopyWith(_$_Community value, $Res Function(_$_Community) then) =
      __$$_CommunityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String communityName,
      List<String> areaOfInterest,
      String ownerId,
      String? id,
      String? photoUrl,
      @DateTimeTimestampConverter() DateTime createdAt,
      @DateTimeOptionTimestampConverter() DateTime? updatedAt,
      CommunityPrivacy privacy,
      String? shareLink,
      Map<String, bool> members});
}

/// @nodoc
class __$$_CommunityCopyWithImpl<$Res> extends _$CommunityCopyWithImpl<$Res, _$_Community>
    implements _$$_CommunityCopyWith<$Res> {
  __$$_CommunityCopyWithImpl(_$_Community _value, $Res Function(_$_Community) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? communityName = null,
    Object? areaOfInterest = null,
    Object? ownerId = null,
    Object? id = freezed,
    Object? photoUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? privacy = null,
    Object? shareLink = freezed,
    Object? members = null,
  }) {
    return _then(_$_Community(
      communityName: null == communityName
          ? _value.communityName
          : communityName // ignore: cast_nullable_to_non_nullable
              as String,
      areaOfInterest: null == areaOfInterest
          ? _value._areaOfInterest
          : areaOfInterest // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      privacy: null == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as CommunityPrivacy,
      shareLink: freezed == shareLink
          ? _value.shareLink
          : shareLink // ignore: cast_nullable_to_non_nullable
              as String?,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Community extends _Community {
  const _$_Community(
      {required this.communityName,
      required final List<String> areaOfInterest,
      required this.ownerId,
      this.id,
      this.photoUrl,
      @DateTimeTimestampConverter() required this.createdAt,
      @DateTimeOptionTimestampConverter() this.updatedAt,
      this.privacy = CommunityPrivacy.public,
      this.shareLink,
      final Map<String, bool> members = const {}})
      : _areaOfInterest = areaOfInterest,
        _members = members,
        super._();

  factory _$_Community.fromJson(Map<String, dynamic> json) => _$$_CommunityFromJson(json);

  @override
  final String communityName;
  final List<String> _areaOfInterest;
  @override
  List<String> get areaOfInterest {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_areaOfInterest);
  }

  @override
  final String ownerId;
  @override
  final String? id;
  @override
  final String? photoUrl;
  @override
  @DateTimeTimestampConverter()
  final DateTime createdAt;
  @override
  @DateTimeOptionTimestampConverter()
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final CommunityPrivacy privacy;
  @override
  final String? shareLink;
  final Map<String, bool> _members;
  @override
  @JsonKey()
  Map<String, bool> get members {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_members);
  }

  @override
  String toString() {
    return 'Community(communityName: $communityName, areaOfInterest: $areaOfInterest, ownerId: $ownerId, id: $id, photoUrl: $photoUrl, createdAt: $createdAt, updatedAt: $updatedAt, privacy: $privacy, shareLink: $shareLink, members: $members)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Community &&
            (identical(other.communityName, communityName) ||
                other.communityName == communityName) &&
            (identical(other.areaOfInterest, areaOfInterest) ||
                other.areaOfInterest == areaOfInterest) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt) &&
            (identical(other.privacy, privacy) || other.privacy == privacy) &&
            (identical(other.shareLink, shareLink) || other.shareLink == shareLink) &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, communityName, areaOfInterest, ownerId, id, photoUrl,
      createdAt, updatedAt, privacy, shareLink, const DeepCollectionEquality().hash(_members));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommunityCopyWith<_$_Community> get copyWith =>
      __$$_CommunityCopyWithImpl<_$_Community>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommunityToJson(
      this,
    );
  }
}

abstract class _Community extends Community {
  const factory _Community(
      {required final String communityName,
      required final List<String> areaOfInterest,
      required final String ownerId,
      final String? id,
      final String? photoUrl,
      @DateTimeTimestampConverter() required final DateTime createdAt,
      @DateTimeOptionTimestampConverter() final DateTime? updatedAt,
      final CommunityPrivacy privacy,
      final String? shareLink,
      final Map<String, bool> members}) = _$_Community;
  const _Community._() : super._();

  factory _Community.fromJson(Map<String, dynamic> json) = _$_Community.fromJson;

  @override
  String get communityName;
  @override
  List<String> get areaOfInterest;
  @override
  String get ownerId;
  @override
  String? get id;
  @override
  String? get photoUrl;
  @override
  @DateTimeTimestampConverter()
  DateTime get createdAt;
  @override
  @DateTimeOptionTimestampConverter()
  DateTime? get updatedAt;
  @override
  CommunityPrivacy get privacy;
  @override
  String? get shareLink;
  @override
  Map<String, bool> get members;
  @override
  @JsonKey(ignore: true)
  _$$_CommunityCopyWith<_$_Community> get copyWith => throw _privateConstructorUsedError;
}
