// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      eventId: json['eventId'] as String,
      communityId: json['communityId'] as String,
      eventName: json['eventName'] as String,
      isPrivate: json['isPrivate'] as bool,
      isRecording: json['isRecording'] as bool,
      groupIds: (json['groupIds'] as List<dynamic>).map((e) => e as String).toList(),
      host: EventHost.fromJson(json['host'] as Map<String, dynamic>),
      createdAt: const DateTimeTimestampConverter().fromJson(json['createdAt'] as Timestamp),
      eventDateTime: const DateTimeTimestampConverter().fromJson(json['eventDateTime'] as Timestamp),
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'eventId': instance.eventId,
      'communityId': instance.communityId,
      'eventName': instance.eventName,
      'isPrivate': instance.isPrivate,
      'isRecording': instance.isRecording,
      'groupIds': instance.groupIds,
      'host': instance.host.toJson(),
      'createdAt': const DateTimeTimestampConverter().toJson(instance.createdAt),
      'eventDateTime': const DateTimeTimestampConverter().toJson(instance.eventDateTime),
    };

_$_EventHost _$$_EventHostFromJson(Map<String, dynamic> json) => _$_EventHost(
      hostId: json['hostId'] as String,
      hostName: json['hostName'] as String,
      profilePic: json['profilePic'] as String?,
    );

Map<String, dynamic> _$$_EventHostToJson(_$_EventHost instance) => <String, dynamic>{
      'hostId': instance.hostId,
      'hostName': instance.hostName,
      'profilePic': instance.profilePic,
    };
