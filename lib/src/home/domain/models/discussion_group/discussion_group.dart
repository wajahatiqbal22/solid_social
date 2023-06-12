// ignore_for_file: invalid_annotation_target

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:solid_social/shared/converters/datetime_timestamp_converter.dart';

part 'discussion_group.freezed.dart';
part 'discussion_group.g.dart';

@freezed
abstract class DiscussionGroup implements _$DiscussionGroup {
  const DiscussionGroup._();

  @JsonSerializable(explicitToJson: true)
  const factory DiscussionGroup({
    required String id,
    required String ownerId,
    required String communityId,
    required String groupName,
    String? displayPhotoUrl,
    String? bannerUrl,
    String? topic,
    String? description,
    @Default(DiscussionGroupPrivacy.public) DiscussionGroupPrivacy privacy,
    @DateTimeTimestampConverter() required DateTime createdAt,
    @DateTimeOptionTimestampConverter() DateTime? updatedAt,
  }) = _DiscussionGroup;

  factory DiscussionGroup.fromJson(Map<String, dynamic> json) => _DiscussionGroup.fromJson(json);
  Map<String, dynamic> toStreamchatJson() {
    final data = toJson();
    data.removeWhere((key, value) => key == "createdAt" || key == "updatedAt" || key == "id");
    return {...data, "groupId": id};
  }
}

enum DiscussionGroupPrivacy { public, private }
