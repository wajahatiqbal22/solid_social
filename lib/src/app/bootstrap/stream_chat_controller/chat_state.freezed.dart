// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(OwnUser? owner) connectedUser,
    required TResult Function() error,
    required TResult Function() connecting,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(OwnUser? owner)? connectedUser,
    TResult? Function()? error,
    TResult? Function()? connecting,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(OwnUser? owner)? connectedUser,
    TResult Function()? error,
    TResult Function()? connecting,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_ConnectedUser value) connectedUser,
    required TResult Function(_Error value) error,
    required TResult Function(_Connecting value) connecting,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_ConnectedUser value)? connectedUser,
    TResult? Function(_Error value)? error,
    TResult? Function(_Connecting value)? connecting,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_ConnectedUser value)? connectedUser,
    TResult Function(_Error value)? error,
    TResult Function(_Connecting value)? connecting,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) = _$ChatStateCopyWithImpl<$Res, ChatState>;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState> implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_IdleCopyWith<$Res> {
  factory _$$_IdleCopyWith(_$_Idle value, $Res Function(_$_Idle) then) = __$$_IdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_IdleCopyWithImpl<$Res> extends _$ChatStateCopyWithImpl<$Res, _$_Idle> implements _$$_IdleCopyWith<$Res> {
  __$$_IdleCopyWithImpl(_$_Idle _value, $Res Function(_$_Idle) _then) : super(_value, _then);
}

/// @nodoc

class _$_Idle implements _Idle {
  const _$_Idle();

  @override
  String toString() {
    return 'ChatState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(OwnUser? owner) connectedUser,
    required TResult Function() error,
    required TResult Function() connecting,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(OwnUser? owner)? connectedUser,
    TResult? Function()? error,
    TResult? Function()? connecting,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(OwnUser? owner)? connectedUser,
    TResult Function()? error,
    TResult Function()? connecting,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_ConnectedUser value) connectedUser,
    required TResult Function(_Error value) error,
    required TResult Function(_Connecting value) connecting,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_ConnectedUser value)? connectedUser,
    TResult? Function(_Error value)? error,
    TResult? Function(_Connecting value)? connecting,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_ConnectedUser value)? connectedUser,
    TResult Function(_Error value)? error,
    TResult Function(_Connecting value)? connecting,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements ChatState {
  const factory _Idle() = _$_Idle;
}

/// @nodoc
abstract class _$$_ConnectedUserCopyWith<$Res> {
  factory _$$_ConnectedUserCopyWith(_$_ConnectedUser value, $Res Function(_$_ConnectedUser) then) =
      __$$_ConnectedUserCopyWithImpl<$Res>;
  @useResult
  $Res call({OwnUser? owner});
}

/// @nodoc
class __$$_ConnectedUserCopyWithImpl<$Res> extends _$ChatStateCopyWithImpl<$Res, _$_ConnectedUser>
    implements _$$_ConnectedUserCopyWith<$Res> {
  __$$_ConnectedUserCopyWithImpl(_$_ConnectedUser _value, $Res Function(_$_ConnectedUser) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = freezed,
  }) {
    return _then(_$_ConnectedUser(
      freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as OwnUser?,
    ));
  }
}

/// @nodoc

class _$_ConnectedUser implements _ConnectedUser {
  const _$_ConnectedUser([this.owner]);

  @override
  final OwnUser? owner;

  @override
  String toString() {
    return 'ChatState.connectedUser(owner: $owner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectedUser &&
            (identical(other.owner, owner) || other.owner == owner));
  }

  @override
  int get hashCode => Object.hash(runtimeType, owner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnectedUserCopyWith<_$_ConnectedUser> get copyWith =>
      __$$_ConnectedUserCopyWithImpl<_$_ConnectedUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(OwnUser? owner) connectedUser,
    required TResult Function() error,
    required TResult Function() connecting,
  }) {
    return connectedUser(owner);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(OwnUser? owner)? connectedUser,
    TResult? Function()? error,
    TResult? Function()? connecting,
  }) {
    return connectedUser?.call(owner);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(OwnUser? owner)? connectedUser,
    TResult Function()? error,
    TResult Function()? connecting,
    required TResult orElse(),
  }) {
    if (connectedUser != null) {
      return connectedUser(owner);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_ConnectedUser value) connectedUser,
    required TResult Function(_Error value) error,
    required TResult Function(_Connecting value) connecting,
  }) {
    return connectedUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_ConnectedUser value)? connectedUser,
    TResult? Function(_Error value)? error,
    TResult? Function(_Connecting value)? connecting,
  }) {
    return connectedUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_ConnectedUser value)? connectedUser,
    TResult Function(_Error value)? error,
    TResult Function(_Connecting value)? connecting,
    required TResult orElse(),
  }) {
    if (connectedUser != null) {
      return connectedUser(this);
    }
    return orElse();
  }
}

abstract class _ConnectedUser implements ChatState {
  const factory _ConnectedUser([final OwnUser? owner]) = _$_ConnectedUser;

  OwnUser? get owner;
  @JsonKey(ignore: true)
  _$$_ConnectedUserCopyWith<_$_ConnectedUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) = __$$_ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res> extends _$ChatStateCopyWithImpl<$Res, _$_Error> implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then) : super(_value, _then);
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error();

  @override
  String toString() {
    return 'ChatState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(OwnUser? owner) connectedUser,
    required TResult Function() error,
    required TResult Function() connecting,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(OwnUser? owner)? connectedUser,
    TResult? Function()? error,
    TResult? Function()? connecting,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(OwnUser? owner)? connectedUser,
    TResult Function()? error,
    TResult Function()? connecting,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_ConnectedUser value) connectedUser,
    required TResult Function(_Error value) error,
    required TResult Function(_Connecting value) connecting,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_ConnectedUser value)? connectedUser,
    TResult? Function(_Error value)? error,
    TResult? Function(_Connecting value)? connecting,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_ConnectedUser value)? connectedUser,
    TResult Function(_Error value)? error,
    TResult Function(_Connecting value)? connecting,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ChatState {
  const factory _Error() = _$_Error;
}

/// @nodoc
abstract class _$$_ConnectingCopyWith<$Res> {
  factory _$$_ConnectingCopyWith(_$_Connecting value, $Res Function(_$_Connecting) then) =
      __$$_ConnectingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ConnectingCopyWithImpl<$Res> extends _$ChatStateCopyWithImpl<$Res, _$_Connecting>
    implements _$$_ConnectingCopyWith<$Res> {
  __$$_ConnectingCopyWithImpl(_$_Connecting _value, $Res Function(_$_Connecting) _then) : super(_value, _then);
}

/// @nodoc

class _$_Connecting implements _Connecting {
  const _$_Connecting();

  @override
  String toString() {
    return 'ChatState.connecting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_Connecting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(OwnUser? owner) connectedUser,
    required TResult Function() error,
    required TResult Function() connecting,
  }) {
    return connecting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(OwnUser? owner)? connectedUser,
    TResult? Function()? error,
    TResult? Function()? connecting,
  }) {
    return connecting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(OwnUser? owner)? connectedUser,
    TResult Function()? error,
    TResult Function()? connecting,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_ConnectedUser value) connectedUser,
    required TResult Function(_Error value) error,
    required TResult Function(_Connecting value) connecting,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_ConnectedUser value)? connectedUser,
    TResult? Function(_Error value)? error,
    TResult? Function(_Connecting value)? connecting,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_ConnectedUser value)? connectedUser,
    TResult Function(_Error value)? error,
    TResult Function(_Connecting value)? connecting,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class _Connecting implements ChatState {
  const factory _Connecting() = _$_Connecting;
}
