import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solid_social/shared/converters/datetime_timestamp_converter.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
abstract class Event implements _$Event {
  const Event._();
  @JsonSerializable(explicitToJson: true)
  const factory Event({
    required String eventId,
    required String communityId,
    required String eventName,
    required bool isPrivate,
    required bool isRecording,
    required List<String> groupIds,
    required EventHost host,
    @DateTimeTimestampConverter() required DateTime createdAt,
    @DateTimeTimestampConverter() required DateTime eventDateTime,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

@freezed
abstract class EventHost implements _$EventHost {
  const EventHost._();

  @JsonSerializable(explicitToJson: true)
  const factory EventHost({
    required String hostId,
    required String hostName,
    String? profilePic,
  }) = _EventHost;

  factory EventHost.fromJson(Map<String, dynamic> json) => _$EventHostFromJson(json);
}
