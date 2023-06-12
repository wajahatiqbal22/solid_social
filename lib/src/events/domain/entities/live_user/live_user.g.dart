// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LiveUser _$$_LiveUserFromJson(Map<String, dynamic> json) => _$_LiveUser(
      id: json['id'] as String,
      name: json['name'] as String,
      joinedAt: const DateTimeTimestampConverter().fromJson(json['joinedAt'] as Timestamp),
      isHost: json['isHost'] as bool,
      photoUrl: json['photoUrl'] as String?,
      streamStatus: $enumDecodeNullable(_$StreamStatusEnumMap, json['streamStatus']) ??
          StreamStatus.broadcasting,
    );

Map<String, dynamic> _$$_LiveUserToJson(_$_LiveUser instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'joinedAt': const DateTimeTimestampConverter().toJson(instance.joinedAt),
      'isHost': instance.isHost,
      'photoUrl': instance.photoUrl,
      'streamStatus': _$StreamStatusEnumMap[instance.streamStatus]!,
    };

const _$StreamStatusEnumMap = {
  StreamStatus.broadcasting: 'broadcasting',
  StreamStatus.pausedVideo: 'pausedVideo',
  StreamStatus.raisedHand: 'raisedHand',
};
