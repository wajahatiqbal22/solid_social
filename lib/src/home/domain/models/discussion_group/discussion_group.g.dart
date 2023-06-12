// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discussion_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiscussionGroup _$$_DiscussionGroupFromJson(Map<String, dynamic> json) => _$_DiscussionGroup(
      id: json['id'] as String,
      ownerId: json['ownerId'] as String,
      communityId: json['communityId'] as String,
      groupName: json['groupName'] as String,
      displayPhotoUrl: json['displayPhotoUrl'] as String?,
      bannerUrl: json['bannerUrl'] as String?,
      topic: json['topic'] as String?,
      description: json['description'] as String?,
      privacy: $enumDecodeNullable(_$DiscussionGroupPrivacyEnumMap, json['privacy']) ?? DiscussionGroupPrivacy.public,
      createdAt: const DateTimeTimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt: const DateTimeOptionTimestampConverter().fromJson(json['updatedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_DiscussionGroupToJson(_$_DiscussionGroup instance) => <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'communityId': instance.communityId,
      'groupName': instance.groupName,
      'displayPhotoUrl': instance.displayPhotoUrl,
      'bannerUrl': instance.bannerUrl,
      'topic': instance.topic,
      'description': instance.description,
      'privacy': _$DiscussionGroupPrivacyEnumMap[instance.privacy]!,
      'createdAt': const DateTimeTimestampConverter().toJson(instance.createdAt),
      'updatedAt': const DateTimeOptionTimestampConverter().toJson(instance.updatedAt),
    };

const _$DiscussionGroupPrivacyEnumMap = {
  DiscussionGroupPrivacy.public: 'public',
  DiscussionGroupPrivacy.private: 'private',
};
