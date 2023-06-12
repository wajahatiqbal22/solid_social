// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'db_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DBException {
  String? get message => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? code) docNotFound,
    required TResult Function(String? message, String? code) error,
    required TResult Function(String? message, String? code) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? code)? docNotFound,
    TResult? Function(String? message, String? code)? error,
    TResult? Function(String? message, String? code)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? code)? docNotFound,
    TResult Function(String? message, String? code)? error,
    TResult Function(String? message, String? code)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DocNotFound value) docNotFound,
    required TResult Function(_Error value) error,
    required TResult Function(_Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DocNotFound value)? docNotFound,
    TResult? Function(_Error value)? error,
    TResult? Function(_Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DocNotFound value)? docNotFound,
    TResult Function(_Error value)? error,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DBExceptionCopyWith<DBException> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DBExceptionCopyWith<$Res> {
  factory $DBExceptionCopyWith(DBException value, $Res Function(DBException) then) =
      _$DBExceptionCopyWithImpl<$Res, DBException>;
  @useResult
  $Res call({String? message, String? code});
}

/// @nodoc
class _$DBExceptionCopyWithImpl<$Res, $Val extends DBException> implements $DBExceptionCopyWith<$Res> {
  _$DBExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DocNotFoundCopyWith<$Res> implements $DBExceptionCopyWith<$Res> {
  factory _$$_DocNotFoundCopyWith(_$_DocNotFound value, $Res Function(_$_DocNotFound) then) =
      __$$_DocNotFoundCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? code});
}

/// @nodoc
class __$$_DocNotFoundCopyWithImpl<$Res> extends _$DBExceptionCopyWithImpl<$Res, _$_DocNotFound>
    implements _$$_DocNotFoundCopyWith<$Res> {
  __$$_DocNotFoundCopyWithImpl(_$_DocNotFound _value, $Res Function(_$_DocNotFound) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_DocNotFound(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_DocNotFound extends _DocNotFound {
  const _$_DocNotFound([this.message, this.code]) : super._();

  @override
  final String? message;
  @override
  final String? code;

  @override
  String toString() {
    return 'DBException.docNotFound(message: $message, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DocNotFound &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DocNotFoundCopyWith<_$_DocNotFound> get copyWith =>
      __$$_DocNotFoundCopyWithImpl<_$_DocNotFound>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? code) docNotFound,
    required TResult Function(String? message, String? code) error,
    required TResult Function(String? message, String? code) unknown,
  }) {
    return docNotFound(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? code)? docNotFound,
    TResult? Function(String? message, String? code)? error,
    TResult? Function(String? message, String? code)? unknown,
  }) {
    return docNotFound?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? code)? docNotFound,
    TResult Function(String? message, String? code)? error,
    TResult Function(String? message, String? code)? unknown,
    required TResult orElse(),
  }) {
    if (docNotFound != null) {
      return docNotFound(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DocNotFound value) docNotFound,
    required TResult Function(_Error value) error,
    required TResult Function(_Unknown value) unknown,
  }) {
    return docNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DocNotFound value)? docNotFound,
    TResult? Function(_Error value)? error,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return docNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DocNotFound value)? docNotFound,
    TResult Function(_Error value)? error,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (docNotFound != null) {
      return docNotFound(this);
    }
    return orElse();
  }
}

abstract class _DocNotFound extends DBException {
  const factory _DocNotFound([final String? message, final String? code]) = _$_DocNotFound;
  const _DocNotFound._() : super._();

  @override
  String? get message;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$_DocNotFoundCopyWith<_$_DocNotFound> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> implements $DBExceptionCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) = __$$_ErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? code});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res> extends _$DBExceptionCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_Error(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Error extends _Error {
  const _$_Error([this.message, this.code]) : super._();

  @override
  final String? message;
  @override
  final String? code;

  @override
  String toString() {
    return 'DBException.error(message: $message, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith => __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? code) docNotFound,
    required TResult Function(String? message, String? code) error,
    required TResult Function(String? message, String? code) unknown,
  }) {
    return error(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? code)? docNotFound,
    TResult? Function(String? message, String? code)? error,
    TResult? Function(String? message, String? code)? unknown,
  }) {
    return error?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? code)? docNotFound,
    TResult Function(String? message, String? code)? error,
    TResult Function(String? message, String? code)? unknown,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DocNotFound value) docNotFound,
    required TResult Function(_Error value) error,
    required TResult Function(_Unknown value) unknown,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DocNotFound value)? docNotFound,
    TResult? Function(_Error value)? error,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DocNotFound value)? docNotFound,
    TResult Function(_Error value)? error,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends DBException {
  const factory _Error([final String? message, final String? code]) = _$_Error;
  const _Error._() : super._();

  @override
  String? get message;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UnknownCopyWith<$Res> implements $DBExceptionCopyWith<$Res> {
  factory _$$_UnknownCopyWith(_$_Unknown value, $Res Function(_$_Unknown) then) = __$$_UnknownCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? code});
}

/// @nodoc
class __$$_UnknownCopyWithImpl<$Res> extends _$DBExceptionCopyWithImpl<$Res, _$_Unknown>
    implements _$$_UnknownCopyWith<$Res> {
  __$$_UnknownCopyWithImpl(_$_Unknown _value, $Res Function(_$_Unknown) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_Unknown(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Unknown extends _Unknown {
  const _$_Unknown([this.message, this.code]) : super._();

  @override
  final String? message;
  @override
  final String? code;

  @override
  String toString() {
    return 'DBException.unknown(message: $message, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Unknown &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnknownCopyWith<_$_Unknown> get copyWith => __$$_UnknownCopyWithImpl<_$_Unknown>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? code) docNotFound,
    required TResult Function(String? message, String? code) error,
    required TResult Function(String? message, String? code) unknown,
  }) {
    return unknown(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? code)? docNotFound,
    TResult? Function(String? message, String? code)? error,
    TResult? Function(String? message, String? code)? unknown,
  }) {
    return unknown?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? code)? docNotFound,
    TResult Function(String? message, String? code)? error,
    TResult Function(String? message, String? code)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DocNotFound value) docNotFound,
    required TResult Function(_Error value) error,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DocNotFound value)? docNotFound,
    TResult? Function(_Error value)? error,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DocNotFound value)? docNotFound,
    TResult Function(_Error value)? error,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown extends DBException {
  const factory _Unknown([final String? message, final String? code]) = _$_Unknown;
  const _Unknown._() : super._();

  @override
  String? get message;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$_UnknownCopyWith<_$_Unknown> get copyWith => throw _privateConstructorUsedError;
}
