// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:solid_social/shared/converters/datetime_timestamp_converter.dart';

part 'community_metadata.freezed.dart';
part 'community_metadata.g.dart';

@freezed
abstract class CommunityMetadata implements _$CommunityMetadata {
  const CommunityMetadata._();

  @JsonSerializable(explicitToJson: true)
  const factory CommunityMetadata({
    required String ownerId,
    required String communityName,
    required String requesterId,
    required String id,
    required String communityId,
    List<String>? areaOfInterests,
    String? photoUrl,
    @DateTimeOptionTimestampConverter() DateTime? joinedAt,
    @Default(CommunityRequestStatus.pending) CommunityRequestStatus status,
  }) = _CommunityMetadata;
  factory CommunityMetadata.fromJson(Map<String, dynamic> json) =>
      _$CommunityMetadataFromJson(json);
}

enum CommunityRequestStatus { accepted, declined, pending }
