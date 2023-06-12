// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:solid_social/shared/converters/datetime_timestamp_converter.dart';

part 'member.freezed.dart';
part 'member.g.dart';

@freezed
abstract class Member implements _$Member {
  const Member._();

  @JsonSerializable(explicitToJson: true)
  const factory Member({
    required String userId,
    required String communityId,
    @DateTimeTimestampConverter() required DateTime joinedAt,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _Member.fromJson(json);
}
