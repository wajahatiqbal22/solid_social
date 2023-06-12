import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

part 'timeline_data_state.freezed.dart';

@freezed
abstract class TimelineDataState implements _$TimelineDataState {
  const factory TimelineDataState.loaded() = _Loaded;
  const factory TimelineDataState.error() = _Error;
  const factory TimelineDataState.loading() = _Loading;
  const factory TimelineDataState.idle() = _Idle;
  const factory TimelineDataState.assembledChannel(Channel channel) = _AssembledChannel;
}
