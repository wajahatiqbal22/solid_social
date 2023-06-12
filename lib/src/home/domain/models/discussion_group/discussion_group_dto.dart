// Dart imports:
import 'dart:io';

class DiscussionGroupDTO {
  String title;
  String id;
  File? displayPhotoUrl;
  File? bannerUrl;
  String? topic;
  String? description;

  DiscussionGroupDTO(
      {required this.title, required this.id, this.bannerUrl, this.description, this.displayPhotoUrl, this.topic});

  factory DiscussionGroupDTO.fromJson(Map<String, dynamic> json) => DiscussionGroupDTO(
        title: json["title"],
        description: json["description"],
        topic: json["topic"],
        displayPhotoUrl: json["displayPhotoUrl"],
        bannerUrl: json["bannerUrl"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "topic": topic,
        "id": id,
      };
}
