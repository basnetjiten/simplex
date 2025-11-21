// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bloc_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BlocStatus<T extends Object?> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlocStatus<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlocStatus<$T>()';
}


}

/// @nodoc
class $BlocStatusCopyWith<T extends Object?,$Res>  {
$BlocStatusCopyWith(BlocStatus<T> _, $Res Function(BlocStatus<T>) __);
}


/// Adds pattern-matching-related methods to [BlocStatus].
extension BlocStatusPatterns<T extends Object?> on BlocStatus<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<T> value)?  initial,TResult Function( _Invalid<T> value)?  invalid,TResult Function( _Loading<T> value)?  loading,TResult Function( _Error<T> value)?  error,TResult Function( _SuccessWithData<T> value)?  successWithData,TResult Function( _Success<T> value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Invalid() when invalid != null:
return invalid(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _SuccessWithData() when successWithData != null:
return successWithData(_that);case _Success() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<T> value)  initial,required TResult Function( _Invalid<T> value)  invalid,required TResult Function( _Loading<T> value)  loading,required TResult Function( _Error<T> value)  error,required TResult Function( _SuccessWithData<T> value)  successWithData,required TResult Function( _Success<T> value)  success,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Invalid():
return invalid(_that);case _Loading():
return loading(_that);case _Error():
return error(_that);case _SuccessWithData():
return successWithData(_that);case _Success():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<T> value)?  initial,TResult? Function( _Invalid<T> value)?  invalid,TResult? Function( _Loading<T> value)?  loading,TResult? Function( _Error<T> value)?  error,TResult? Function( _SuccessWithData<T> value)?  successWithData,TResult? Function( _Success<T> value)?  success,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Invalid() when invalid != null:
return invalid(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _SuccessWithData() when successWithData != null:
return successWithData(_that);case _Success() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String? message)?  invalid,TResult Function()?  loading,TResult Function( String? error)?  error,TResult Function( T data,  String? message)?  successWithData,TResult Function( String? message)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Invalid() when invalid != null:
return invalid(_that.message);case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.error);case _SuccessWithData() when successWithData != null:
return successWithData(_that.data,_that.message);case _Success() when success != null:
return success(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String? message)  invalid,required TResult Function()  loading,required TResult Function( String? error)  error,required TResult Function( T data,  String? message)  successWithData,required TResult Function( String? message)  success,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Invalid():
return invalid(_that.message);case _Loading():
return loading();case _Error():
return error(_that.error);case _SuccessWithData():
return successWithData(_that.data,_that.message);case _Success():
return success(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String? message)?  invalid,TResult? Function()?  loading,TResult? Function( String? error)?  error,TResult? Function( T data,  String? message)?  successWithData,TResult? Function( String? message)?  success,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Invalid() when invalid != null:
return invalid(_that.message);case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.error);case _SuccessWithData() when successWithData != null:
return successWithData(_that.data,_that.message);case _Success() when success != null:
return success(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial<T extends Object?> extends BlocStatus<T> {
  const _Initial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlocStatus<$T>.initial()';
}


}




/// @nodoc


class _Invalid<T extends Object?> extends BlocStatus<T> {
  const _Invalid({this.message}): super._();
  

 final  String? message;

/// Create a copy of BlocStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvalidCopyWith<T, _Invalid<T>> get copyWith => __$InvalidCopyWithImpl<T, _Invalid<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Invalid<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'BlocStatus<$T>.invalid(message: $message)';
}


}

/// @nodoc
abstract mixin class _$InvalidCopyWith<T extends Object?,$Res> implements $BlocStatusCopyWith<T, $Res> {
  factory _$InvalidCopyWith(_Invalid<T> value, $Res Function(_Invalid<T>) _then) = __$InvalidCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$InvalidCopyWithImpl<T extends Object?,$Res>
    implements _$InvalidCopyWith<T, $Res> {
  __$InvalidCopyWithImpl(this._self, this._then);

  final _Invalid<T> _self;
  final $Res Function(_Invalid<T>) _then;

/// Create a copy of BlocStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_Invalid<T>(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Loading<T extends Object?> extends BlocStatus<T> {
  const _Loading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BlocStatus<$T>.loading()';
}


}




/// @nodoc


class _Error<T extends Object?> extends BlocStatus<T> {
  const _Error({this.error}): super._();
  

 final  String? error;

/// Create a copy of BlocStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<T, _Error<T>> get copyWith => __$ErrorCopyWithImpl<T, _Error<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error<T>&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'BlocStatus<$T>.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<T extends Object?,$Res> implements $BlocStatusCopyWith<T, $Res> {
  factory _$ErrorCopyWith(_Error<T> value, $Res Function(_Error<T>) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String? error
});




}
/// @nodoc
class __$ErrorCopyWithImpl<T extends Object?,$Res>
    implements _$ErrorCopyWith<T, $Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error<T> _self;
  final $Res Function(_Error<T>) _then;

/// Create a copy of BlocStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(_Error<T>(
error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SuccessWithData<T extends Object?> extends BlocStatus<T> {
  const _SuccessWithData(this.data, {this.message}): super._();
  

 final  T data;
 final  String? message;

/// Create a copy of BlocStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessWithDataCopyWith<T, _SuccessWithData<T>> get copyWith => __$SuccessWithDataCopyWithImpl<T, _SuccessWithData<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessWithData<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),message);

@override
String toString() {
  return 'BlocStatus<$T>.successWithData(data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SuccessWithDataCopyWith<T extends Object?,$Res> implements $BlocStatusCopyWith<T, $Res> {
  factory _$SuccessWithDataCopyWith(_SuccessWithData<T> value, $Res Function(_SuccessWithData<T>) _then) = __$SuccessWithDataCopyWithImpl;
@useResult
$Res call({
 T data, String? message
});




}
/// @nodoc
class __$SuccessWithDataCopyWithImpl<T extends Object?,$Res>
    implements _$SuccessWithDataCopyWith<T, $Res> {
  __$SuccessWithDataCopyWithImpl(this._self, this._then);

  final _SuccessWithData<T> _self;
  final $Res Function(_SuccessWithData<T>) _then;

/// Create a copy of BlocStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? message = freezed,}) {
  return _then(_SuccessWithData<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Success<T extends Object?> extends BlocStatus<T> {
  const _Success({this.message}): super._();
  

 final  String? message;

/// Create a copy of BlocStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<T, _Success<T>> get copyWith => __$SuccessCopyWithImpl<T, _Success<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'BlocStatus<$T>.success(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<T extends Object?,$Res> implements $BlocStatusCopyWith<T, $Res> {
  factory _$SuccessCopyWith(_Success<T> value, $Res Function(_Success<T>) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$SuccessCopyWithImpl<T extends Object?,$Res>
    implements _$SuccessCopyWith<T, $Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success<T> _self;
  final $Res Function(_Success<T>) _then;

/// Create a copy of BlocStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_Success<T>(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
