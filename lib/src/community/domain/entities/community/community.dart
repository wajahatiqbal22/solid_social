// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:solid_social/shared/converters/datetime_timestamp_converter.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
abstract class Community implements _$Community {
  const Community._();

  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory Community({
    required String communityName,
    required List<String> areaOfInterest,
    required String ownerId,
    String? id,
    String? photoUrl,
    @DateTimeTimestampConverter() required DateTime createdAt,
    @DateTimeOptionTimestampConverter() DateTime? updatedAt,
    @Default(CommunityPrivacy.public) CommunityPrivacy privacy,
    String? shareLink,
    @Default({}) Map<String, bool> members,
  }) = _Community;

  factory Community.fromJson(Map<String, dynamic> json) =>
      _$CommunityFromJson(json);
  factory Community.newCommunity(String ownerId) => Community(
      communityName: "",
      areaOfInterest: List.empty(growable: true),
      ownerId: ownerId,
      createdAt: DateTime.now());
}

enum CommunityPrivacy { private, public }
