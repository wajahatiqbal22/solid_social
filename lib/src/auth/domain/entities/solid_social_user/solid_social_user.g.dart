// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solid_social_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SolidSocialUser _$$_SolidSocialUserFromJson(Map<String, dynamic> json) => _$_SolidSocialUser(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      uid: json['uid'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      fcmToken: json['fcmToken'] as String?,
      userDetails: json['userDetails'] == null
          ? const UserDetails()
          : UserDetails.fromJson(json['userDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SolidSocialUserToJson(_$_SolidSocialUser instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'uid': instance.uid,
      'phoneNumber': instance.phoneNumber,
      'fcmToken': instance.fcmToken,
      'userDetails': instance.userDetails.toJson(),
    };

_$_UserDetails _$$_UserDetailsFromJson(Map<String, dynamic> json) => _$_UserDetails(
      profileUrl: json['profileUrl'] as String?,
      bannerUrl: json['bannerUrl'] as String?,
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$$_UserDetailsToJson(_$_UserDetails instance) => <String, dynamic>{
      'profileUrl': instance.profileUrl,
      'bannerUrl': instance.bannerUrl,
      'bio': instance.bio,
    };
