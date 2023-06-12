// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'discussion_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiscussionGroup _$DiscussionGroupFromJson(Map<String, dynamic> json) {
  return _DiscussionGroup.fromJson(json);
}

/// @nodoc
mixin _$DiscussionGroup {
  String get id => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get communityId => throw _privateConstructorUsedError;
  String get groupName => throw _privateConstructorUsedError;
  String? get displayPhotoUrl => throw _privateConstructorUsedError;
  String? get bannerUrl => throw _privateConstructorUsedError;
  String? get topic => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DiscussionGroupPrivacy get privacy => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeOptionTimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscussionGroupCopyWith<DiscussionGroup> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscussionGroupCopyWith<$Res> {
  factory $DiscussionGroupCopyWith(DiscussionGroup value, $Res Function(DiscussionGroup) then) =
      _$DiscussionGroupCopyWithImpl<$Res, DiscussionGroup>;
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String communityId,
      String groupName,
      String? displayPhotoUrl,
      String? bannerUrl,
      String? topic,
      String? description,
      DiscussionGroupPrivacy privacy,
      @DateTimeTimestampConverter() DateTime createdAt,
      @DateTimeOptionTimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class _$DiscussionGroupCopyWithImpl<$Res, $Val extends DiscussionGroup> implements $DiscussionGroupCopyWith<$Res> {
  _$DiscussionGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? communityId = null,
    Object? groupName = null,
    Object? displayPhotoUrl = freezed,
    Object? bannerUrl = freezed,
    Object? topic = freezed,
    Object? description = freezed,
    Object? privacy = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      communityId: null == communityId
          ? _value.communityId
          : communityId // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      displayPhotoUrl: freezed == displayPhotoUrl
          ? _value.displayPhotoUrl
          : displayPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      privacy: null == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as DiscussionGroupPrivacy,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiscussionGroupCopyWith<$Res> implements $DiscussionGroupCopyWith<$Res> {
  factory _$$_DiscussionGroupCopyWith(_$_DiscussionGroup value, $Res Function(_$_DiscussionGroup) then) =
      __$$_DiscussionGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String communityId,
      String groupName,
      String? displayPhotoUrl,
      String? bannerUrl,
      String? topic,
      String? description,
      DiscussionGroupPrivacy privacy,
      @DateTimeTimestampConverter() DateTime createdAt,
      @DateTimeOptionTimestampConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$_DiscussionGroupCopyWithImpl<$Res> extends _$DiscussionGroupCopyWithImpl<$Res, _$_DiscussionGroup>
    implements _$$_DiscussionGroupCopyWith<$Res> {
  __$$_DiscussionGroupCopyWithImpl(_$_DiscussionGroup _value, $Res Function(_$_DiscussionGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? communityId = null,
    Object? groupName = null,
    Object? displayPhotoUrl = freezed,
    Object? bannerUrl = freezed,
    Object? topic = freezed,
    Object? description = freezed,
    Object? privacy = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_DiscussionGroup(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      communityId: null == communityId
          ? _value.communityId
          : communityId // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      displayPhotoUrl: freezed == displayPhotoUrl
          ? _value.displayPhotoUrl
          : displayPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      privacy: null == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as DiscussionGroupPrivacy,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DiscussionGroup extends _DiscussionGroup {
  const _$_DiscussionGroup(
      {required this.id,
      required this.ownerId,
      required this.communityId,
      required this.groupName,
      this.displayPhotoUrl,
      this.bannerUrl,
      this.topic,
      this.description,
      this.privacy = DiscussionGroupPrivacy.public,
      @DateTimeTimestampConverter() required this.createdAt,
      @DateTimeOptionTimestampConverter() this.updatedAt})
      : super._();

  factory _$_DiscussionGroup.fromJson(Map<String, dynamic> json) => _$$_DiscussionGroupFromJson(json);

  @override
  final String id;
  @override
  final String ownerId;
  @override
  final String communityId;
  @override
  final String groupName;
  @override
  final String? displayPhotoUrl;
  @override
  final String? bannerUrl;
  @override
  final String? topic;
  @override
  final String? description;
  @override
  @JsonKey()
  final DiscussionGroupPrivacy privacy;
  @override
  @DateTimeTimestampConverter()
  final DateTime createdAt;
  @override
  @DateTimeOptionTimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'DiscussionGroup(id: $id, ownerId: $ownerId, communityId: $communityId, groupName: $groupName, displayPhotoUrl: $displayPhotoUrl, bannerUrl: $bannerUrl, topic: $topic, description: $description, privacy: $privacy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiscussionGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.communityId, communityId) || other.communityId == communityId) &&
            (identical(other.groupName, groupName) || other.groupName == groupName) &&
            (identical(other.displayPhotoUrl, displayPhotoUrl) || other.displayPhotoUrl == displayPhotoUrl) &&
            (identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.description, description) || other.description == description) &&
            (identical(other.privacy, privacy) || other.privacy == privacy) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, ownerId, communityId, groupName, displayPhotoUrl, bannerUrl, topic,
      description, privacy, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiscussionGroupCopyWith<_$_DiscussionGroup> get copyWith =>
      __$$_DiscussionGroupCopyWithImpl<_$_DiscussionGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiscussionGroupToJson(
      this,
    );
  }
}

abstract class _DiscussionGroup extends DiscussionGroup {
  const factory _DiscussionGroup(
      {required final String id,
      required final String ownerId,
      required final String communityId,
      required final String groupName,
      final String? displayPhotoUrl,
      final String? bannerUrl,
      final String? topic,
      final String? description,
      final DiscussionGroupPrivacy privacy,
      @DateTimeTimestampConverter() required final DateTime createdAt,
      @DateTimeOptionTimestampConverter() final DateTime? updatedAt}) = _$_DiscussionGroup;
  const _DiscussionGroup._() : super._();

  factory _DiscussionGroup.fromJson(Map<String, dynamic> json) = _$_DiscussionGroup.fromJson;

  @override
  String get id;
  @override
  String get ownerId;
  @override
  String get communityId;
  @override
  String get groupName;
  @override
  String? get displayPhotoUrl;
  @override
  String? get bannerUrl;
  @override
  String? get topic;
  @override
  String? get description;
  @override
  DiscussionGroupPrivacy get privacy;
  @override
  @DateTimeTimestampConverter()
  DateTime get createdAt;
  @override
  @DateTimeOptionTimestampConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_DiscussionGroupCopyWith<_$_DiscussionGroup> get copyWith => throw _privateConstructorUsedError;
}
