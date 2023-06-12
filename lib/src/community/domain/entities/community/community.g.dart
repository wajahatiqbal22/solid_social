// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Community _$$_CommunityFromJson(Map<String, dynamic> json) => _$_Community(
      communityName: json['communityName'] as String,
      areaOfInterest: (json['areaOfInterest'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      ownerId: json['ownerId'] as String,
      id: json['id'] as String?,
      photoUrl: json['photoUrl'] as String?,
      createdAt: const DateTimeTimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt: const DateTimeOptionTimestampConverter().fromJson(json['updatedAt'] as Timestamp?),
      privacy: $enumDecodeNullable(_$CommunityPrivacyEnumMap, json['privacy']) ?? CommunityPrivacy.public,
      shareLink: json['shareLink'] as String?,
      members: (json['members'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as bool),
          ) ??
          const {},
    );

Map<String, dynamic> _$$_CommunityToJson(_$_Community instance) => <String, dynamic>{
      'communityName': instance.communityName,
      'areaOfInterest': instance.areaOfInterest,
      'ownerId': instance.ownerId,
      'id': instance.id,
      'photoUrl': instance.photoUrl,
      'createdAt': const DateTimeTimestampConverter().toJson(instance.createdAt),
      'updatedAt': const DateTimeOptionTimestampConverter().toJson(instance.updatedAt),
      'privacy': _$CommunityPrivacyEnumMap[instance.privacy]!,
      'shareLink': instance.shareLink,
      'members': instance.members,
    };

const _$CommunityPrivacyEnumMap = {
  CommunityPrivacy.private: 'private',
  CommunityPrivacy.public: 'public',
};
