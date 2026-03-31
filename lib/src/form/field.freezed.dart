// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Field<T> {

 T get value; String? get errorMessage; bool get isValid; bool get obscureText;

  /// Serializes this Field to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Field<T>&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.obscureText, obscureText) || other.obscureText == obscureText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value),errorMessage,isValid,obscureText);

@override
String toString() {
  return 'Field<$T>(value: $value, errorMessage: $errorMessage, isValid: $isValid, obscureText: $obscureText)';
}


}




/// Adds pattern-matching-related methods to [Field].
extension FieldPatterns<T> on Field<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Field<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Field() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Field<T> value)  $default,){
final _that = this;
switch (_that) {
case _Field():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Field<T> value)?  $default,){
final _that = this;
switch (_that) {
case _Field() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( T value,  String? errorMessage,  bool isValid,  bool obscureText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Field() when $default != null:
return $default(_that.value,_that.errorMessage,_that.isValid,_that.obscureText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( T value,  String? errorMessage,  bool isValid,  bool obscureText)  $default,) {final _that = this;
switch (_that) {
case _Field():
return $default(_that.value,_that.errorMessage,_that.isValid,_that.obscureText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( T value,  String? errorMessage,  bool isValid,  bool obscureText)?  $default,) {final _that = this;
switch (_that) {
case _Field() when $default != null:
return $default(_that.value,_that.errorMessage,_that.isValid,_that.obscureText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _Field<T> extends Field<T> {
  const _Field({required this.value, this.errorMessage, this.isValid = false, this.obscureText = false}): super._();
  factory _Field.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$FieldFromJson(json,fromJsonT);

@override final  T value;
@override final  String? errorMessage;
@override@JsonKey() final  bool isValid;
@override@JsonKey() final  bool obscureText;


@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$FieldToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Field<T>&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.obscureText, obscureText) || other.obscureText == obscureText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value),errorMessage,isValid,obscureText);

@override
String toString() {
  return 'Field<$T>(value: $value, errorMessage: $errorMessage, isValid: $isValid, obscureText: $obscureText)';
}


}




// dart format on
