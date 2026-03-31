// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paging_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PagingState<K,T> {

 List<List<T>>? get pages; List<K>? get keys; Object? get error; bool get hasNextPage; bool get isLoading; String? get search; PagingCancelToken? get cancelToken;
/// Create a copy of PagingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PagingStateCopyWith<K, T, PagingState<K, T>> get copyWith => _$PagingStateCopyWithImpl<K, T, PagingState<K, T>>(this as PagingState<K, T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PagingState<K, T>&&const DeepCollectionEquality().equals(other.pages, pages)&&const DeepCollectionEquality().equals(other.keys, keys)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.search, search) || other.search == search)&&(identical(other.cancelToken, cancelToken) || other.cancelToken == cancelToken));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(pages),const DeepCollectionEquality().hash(keys),const DeepCollectionEquality().hash(error),hasNextPage,isLoading,search,cancelToken);

@override
String toString() {
  return 'PagingState<$K, $T>(pages: $pages, keys: $keys, error: $error, hasNextPage: $hasNextPage, isLoading: $isLoading, search: $search, cancelToken: $cancelToken)';
}


}

/// @nodoc
abstract mixin class $PagingStateCopyWith<K,T,$Res>  {
  factory $PagingStateCopyWith(PagingState<K, T> value, $Res Function(PagingState<K, T>) _then) = _$PagingStateCopyWithImpl;
@useResult
$Res call({
 List<List<T>>? pages, List<K>? keys, Object? error, bool hasNextPage, bool isLoading, String? search, PagingCancelToken? cancelToken
});




}
/// @nodoc
class _$PagingStateCopyWithImpl<K,T,$Res>
    implements $PagingStateCopyWith<K, T, $Res> {
  _$PagingStateCopyWithImpl(this._self, this._then);

  final PagingState<K, T> _self;
  final $Res Function(PagingState<K, T>) _then;

/// Create a copy of PagingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pages = freezed,Object? keys = freezed,Object? error = freezed,Object? hasNextPage = null,Object? isLoading = null,Object? search = freezed,Object? cancelToken = freezed,}) {
  return _then(_self.copyWith(
pages: freezed == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as List<List<T>>?,keys: freezed == keys ? _self.keys : keys // ignore: cast_nullable_to_non_nullable
as List<K>?,error: freezed == error ? _self.error : error ,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,cancelToken: freezed == cancelToken ? _self.cancelToken : cancelToken // ignore: cast_nullable_to_non_nullable
as PagingCancelToken?,
  ));
}

}


/// Adds pattern-matching-related methods to [PagingState].
extension PagingStatePatterns<K,T> on PagingState<K, T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PagingState<K, T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PagingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PagingState<K, T> value)  $default,){
final _that = this;
switch (_that) {
case _PagingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PagingState<K, T> value)?  $default,){
final _that = this;
switch (_that) {
case _PagingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<List<T>>? pages,  List<K>? keys,  Object? error,  bool hasNextPage,  bool isLoading,  String? search,  PagingCancelToken? cancelToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PagingState() when $default != null:
return $default(_that.pages,_that.keys,_that.error,_that.hasNextPage,_that.isLoading,_that.search,_that.cancelToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<List<T>>? pages,  List<K>? keys,  Object? error,  bool hasNextPage,  bool isLoading,  String? search,  PagingCancelToken? cancelToken)  $default,) {final _that = this;
switch (_that) {
case _PagingState():
return $default(_that.pages,_that.keys,_that.error,_that.hasNextPage,_that.isLoading,_that.search,_that.cancelToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<List<T>>? pages,  List<K>? keys,  Object? error,  bool hasNextPage,  bool isLoading,  String? search,  PagingCancelToken? cancelToken)?  $default,) {final _that = this;
switch (_that) {
case _PagingState() when $default != null:
return $default(_that.pages,_that.keys,_that.error,_that.hasNextPage,_that.isLoading,_that.search,_that.cancelToken);case _:
  return null;

}
}

}

/// @nodoc


class _PagingState<K,T> extends PagingState<K, T> {
  const _PagingState({final  List<List<T>>? pages, final  List<K>? keys, this.error, this.hasNextPage = true, this.isLoading = false, this.search, this.cancelToken}): _pages = pages,_keys = keys,super._();
  

 final  List<List<T>>? _pages;
@override List<List<T>>? get pages {
  final value = _pages;
  if (value == null) return null;
  if (_pages is EqualUnmodifiableListView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<K>? _keys;
@override List<K>? get keys {
  final value = _keys;
  if (value == null) return null;
  if (_keys is EqualUnmodifiableListView) return _keys;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Object? error;
@override@JsonKey() final  bool hasNextPage;
@override@JsonKey() final  bool isLoading;
@override final  String? search;
@override final  PagingCancelToken? cancelToken;

/// Create a copy of PagingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PagingStateCopyWith<K, T, _PagingState<K, T>> get copyWith => __$PagingStateCopyWithImpl<K, T, _PagingState<K, T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PagingState<K, T>&&const DeepCollectionEquality().equals(other._pages, _pages)&&const DeepCollectionEquality().equals(other._keys, _keys)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.search, search) || other.search == search)&&(identical(other.cancelToken, cancelToken) || other.cancelToken == cancelToken));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pages),const DeepCollectionEquality().hash(_keys),const DeepCollectionEquality().hash(error),hasNextPage,isLoading,search,cancelToken);

@override
String toString() {
  return 'PagingState<$K, $T>(pages: $pages, keys: $keys, error: $error, hasNextPage: $hasNextPage, isLoading: $isLoading, search: $search, cancelToken: $cancelToken)';
}


}

/// @nodoc
abstract mixin class _$PagingStateCopyWith<K,T,$Res> implements $PagingStateCopyWith<K, T, $Res> {
  factory _$PagingStateCopyWith(_PagingState<K, T> value, $Res Function(_PagingState<K, T>) _then) = __$PagingStateCopyWithImpl;
@override @useResult
$Res call({
 List<List<T>>? pages, List<K>? keys, Object? error, bool hasNextPage, bool isLoading, String? search, PagingCancelToken? cancelToken
});




}
/// @nodoc
class __$PagingStateCopyWithImpl<K,T,$Res>
    implements _$PagingStateCopyWith<K, T, $Res> {
  __$PagingStateCopyWithImpl(this._self, this._then);

  final _PagingState<K, T> _self;
  final $Res Function(_PagingState<K, T>) _then;

/// Create a copy of PagingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pages = freezed,Object? keys = freezed,Object? error = freezed,Object? hasNextPage = null,Object? isLoading = null,Object? search = freezed,Object? cancelToken = freezed,}) {
  return _then(_PagingState<K, T>(
pages: freezed == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<List<T>>?,keys: freezed == keys ? _self._keys : keys // ignore: cast_nullable_to_non_nullable
as List<K>?,error: freezed == error ? _self.error : error ,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,cancelToken: freezed == cancelToken ? _self.cancelToken : cancelToken // ignore: cast_nullable_to_non_nullable
as PagingCancelToken?,
  ));
}


}

// dart format on
