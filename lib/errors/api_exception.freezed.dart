// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApiException {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiException()';
}


}

/// @nodoc
class $ApiExceptionCopyWith<$Res>  {
$ApiExceptionCopyWith(ApiException _, $Res Function(ApiException) __);
}


/// Adds pattern-matching-related methods to [ApiException].
extension ApiExceptionPatterns on ApiException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ServerException value)?  serverException,TResult Function( _Network value)?  network,TResult Function( _UnAuthorizedException value)?  unAuthorizedException,TResult Function( _ForbiddenException value)?  forbiddenException,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerException() when serverException != null:
return serverException(_that);case _Network() when network != null:
return network(_that);case _UnAuthorizedException() when unAuthorizedException != null:
return unAuthorizedException(_that);case _ForbiddenException() when forbiddenException != null:
return forbiddenException(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ServerException value)  serverException,required TResult Function( _Network value)  network,required TResult Function( _UnAuthorizedException value)  unAuthorizedException,required TResult Function( _ForbiddenException value)  forbiddenException,}){
final _that = this;
switch (_that) {
case _ServerException():
return serverException(_that);case _Network():
return network(_that);case _UnAuthorizedException():
return unAuthorizedException(_that);case _ForbiddenException():
return forbiddenException(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ServerException value)?  serverException,TResult? Function( _Network value)?  network,TResult? Function( _UnAuthorizedException value)?  unAuthorizedException,TResult? Function( _ForbiddenException value)?  forbiddenException,}){
final _that = this;
switch (_that) {
case _ServerException() when serverException != null:
return serverException(_that);case _Network() when network != null:
return network(_that);case _UnAuthorizedException() when unAuthorizedException != null:
return unAuthorizedException(_that);case _ForbiddenException() when forbiddenException != null:
return forbiddenException(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  serverException,TResult Function()?  network,TResult Function( String? message)?  unAuthorizedException,TResult Function( String? message)?  forbiddenException,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerException() when serverException != null:
return serverException(_that.message);case _Network() when network != null:
return network();case _UnAuthorizedException() when unAuthorizedException != null:
return unAuthorizedException(_that.message);case _ForbiddenException() when forbiddenException != null:
return forbiddenException(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  serverException,required TResult Function()  network,required TResult Function( String? message)  unAuthorizedException,required TResult Function( String? message)  forbiddenException,}) {final _that = this;
switch (_that) {
case _ServerException():
return serverException(_that.message);case _Network():
return network();case _UnAuthorizedException():
return unAuthorizedException(_that.message);case _ForbiddenException():
return forbiddenException(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  serverException,TResult? Function()?  network,TResult? Function( String? message)?  unAuthorizedException,TResult? Function( String? message)?  forbiddenException,}) {final _that = this;
switch (_that) {
case _ServerException() when serverException != null:
return serverException(_that.message);case _Network() when network != null:
return network();case _UnAuthorizedException() when unAuthorizedException != null:
return unAuthorizedException(_that.message);case _ForbiddenException() when forbiddenException != null:
return forbiddenException(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _ServerException implements ApiException {
  const _ServerException({required this.message});
  

 final  String message;

/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerExceptionCopyWith<_ServerException> get copyWith => __$ServerExceptionCopyWithImpl<_ServerException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApiException.serverException(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ServerExceptionCopyWith<$Res> implements $ApiExceptionCopyWith<$Res> {
  factory _$ServerExceptionCopyWith(_ServerException value, $Res Function(_ServerException) _then) = __$ServerExceptionCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ServerExceptionCopyWithImpl<$Res>
    implements _$ServerExceptionCopyWith<$Res> {
  __$ServerExceptionCopyWithImpl(this._self, this._then);

  final _ServerException _self;
  final $Res Function(_ServerException) _then;

/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ServerException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Network implements ApiException {
  const _Network();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Network);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiException.network()';
}


}




/// @nodoc


class _UnAuthorizedException implements ApiException {
  const _UnAuthorizedException({this.message});
  

 final  String? message;

/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnAuthorizedExceptionCopyWith<_UnAuthorizedException> get copyWith => __$UnAuthorizedExceptionCopyWithImpl<_UnAuthorizedException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnAuthorizedException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApiException.unAuthorizedException(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnAuthorizedExceptionCopyWith<$Res> implements $ApiExceptionCopyWith<$Res> {
  factory _$UnAuthorizedExceptionCopyWith(_UnAuthorizedException value, $Res Function(_UnAuthorizedException) _then) = __$UnAuthorizedExceptionCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$UnAuthorizedExceptionCopyWithImpl<$Res>
    implements _$UnAuthorizedExceptionCopyWith<$Res> {
  __$UnAuthorizedExceptionCopyWithImpl(this._self, this._then);

  final _UnAuthorizedException _self;
  final $Res Function(_UnAuthorizedException) _then;

/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_UnAuthorizedException(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _ForbiddenException implements ApiException {
  const _ForbiddenException({this.message});
  

 final  String? message;

/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForbiddenExceptionCopyWith<_ForbiddenException> get copyWith => __$ForbiddenExceptionCopyWithImpl<_ForbiddenException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForbiddenException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApiException.forbiddenException(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ForbiddenExceptionCopyWith<$Res> implements $ApiExceptionCopyWith<$Res> {
  factory _$ForbiddenExceptionCopyWith(_ForbiddenException value, $Res Function(_ForbiddenException) _then) = __$ForbiddenExceptionCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$ForbiddenExceptionCopyWithImpl<$Res>
    implements _$ForbiddenExceptionCopyWith<$Res> {
  __$ForbiddenExceptionCopyWithImpl(this._self, this._then);

  final _ForbiddenException _self;
  final $Res Function(_ForbiddenException) _then;

/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_ForbiddenException(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
