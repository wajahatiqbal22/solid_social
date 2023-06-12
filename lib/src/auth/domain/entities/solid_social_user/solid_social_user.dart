// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'solid_social_user.freezed.dart';
part 'solid_social_user.g.dart';

@freezed
abstract class SolidSocialUser implements _$SolidSocialUser {
  const SolidSocialUser._();

  @JsonSerializable(explicitToJson: true)
  const factory SolidSocialUser({
    required String firstName,
    required String lastName,
    required String email,
    required String uid,
    String? phoneNumber,
    String? fcmToken,
    @Default(UserDetails()) UserDetails userDetails,
  }) = _SolidSocialUser;

  factory SolidSocialUser.fromJson(Map<String, dynamic> json) => _$SolidSocialUserFromJson(json);
  // Model for the user document in the database.

  //TOOD: Implement
}

@freezed
abstract class UserDetails implements _$UserDetails {
  const UserDetails._();

  const factory UserDetails({
    String? profileUrl,
    String? bannerUrl,
    String? bio,
  }) = _UserDetails;

  factory UserDetails.fromJson(Map<String, dynamic> json) => _$UserDetailsFromJson(json);
}
