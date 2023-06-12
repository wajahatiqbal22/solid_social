// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:solid_social/exceptions/db_exception/db_exception.dart';

part 'loading_state.freezed.dart';

@freezed
abstract class LoadingState<T> with _$LoadingState<T> {
  const LoadingState._();

  const factory LoadingState.loaded(T? data) = _Loaded;
  const factory LoadingState.error(DBException error) = _Error;
  const factory LoadingState.loading() = _Loading;
}
