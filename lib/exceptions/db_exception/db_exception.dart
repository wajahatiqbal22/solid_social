// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'db_exception.freezed.dart';

@freezed
abstract class DBException with _$DBException implements Exception {
  const DBException._();

  const factory DBException.docNotFound([String? message, String? code]) = _DocNotFound;
  const factory DBException.error([String? message, String? code]) = _Error;
  const factory DBException.unknown([String? message, String? code]) = _Unknown;
}
