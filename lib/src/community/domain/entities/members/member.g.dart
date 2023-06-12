// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Member _$$_MemberFromJson(Map<String, dynamic> json) => _$_Member(
      userId: json['userId'] as String,
      communityId: json['communityId'] as String,
      joinedAt: const DateTimeTimestampConverter().fromJson(json['joinedAt'] as Timestamp),
    );

Map<String, dynamic> _$$_MemberToJson(_$_Member instance) => <String, dynamic>{
      'userId': instance.userId,
      'communityId': instance.communityId,
      'joinedAt': const DateTimeTimestampConverter().toJson(instance.joinedAt),
    };
