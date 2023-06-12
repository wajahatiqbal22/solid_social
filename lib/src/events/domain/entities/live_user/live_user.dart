import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solid_social/shared/converters/datetime_timestamp_converter.dart';
import 'package:solid_social/src/auth/domain/entities/solid_social_user/solid_social_user.dart';

part 'live_user.freezed.dart';
part 'live_user.g.dart';

@freezed
abstract class LiveUser implements _$LiveUser {
  const LiveUser._();

  @JsonSerializable(explicitToJson: true)
  const factory LiveUser({
    required String id,
    required String name,
    @DateTimeTimestampConverter() required DateTime joinedAt,
    required bool isHost,
    String? photoUrl,
    @Default(StreamStatus.broadcasting) StreamStatus streamStatus,
  }) = _LiveUser;

  factory LiveUser.fromJson(Map<String, dynamic> json) => _$LiveUserFromJson(json);
  factory LiveUser.fromSolidSocialUser(SolidSocialUser user, bool isHost) => LiveUser(
        id: user.uid,
        name: "${user.firstName} ${user.lastName}",
        joinedAt: DateTime.now(),
        isHost: isHost,
        photoUrl: user.userDetails.profileUrl,
      );
}

enum StreamStatus { broadcasting, pausedVideo, raisedHand }
