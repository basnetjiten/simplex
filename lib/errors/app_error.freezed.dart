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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppError()';
}


}

/// @nodoc
class $AppErrorCopyWith<$Res>  {
$AppErrorCopyWith(AppError _, $Res Function(AppError) __);
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  serverError,TResult Function( String message)?  validationError,TResult Function()?  unAuthorized,TResult Function()?  unAuthenticated,TResult Function()?  noInternet,TResult Function( String message)?  timeOut,TResult Function( String message)?  unSupportedPlatform,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that.message);case _ValidationError() when validationError != null:
return validationError(_that.message);case _UnAuthorized() when unAuthorized != null:
return unAuthorized();case _UnAuthenticated() when unAuthenticated != null:
return unAuthenticated();case _NoInternet() when noInternet != null:
return noInternet();case _TimeOut() when timeOut != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  serverError,required TResult Function( String message)  validationError,required TResult Function()  unAuthorized,required TResult Function()  unAuthenticated,required TResult Function()  noInternet,required TResult Function( String message)  timeOut,required TResult Function( String message)  unSupportedPlatform,}) {final _that = this;
switch (_that) {
case _ServerError():
return serverError(_that.message);case _ValidationError():
return validationError(_that.message);case _UnAuthorized():
return unAuthorized();case _UnAuthenticated():
return unAuthenticated();case _NoInternet():
return noInternet();case _TimeOut():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  serverError,TResult? Function( String message)?  validationError,TResult? Function()?  unAuthorized,TResult? Function()?  unAuthenticated,TResult? Function()?  noInternet,TResult? Function( String message)?  timeOut,TResult? Function( String message)?  unSupportedPlatform,}) {final _that = this;
switch (_that) {
case _ServerError() when serverError != null:
return serverError(_that.message);case _ValidationError() when validationError != null:
return validationError(_that.message);case _UnAuthorized() when unAuthorized != null:
return unAuthorized();case _UnAuthenticated() when unAuthenticated != null:
return unAuthenticated();case _NoInternet() when noInternet != null:
return noInternet();case _TimeOut() when timeOut != null:
return timeOut(_that.message);case _UnSupportedPlatform() when unSupportedPlatform != null:
return unSupportedPlatform(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _ServerError implements AppError {
  const _ServerError({required this.message});
  

 final  String message;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
@useResult
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
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ServerError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ValidationError implements AppError {
  const _ValidationError({required this.message});
  

 final  String message;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
@useResult
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
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ValidationError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UnAuthorized implements AppError {
  const _UnAuthorized();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnAuthorized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppError.unAuthorized()';
}


}




/// @nodoc


class _UnAuthenticated implements AppError {
  const _UnAuthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnAuthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppError.unAuthenticated()';
}


}




/// @nodoc


class _NoInternet implements AppError {
  const _NoInternet();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoInternet);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppError.noInternet()';
}


}




/// @nodoc


class _TimeOut implements AppError {
  const _TimeOut({required this.message});
  

 final  String message;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
@useResult
$Res call({
 String message
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
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_TimeOut(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UnSupportedPlatform implements AppError {
  const _UnSupportedPlatform({required this.message});
  

 final  String message;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
@useResult
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
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_UnSupportedPlatform(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
