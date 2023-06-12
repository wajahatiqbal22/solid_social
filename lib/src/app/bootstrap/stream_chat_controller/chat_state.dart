// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

part 'chat_state.freezed.dart';

@freezed
abstract class ChatState implements _$ChatState {
  const factory ChatState.idle() = _Idle;
  const factory ChatState.connectedUser([OwnUser? owner]) = _ConnectedUser;
  const factory ChatState.error() = _Error;
  const factory ChatState.connecting() = _Connecting;
}
