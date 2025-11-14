// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthException {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthException()';
}


}

/// @nodoc
class $AuthExceptionCopyWith<$Res>  {
$AuthExceptionCopyWith(AuthException _, $Res Function(AuthException) __);
}


/// Adds pattern-matching-related methods to [AuthException].
extension AuthExceptionPatterns on AuthException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthExceptionAborted value)?  aborted,TResult Function( _AuthExceptionUnexpected value)?  unexpected,TResult Function( _AuthExceptionNetwork value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthExceptionAborted() when aborted != null:
return aborted(_that);case _AuthExceptionUnexpected() when unexpected != null:
return unexpected(_that);case _AuthExceptionNetwork() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthExceptionAborted value)  aborted,required TResult Function( _AuthExceptionUnexpected value)  unexpected,required TResult Function( _AuthExceptionNetwork value)  error,}){
final _that = this;
switch (_that) {
case _AuthExceptionAborted():
return aborted(_that);case _AuthExceptionUnexpected():
return unexpected(_that);case _AuthExceptionNetwork():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthExceptionAborted value)?  aborted,TResult? Function( _AuthExceptionUnexpected value)?  unexpected,TResult? Function( _AuthExceptionNetwork value)?  error,}){
final _that = this;
switch (_that) {
case _AuthExceptionAborted() when aborted != null:
return aborted(_that);case _AuthExceptionUnexpected() when unexpected != null:
return unexpected(_that);case _AuthExceptionNetwork() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  aborted,TResult Function()?  unexpected,TResult Function( AppError error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthExceptionAborted() when aborted != null:
return aborted();case _AuthExceptionUnexpected() when unexpected != null:
return unexpected();case _AuthExceptionNetwork() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  aborted,required TResult Function()  unexpected,required TResult Function( AppError error)  error,}) {final _that = this;
switch (_that) {
case _AuthExceptionAborted():
return aborted();case _AuthExceptionUnexpected():
return unexpected();case _AuthExceptionNetwork():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  aborted,TResult? Function()?  unexpected,TResult? Function( AppError error)?  error,}) {final _that = this;
switch (_that) {
case _AuthExceptionAborted() when aborted != null:
return aborted();case _AuthExceptionUnexpected() when unexpected != null:
return unexpected();case _AuthExceptionNetwork() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _AuthExceptionAborted extends AuthException {
  const _AuthExceptionAborted(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthExceptionAborted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthException.aborted()';
}


}




/// @nodoc


class _AuthExceptionUnexpected extends AuthException {
  const _AuthExceptionUnexpected(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthExceptionUnexpected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthException.unexpected()';
}


}




/// @nodoc


class _AuthExceptionNetwork extends AuthException {
  const _AuthExceptionNetwork(this.error): super._();
  

 final  AppError error;

/// Create a copy of AuthException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthExceptionNetworkCopyWith<_AuthExceptionNetwork> get copyWith => __$AuthExceptionNetworkCopyWithImpl<_AuthExceptionNetwork>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthExceptionNetwork&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AuthException.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$AuthExceptionNetworkCopyWith<$Res> implements $AuthExceptionCopyWith<$Res> {
  factory _$AuthExceptionNetworkCopyWith(_AuthExceptionNetwork value, $Res Function(_AuthExceptionNetwork) _then) = __$AuthExceptionNetworkCopyWithImpl;
@useResult
$Res call({
 AppError error
});


$AppErrorCopyWith<$Res> get error;

}
/// @nodoc
class __$AuthExceptionNetworkCopyWithImpl<$Res>
    implements _$AuthExceptionNetworkCopyWith<$Res> {
  __$AuthExceptionNetworkCopyWithImpl(this._self, this._then);

  final _AuthExceptionNetwork _self;
  final $Res Function(_AuthExceptionNetwork) _then;

/// Create a copy of AuthException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_AuthExceptionNetwork(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of AuthException
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorCopyWith<$Res> get error {
  
  return $AppErrorCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
