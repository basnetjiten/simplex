// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_auth_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SocialAuthException {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialAuthException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SocialAuthException()';
}


}

/// @nodoc
class $SocialAuthExceptionCopyWith<$Res>  {
$SocialAuthExceptionCopyWith(SocialAuthException _, $Res Function(SocialAuthException) __);
}


/// Adds pattern-matching-related methods to [SocialAuthException].
extension SocialAuthExceptionPatterns on SocialAuthException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SocialAuthExceptionAborted value)?  aborted,TResult Function( _SocialAuthExceptionUnexpected value)?  unexpected,TResult Function( _SocialAuthExceptionNetwork value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SocialAuthExceptionAborted() when aborted != null:
return aborted(_that);case _SocialAuthExceptionUnexpected() when unexpected != null:
return unexpected(_that);case _SocialAuthExceptionNetwork() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SocialAuthExceptionAborted value)  aborted,required TResult Function( _SocialAuthExceptionUnexpected value)  unexpected,required TResult Function( _SocialAuthExceptionNetwork value)  error,}){
final _that = this;
switch (_that) {
case _SocialAuthExceptionAborted():
return aborted(_that);case _SocialAuthExceptionUnexpected():
return unexpected(_that);case _SocialAuthExceptionNetwork():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SocialAuthExceptionAborted value)?  aborted,TResult? Function( _SocialAuthExceptionUnexpected value)?  unexpected,TResult? Function( _SocialAuthExceptionNetwork value)?  error,}){
final _that = this;
switch (_that) {
case _SocialAuthExceptionAborted() when aborted != null:
return aborted(_that);case _SocialAuthExceptionUnexpected() when unexpected != null:
return unexpected(_that);case _SocialAuthExceptionNetwork() when error != null:
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
case _SocialAuthExceptionAborted() when aborted != null:
return aborted();case _SocialAuthExceptionUnexpected() when unexpected != null:
return unexpected();case _SocialAuthExceptionNetwork() when error != null:
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
case _SocialAuthExceptionAborted():
return aborted();case _SocialAuthExceptionUnexpected():
return unexpected();case _SocialAuthExceptionNetwork():
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
case _SocialAuthExceptionAborted() when aborted != null:
return aborted();case _SocialAuthExceptionUnexpected() when unexpected != null:
return unexpected();case _SocialAuthExceptionNetwork() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SocialAuthExceptionAborted extends SocialAuthException {
  const _SocialAuthExceptionAborted(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialAuthExceptionAborted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SocialAuthException.aborted()';
}


}




/// @nodoc


class _SocialAuthExceptionUnexpected extends SocialAuthException {
  const _SocialAuthExceptionUnexpected(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialAuthExceptionUnexpected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SocialAuthException.unexpected()';
}


}




/// @nodoc


class _SocialAuthExceptionNetwork extends SocialAuthException {
  const _SocialAuthExceptionNetwork(this.error): super._();
  

 final  AppError error;

/// Create a copy of SocialAuthException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialAuthExceptionNetworkCopyWith<_SocialAuthExceptionNetwork> get copyWith => __$SocialAuthExceptionNetworkCopyWithImpl<_SocialAuthExceptionNetwork>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialAuthExceptionNetwork&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SocialAuthException.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$SocialAuthExceptionNetworkCopyWith<$Res> implements $SocialAuthExceptionCopyWith<$Res> {
  factory _$SocialAuthExceptionNetworkCopyWith(_SocialAuthExceptionNetwork value, $Res Function(_SocialAuthExceptionNetwork) _then) = __$SocialAuthExceptionNetworkCopyWithImpl;
@useResult
$Res call({
 AppError error
});


$AppErrorCopyWith<$Res> get error;

}
/// @nodoc
class __$SocialAuthExceptionNetworkCopyWithImpl<$Res>
    implements _$SocialAuthExceptionNetworkCopyWith<$Res> {
  __$SocialAuthExceptionNetworkCopyWithImpl(this._self, this._then);

  final _SocialAuthExceptionNetwork _self;
  final $Res Function(_SocialAuthExceptionNetwork) _then;

/// Create a copy of SocialAuthException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_SocialAuthExceptionNetwork(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of SocialAuthException
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
