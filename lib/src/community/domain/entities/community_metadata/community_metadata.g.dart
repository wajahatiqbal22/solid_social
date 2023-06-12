// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommunityMetadata _$$_CommunityMetadataFromJson(Map<String, dynamic> json) => _$_CommunityMetadata(
      ownerId: json['ownerId'] as String,
      communityName: json['communityName'] as String,
      requesterId: json['requesterId'] as String,
      id: json['id'] as String,
      communityId: json['communityId'] as String,
      areaOfInterests: (json['areaOfInterests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      photoUrl: json['photoUrl'] as String?,
      joinedAt: const DateTimeOptionTimestampConverter().fromJson(json['joinedAt'] as Timestamp?),
      status: $enumDecodeNullable(_$CommunityRequestStatusEnumMap, json['status']) ?? CommunityRequestStatus.pending,
    );

Map<String, dynamic> _$$_CommunityMetadataToJson(_$_CommunityMetadata instance) => <String, dynamic>{
      'ownerId': instance.ownerId,
      'communityName': instance.communityName,
      'requesterId': instance.requesterId,
      'id': instance.id,
      'communityId': instance.communityId,
      'areaOfInterests': instance.areaOfInterests,
      'photoUrl': instance.photoUrl,
      'joinedAt': const DateTimeOptionTimestampConverter().toJson(instance.joinedAt),
      'status': _$CommunityRequestStatusEnumMap[instance.status]!,
    };

const _$CommunityRequestStatusEnumMap = {
  CommunityRequestStatus.accepted: 'accepted',
  CommunityRequestStatus.declined: 'declined',
  CommunityRequestStatus.pending: 'pending',
};
