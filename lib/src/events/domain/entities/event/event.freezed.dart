// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  String get eventId => throw _privateConstructorUsedError;
  String get communityId => throw _privateConstructorUsedError;
  String get eventName => throw _privateConstructorUsedError;
  bool get isPrivate => throw _privateConstructorUsedError;
  bool get isRecording => throw _privateConstructorUsedError;
  List<String> get groupIds => throw _privateConstructorUsedError;
  EventHost get host => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get eventDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) = _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {String eventId,
      String communityId,
      String eventName,
      bool isPrivate,
      bool isRecording,
      List<String> groupIds,
      EventHost host,
      @DateTimeTimestampConverter() DateTime createdAt,
      @DateTimeTimestampConverter() DateTime eventDateTime});

  $EventHostCopyWith<$Res> get host;
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? communityId = null,
    Object? eventName = null,
    Object? isPrivate = null,
    Object? isRecording = null,
    Object? groupIds = null,
    Object? host = null,
    Object? createdAt = null,
    Object? eventDateTime = null,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      communityId: null == communityId
          ? _value.communityId
          : communityId // ignore: cast_nullable_to_non_nullable
              as String,
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      groupIds: null == groupIds
          ? _value.groupIds
          : groupIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as EventHost,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventDateTime: null == eventDateTime
          ? _value.eventDateTime
          : eventDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EventHostCopyWith<$Res> get host {
    return $EventHostCopyWith<$Res>(_value.host, (value) {
      return _then(_value.copyWith(host: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$_EventCopyWith(_$_Event value, $Res Function(_$_Event) then) = __$$_EventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      String communityId,
      String eventName,
      bool isPrivate,
      bool isRecording,
      List<String> groupIds,
      EventHost host,
      @DateTimeTimestampConverter() DateTime createdAt,
      @DateTimeTimestampConverter() DateTime eventDateTime});

  @override
  $EventHostCopyWith<$Res> get host;
}

/// @nodoc
class __$$_EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res, _$_Event> implements _$$_EventCopyWith<$Res> {
  __$$_EventCopyWithImpl(_$_Event _value, $Res Function(_$_Event) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? communityId = null,
    Object? eventName = null,
    Object? isPrivate = null,
    Object? isRecording = null,
    Object? groupIds = null,
    Object? host = null,
    Object? createdAt = null,
    Object? eventDateTime = null,
  }) {
    return _then(_$_Event(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      communityId: null == communityId
          ? _value.communityId
          : communityId // ignore: cast_nullable_to_non_nullable
              as String,
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      groupIds: null == groupIds
          ? _value._groupIds
          : groupIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as EventHost,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventDateTime: null == eventDateTime
          ? _value.eventDateTime
          : eventDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Event extends _Event {
  const _$_Event(
      {required this.eventId,
      required this.communityId,
      required this.eventName,
      required this.isPrivate,
      required this.isRecording,
      required final List<String> groupIds,
      required this.host,
      @DateTimeTimestampConverter() required this.createdAt,
      @DateTimeTimestampConverter() required this.eventDateTime})
      : _groupIds = groupIds,
        super._();

  factory _$_Event.fromJson(Map<String, dynamic> json) => _$$_EventFromJson(json);

  @override
  final String eventId;
  @override
  final String communityId;
  @override
  final String eventName;
  @override
  final bool isPrivate;
  @override
  final bool isRecording;
  final List<String> _groupIds;
  @override
  List<String> get groupIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupIds);
  }

  @override
  final EventHost host;
  @override
  @DateTimeTimestampConverter()
  final DateTime createdAt;
  @override
  @DateTimeTimestampConverter()
  final DateTime eventDateTime;

  @override
  String toString() {
    return 'Event(eventId: $eventId, communityId: $communityId, eventName: $eventName, isPrivate: $isPrivate, isRecording: $isRecording, groupIds: $groupIds, host: $host, createdAt: $createdAt, eventDateTime: $eventDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Event &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.communityId, communityId) || other.communityId == communityId) &&
            (identical(other.eventName, eventName) || other.eventName == eventName) &&
            (identical(other.isPrivate, isPrivate) || other.isPrivate == isPrivate) &&
            (identical(other.isRecording, isRecording) || other.isRecording == isRecording) &&
            const DeepCollectionEquality().equals(other._groupIds, _groupIds) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            (identical(other.eventDateTime, eventDateTime) || other.eventDateTime == eventDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, communityId, eventName, isPrivate, isRecording,
      const DeepCollectionEquality().hash(_groupIds), host, createdAt, eventDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventCopyWith<_$_Event> get copyWith => __$$_EventCopyWithImpl<_$_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventToJson(
      this,
    );
  }
}

abstract class _Event extends Event {
  const factory _Event(
      {required final String eventId,
      required final String communityId,
      required final String eventName,
      required final bool isPrivate,
      required final bool isRecording,
      required final List<String> groupIds,
      required final EventHost host,
      @DateTimeTimestampConverter() required final DateTime createdAt,
      @DateTimeTimestampConverter() required final DateTime eventDateTime}) = _$_Event;
  const _Event._() : super._();

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  String get eventId;
  @override
  String get communityId;
  @override
  String get eventName;
  @override
  bool get isPrivate;
  @override
  bool get isRecording;
  @override
  List<String> get groupIds;
  @override
  EventHost get host;
  @override
  @DateTimeTimestampConverter()
  DateTime get createdAt;
  @override
  @DateTimeTimestampConverter()
  DateTime get eventDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_EventCopyWith<_$_Event> get copyWith => throw _privateConstructorUsedError;
}

EventHost _$EventHostFromJson(Map<String, dynamic> json) {
  return _EventHost.fromJson(json);
}

/// @nodoc
mixin _$EventHost {
  String get hostId => throw _privateConstructorUsedError;
  String get hostName => throw _privateConstructorUsedError;
  String? get profilePic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventHostCopyWith<EventHost> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventHostCopyWith<$Res> {
  factory $EventHostCopyWith(EventHost value, $Res Function(EventHost) then) = _$EventHostCopyWithImpl<$Res, EventHost>;
  @useResult
  $Res call({String hostId, String hostName, String? profilePic});
}

/// @nodoc
class _$EventHostCopyWithImpl<$Res, $Val extends EventHost> implements $EventHostCopyWith<$Res> {
  _$EventHostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hostId = null,
    Object? hostName = null,
    Object? profilePic = freezed,
  }) {
    return _then(_value.copyWith(
      hostId: null == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as String,
      hostName: null == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventHostCopyWith<$Res> implements $EventHostCopyWith<$Res> {
  factory _$$_EventHostCopyWith(_$_EventHost value, $Res Function(_$_EventHost) then) =
      __$$_EventHostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String hostId, String hostName, String? profilePic});
}

/// @nodoc
class __$$_EventHostCopyWithImpl<$Res> extends _$EventHostCopyWithImpl<$Res, _$_EventHost>
    implements _$$_EventHostCopyWith<$Res> {
  __$$_EventHostCopyWithImpl(_$_EventHost _value, $Res Function(_$_EventHost) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hostId = null,
    Object? hostName = null,
    Object? profilePic = freezed,
  }) {
    return _then(_$_EventHost(
      hostId: null == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as String,
      hostName: null == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_EventHost extends _EventHost {
  const _$_EventHost({required this.hostId, required this.hostName, this.profilePic}) : super._();

  factory _$_EventHost.fromJson(Map<String, dynamic> json) => _$$_EventHostFromJson(json);

  @override
  final String hostId;
  @override
  final String hostName;
  @override
  final String? profilePic;

  @override
  String toString() {
    return 'EventHost(hostId: $hostId, hostName: $hostName, profilePic: $profilePic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventHost &&
            (identical(other.hostId, hostId) || other.hostId == hostId) &&
            (identical(other.hostName, hostName) || other.hostName == hostName) &&
            (identical(other.profilePic, profilePic) || other.profilePic == profilePic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hostId, hostName, profilePic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventHostCopyWith<_$_EventHost> get copyWith => __$$_EventHostCopyWithImpl<_$_EventHost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventHostToJson(
      this,
    );
  }
}

abstract class _EventHost extends EventHost {
  const factory _EventHost({required final String hostId, required final String hostName, final String? profilePic}) =
      _$_EventHost;
  const _EventHost._() : super._();

  factory _EventHost.fromJson(Map<String, dynamic> json) = _$_EventHost.fromJson;

  @override
  String get hostId;
  @override
  String get hostName;
  @override
  String? get profilePic;
  @override
  @JsonKey(ignore: true)
  _$$_EventHostCopyWith<_$_EventHost> get copyWith => throw _privateConstructorUsedError;
}
