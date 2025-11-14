// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FormStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FormStatus()';
}


}

/// @nodoc
class $FormStatusCopyWith<$Res>  {
$FormStatusCopyWith(FormStatus _, $Res Function(FormStatus) __);
}


/// Adds pattern-matching-related methods to [FormStatus].
extension FormStatusPatterns on FormStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Invalid value)?  invalid,TResult Function( _Submitting value)?  submitting,TResult Function( _Error value)?  error,TResult Function( _SuccessWithData value)?  successWithData,TResult Function( _Success value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Invalid() when invalid != null:
return invalid(_that);case _Submitting() when submitting != null:
return submitting(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Invalid value)  invalid,required TResult Function( _Submitting value)  submitting,required TResult Function( _Error value)  error,required TResult Function( _SuccessWithData value)  successWithData,required TResult Function( _Success value)  success,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Invalid():
return invalid(_that);case _Submitting():
return submitting(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Invalid value)?  invalid,TResult? Function( _Submitting value)?  submitting,TResult? Function( _Error value)?  error,TResult? Function( _SuccessWithData value)?  successWithData,TResult? Function( _Success value)?  success,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Invalid() when invalid != null:
return invalid(_that);case _Submitting() when submitting != null:
return submitting(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String? message)?  invalid,TResult Function()?  submitting,TResult Function( String? error)?  error,TResult Function( ResponseData<dynamic>? data)?  successWithData,TResult Function( String? message)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Invalid() when invalid != null:
return invalid(_that.message);case _Submitting() when submitting != null:
return submitting();case _Error() when error != null:
return error(_that.error);case _SuccessWithData() when successWithData != null:
return successWithData(_that.data);case _Success() when success != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String? message)  invalid,required TResult Function()  submitting,required TResult Function( String? error)  error,required TResult Function( ResponseData<dynamic>? data)  successWithData,required TResult Function( String? message)  success,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Invalid():
return invalid(_that.message);case _Submitting():
return submitting();case _Error():
return error(_that.error);case _SuccessWithData():
return successWithData(_that.data);case _Success():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String? message)?  invalid,TResult? Function()?  submitting,TResult? Function( String? error)?  error,TResult? Function( ResponseData<dynamic>? data)?  successWithData,TResult? Function( String? message)?  success,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Invalid() when invalid != null:
return invalid(_that.message);case _Submitting() when submitting != null:
return submitting();case _Error() when error != null:
return error(_that.error);case _SuccessWithData() when successWithData != null:
return successWithData(_that.data);case _Success() when success != null:
return success(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements FormStatus {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FormStatus.initial()';
}


}




/// @nodoc


class _Invalid implements FormStatus {
  const _Invalid({this.message});
  

 final  String? message;

/// Create a copy of FormStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvalidCopyWith<_Invalid> get copyWith => __$InvalidCopyWithImpl<_Invalid>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Invalid&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'FormStatus.invalid(message: $message)';
}


}

/// @nodoc
abstract mixin class _$InvalidCopyWith<$Res> implements $FormStatusCopyWith<$Res> {
  factory _$InvalidCopyWith(_Invalid value, $Res Function(_Invalid) _then) = __$InvalidCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$InvalidCopyWithImpl<$Res>
    implements _$InvalidCopyWith<$Res> {
  __$InvalidCopyWithImpl(this._self, this._then);

  final _Invalid _self;
  final $Res Function(_Invalid) _then;

/// Create a copy of FormStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_Invalid(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Submitting implements FormStatus {
  const _Submitting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FormStatus.submitting()';
}


}




/// @nodoc


class _Error implements FormStatus {
  const _Error({this.error});
  

 final  String? error;

/// Create a copy of FormStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'FormStatus.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $FormStatusCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String? error
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of FormStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(_Error(
error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SuccessWithData implements FormStatus {
  const _SuccessWithData({this.data});
  

 final  ResponseData<dynamic>? data;

/// Create a copy of FormStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessWithDataCopyWith<_SuccessWithData> get copyWith => __$SuccessWithDataCopyWithImpl<_SuccessWithData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessWithData&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'FormStatus.successWithData(data: $data)';
}


}

/// @nodoc
abstract mixin class _$SuccessWithDataCopyWith<$Res> implements $FormStatusCopyWith<$Res> {
  factory _$SuccessWithDataCopyWith(_SuccessWithData value, $Res Function(_SuccessWithData) _then) = __$SuccessWithDataCopyWithImpl;
@useResult
$Res call({
 ResponseData<dynamic>? data
});




}
/// @nodoc
class __$SuccessWithDataCopyWithImpl<$Res>
    implements _$SuccessWithDataCopyWith<$Res> {
  __$SuccessWithDataCopyWithImpl(this._self, this._then);

  final _SuccessWithData _self;
  final $Res Function(_SuccessWithData) _then;

/// Create a copy of FormStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_SuccessWithData(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ResponseData<dynamic>?,
  ));
}


}

/// @nodoc


class _Success implements FormStatus {
  const _Success({this.message});
  

 final  String? message;

/// Create a copy of FormStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'FormStatus.success(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $FormStatusCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of FormStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_Success(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
