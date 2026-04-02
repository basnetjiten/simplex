// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppError {

 String? get message;
/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppErrorCopyWith<AppError> get copyWith => _$AppErrorCopyWithImpl<AppError>(this as AppError, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppError(message: $message)';
}


}

/// @nodoc
abstract mixin class $AppErrorCopyWith<$Res>  {
  factory $AppErrorCopyWith(AppError value, $Res Function(AppError) _then) = _$AppErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AppErrorCopyWithImpl<$Res>
    implements $AppErrorCopyWith<$Res> {
  _$AppErrorCopyWithImpl(this._self, this._then);

  final AppError _self;
  final $Res Function(AppError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message! : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AppError].
extension AppErrorPatterns on AppError {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ServerError value)?  serverError,TResult Function( _ValidationError value)?  validationError,TResult Function( _UnAuthorized value)?  unAuthorized,TResult Function( _UnAuthenticated value)?  unAuthenticated,TResult Function( _NoInternet value)?  noInternet,TResult Function( _TimeOut value)?  timeOut,TResult Function( _UnSupportedPlatform value)?  unSupportedPlatform,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that);case _ValidationError() when validationError != null:
return validationError(_that);case _UnAuthorized() when unAuthorized != null:
return unAuthorized(_that);case _UnAuthenticated() when unAuthenticated != null:
return unAuthenticated(_that);case _NoInternet() when noInternet != null:
return noInternet(_that);case _TimeOut() when timeOut != null:
return timeOut(_that);case _UnSupportedPlatform() when unSupportedPlatform != null:
return unSupportedPlatform(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ServerError value)  serverError,required TResult Function( _ValidationError value)  validationError,required TResult Function( _UnAuthorized value)  unAuthorized,required TResult Function( _UnAuthenticated value)  unAuthenticated,required TResult Function( _NoInternet value)  noInternet,required TResult Function( _TimeOut value)  timeOut,required TResult Function( _UnSupportedPlatform value)  unSupportedPlatform,}){
final _that = this;
switch (_that) {
case _ServerError():
return serverError(_that);case _ValidationError():
return validationError(_that);case _UnAuthorized():
return unAuthorized(_that);case _UnAuthenticated():
return unAuthenticated(_that);case _NoInternet():
return noInternet(_that);case _TimeOut():
return timeOut(_that);case _UnSupportedPlatform():
return unSupportedPlatform(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ServerError value)?  serverError,TResult? Function( _ValidationError value)?  validationError,TResult? Function( _UnAuthorized value)?  unAuthorized,TResult? Function( _UnAuthenticated value)?  unAuthenticated,TResult? Function( _NoInternet value)?  noInternet,TResult? Function( _TimeOut value)?  timeOut,TResult? Function( _UnSupportedPlatform value)?  unSupportedPlatform,}){
final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that);case _ValidationError() when validationError != null:
return validationError(_that);case _UnAuthorized() when unAuthorized != null:
return unAuthorized(_that);case _UnAuthenticated() when unAuthenticated != null:
return unAuthenticated(_that);case _NoInternet() when noInternet != null:
return noInternet(_that);case _TimeOut() when timeOut != null:
return timeOut(_that);case _UnSupportedPlatform() when unSupportedPlatform != null:
return unSupportedPlatform(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  serverError,TResult Function( String message)?  validationError,TResult Function( String? message)?  unAuthorized,TResult Function( String? message)?  unAuthenticated,TResult Function( String? message)?  noInternet,TResult Function( String? message)?  timeOut,TResult Function( String message)?  unSupportedPlatform,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that.message);case _ValidationError() when validationError != null:
return validationError(_that.message);case _UnAuthorized() when unAuthorized != null:
return unAuthorized(_that.message);case _UnAuthenticated() when unAuthenticated != null:
return unAuthenticated(_that.message);case _NoInternet() when noInternet != null:
return noInternet(_that.message);case _TimeOut() when timeOut != null:
return timeOut(_that.message);case _UnSupportedPlatform() when unSupportedPlatform != null:
return unSupportedPlatform(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  serverError,required TResult Function( String message)  validationError,required TResult Function( String? message)  unAuthorized,required TResult Function( String? message)  unAuthenticated,required TResult Function( String? message)  noInternet,required TResult Function( String? message)  timeOut,required TResult Function( String message)  unSupportedPlatform,}) {final _that = this;
switch (_that) {
case _ServerError():
return serverError(_that.message);case _ValidationError():
return validationError(_that.message);case _UnAuthorized():
return unAuthorized(_that.message);case _UnAuthenticated():
return unAuthenticated(_that.message);case _NoInternet():
return noInternet(_that.message);case _TimeOut():
return timeOut(_that.message);case _UnSupportedPlatform():
return unSupportedPlatform(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  serverError,TResult? Function( String message)?  validationError,TResult? Function( String? message)?  unAuthorized,TResult? Function( String? message)?  unAuthenticated,TResult? Function( String? message)?  noInternet,TResult? Function( String? message)?  timeOut,TResult? Function( String message)?  unSupportedPlatform,}) {final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that.message);case _ValidationError() when validationError != null:
return validationError(_that.message);case _UnAuthorized() when unAuthorized != null:
return unAuthorized(_that.message);case _UnAuthenticated() when unAuthenticated != null:
return unAuthenticated(_that.message);case _NoInternet() when noInternet != null:
return noInternet(_that.message);case _TimeOut() when timeOut != null:
return timeOut(_that.message);case _UnSupportedPlatform() when unSupportedPlatform != null:
return unSupportedPlatform(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _ServerError implements AppError {
  const _ServerError({required this.message});
  

@override final  String message;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerErrorCopyWith<_ServerError> get copyWith => __$ServerErrorCopyWithImpl<_ServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppError.serverError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ServerErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory _$ServerErrorCopyWith(_ServerError value, $Res Function(_ServerError) _then) = __$ServerErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ServerErrorCopyWithImpl<$Res>
    implements _$ServerErrorCopyWith<$Res> {
  __$ServerErrorCopyWithImpl(this._self, this._then);

  final _ServerError _self;
  final $Res Function(_ServerError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ServerError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ValidationError implements AppError {
  const _ValidationError({required this.message});
  

@override final  String message;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationErrorCopyWith<_ValidationError> get copyWith => __$ValidationErrorCopyWithImpl<_ValidationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppError.validationError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ValidationErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory _$ValidationErrorCopyWith(_ValidationError value, $Res Function(_ValidationError) _then) = __$ValidationErrorCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ValidationErrorCopyWithImpl<$Res>
    implements _$ValidationErrorCopyWith<$Res> {
  __$ValidationErrorCopyWithImpl(this._self, this._then);

  final _ValidationError _self;
  final $Res Function(_ValidationError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ValidationError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UnAuthorized implements AppError {
  const _UnAuthorized(this.message);
  

@override final  String? message;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnAuthorizedCopyWith<_UnAuthorized> get copyWith => __$UnAuthorizedCopyWithImpl<_UnAuthorized>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnAuthorized&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppError.unAuthorized(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnAuthorizedCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory _$UnAuthorizedCopyWith(_UnAuthorized value, $Res Function(_UnAuthorized) _then) = __$UnAuthorizedCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$UnAuthorizedCopyWithImpl<$Res>
    implements _$UnAuthorizedCopyWith<$Res> {
  __$UnAuthorizedCopyWithImpl(this._self, this._then);

  final _UnAuthorized _self;
  final $Res Function(_UnAuthorized) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_UnAuthorized(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _UnAuthenticated implements AppError {
  const _UnAuthenticated(this.message);
  

@override final  String? message;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnAuthenticatedCopyWith<_UnAuthenticated> get copyWith => __$UnAuthenticatedCopyWithImpl<_UnAuthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnAuthenticated&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppError.unAuthenticated(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnAuthenticatedCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory _$UnAuthenticatedCopyWith(_UnAuthenticated value, $Res Function(_UnAuthenticated) _then) = __$UnAuthenticatedCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$UnAuthenticatedCopyWithImpl<$Res>
    implements _$UnAuthenticatedCopyWith<$Res> {
  __$UnAuthenticatedCopyWithImpl(this._self, this._then);

  final _UnAuthenticated _self;
  final $Res Function(_UnAuthenticated) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_UnAuthenticated(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _NoInternet implements AppError {
  const _NoInternet(this.message);
  

@override final  String? message;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoInternetCopyWith<_NoInternet> get copyWith => __$NoInternetCopyWithImpl<_NoInternet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoInternet&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppError.noInternet(message: $message)';
}


}

/// @nodoc
abstract mixin class _$NoInternetCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory _$NoInternetCopyWith(_NoInternet value, $Res Function(_NoInternet) _then) = __$NoInternetCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$NoInternetCopyWithImpl<$Res>
    implements _$NoInternetCopyWith<$Res> {
  __$NoInternetCopyWithImpl(this._self, this._then);

  final _NoInternet _self;
  final $Res Function(_NoInternet) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_NoInternet(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _TimeOut implements AppError {
  const _TimeOut(this.message);
  

@override final  String? message;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeOutCopyWith<_TimeOut> get copyWith => __$TimeOutCopyWithImpl<_TimeOut>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeOut&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppError.timeOut(message: $message)';
}


}

/// @nodoc
abstract mixin class _$TimeOutCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory _$TimeOutCopyWith(_TimeOut value, $Res Function(_TimeOut) _then) = __$TimeOutCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$TimeOutCopyWithImpl<$Res>
    implements _$TimeOutCopyWith<$Res> {
  __$TimeOutCopyWithImpl(this._self, this._then);

  final _TimeOut _self;
  final $Res Function(_TimeOut) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_TimeOut(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _UnSupportedPlatform implements AppError {
  const _UnSupportedPlatform({required this.message});
  

@override final  String message;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnSupportedPlatformCopyWith<_UnSupportedPlatform> get copyWith => __$UnSupportedPlatformCopyWithImpl<_UnSupportedPlatform>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnSupportedPlatform&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppError.unSupportedPlatform(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnSupportedPlatformCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory _$UnSupportedPlatformCopyWith(_UnSupportedPlatform value, $Res Function(_UnSupportedPlatform) _then) = __$UnSupportedPlatformCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$UnSupportedPlatformCopyWithImpl<$Res>
    implements _$UnSupportedPlatformCopyWith<$Res> {
  __$UnSupportedPlatformCopyWithImpl(this._self, this._then);

  final _UnSupportedPlatform _self;
  final $Res Function(_UnSupportedPlatform) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_UnSupportedPlatform(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
