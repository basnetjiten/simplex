// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QueryFilterEvent {

 bool get isSearch; String? get query; List<dynamic>? get filters;
/// Create a copy of QueryFilterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueryFilterEventCopyWith<QueryFilterEvent> get copyWith => _$QueryFilterEventCopyWithImpl<QueryFilterEvent>(this as QueryFilterEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueryFilterEvent&&(identical(other.isSearch, isSearch) || other.isSearch == isSearch)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.filters, filters));
}


@override
int get hashCode => Object.hash(runtimeType,isSearch,query,const DeepCollectionEquality().hash(filters));

@override
String toString() {
  return 'QueryFilterEvent(isSearch: $isSearch, query: $query, filters: $filters)';
}


}

/// @nodoc
abstract mixin class $QueryFilterEventCopyWith<$Res>  {
  factory $QueryFilterEventCopyWith(QueryFilterEvent value, $Res Function(QueryFilterEvent) _then) = _$QueryFilterEventCopyWithImpl;
@useResult
$Res call({
 bool isSearch, String? query, List<dynamic>? filters
});




}
/// @nodoc
class _$QueryFilterEventCopyWithImpl<$Res>
    implements $QueryFilterEventCopyWith<$Res> {
  _$QueryFilterEventCopyWithImpl(this._self, this._then);

  final QueryFilterEvent _self;
  final $Res Function(QueryFilterEvent) _then;

/// Create a copy of QueryFilterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSearch = null,Object? query = freezed,Object? filters = freezed,}) {
  return _then(_self.copyWith(
isSearch: null == isSearch ? _self.isSearch : isSearch // ignore: cast_nullable_to_non_nullable
as bool,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [QueryFilterEvent].
extension QueryFilterEventPatterns on QueryFilterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _QueryFilterEvent value)?  searchQuery,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueryFilterEvent() when searchQuery != null:
return searchQuery(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _QueryFilterEvent value)  searchQuery,}){
final _that = this;
switch (_that) {
case _QueryFilterEvent():
return searchQuery(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _QueryFilterEvent value)?  searchQuery,}){
final _that = this;
switch (_that) {
case _QueryFilterEvent() when searchQuery != null:
return searchQuery(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isSearch,  String? query,  List<dynamic>? filters)?  searchQuery,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueryFilterEvent() when searchQuery != null:
return searchQuery(_that.isSearch,_that.query,_that.filters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isSearch,  String? query,  List<dynamic>? filters)  searchQuery,}) {final _that = this;
switch (_that) {
case _QueryFilterEvent():
return searchQuery(_that.isSearch,_that.query,_that.filters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isSearch,  String? query,  List<dynamic>? filters)?  searchQuery,}) {final _that = this;
switch (_that) {
case _QueryFilterEvent() when searchQuery != null:
return searchQuery(_that.isSearch,_that.query,_that.filters);case _:
  return null;

}
}

}

/// @nodoc


class _QueryFilterEvent implements QueryFilterEvent {
  const _QueryFilterEvent({this.isSearch = true, this.query, final  List<dynamic>? filters}): _filters = filters;
  

@override@JsonKey() final  bool isSearch;
@override final  String? query;
 final  List<dynamic>? _filters;
@override List<dynamic>? get filters {
  final value = _filters;
  if (value == null) return null;
  if (_filters is EqualUnmodifiableListView) return _filters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of QueryFilterEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueryFilterEventCopyWith<_QueryFilterEvent> get copyWith => __$QueryFilterEventCopyWithImpl<_QueryFilterEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueryFilterEvent&&(identical(other.isSearch, isSearch) || other.isSearch == isSearch)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other._filters, _filters));
}


@override
int get hashCode => Object.hash(runtimeType,isSearch,query,const DeepCollectionEquality().hash(_filters));

@override
String toString() {
  return 'QueryFilterEvent.searchQuery(isSearch: $isSearch, query: $query, filters: $filters)';
}


}

/// @nodoc
abstract mixin class _$QueryFilterEventCopyWith<$Res> implements $QueryFilterEventCopyWith<$Res> {
  factory _$QueryFilterEventCopyWith(_QueryFilterEvent value, $Res Function(_QueryFilterEvent) _then) = __$QueryFilterEventCopyWithImpl;
@override @useResult
$Res call({
 bool isSearch, String? query, List<dynamic>? filters
});




}
/// @nodoc
class __$QueryFilterEventCopyWithImpl<$Res>
    implements _$QueryFilterEventCopyWith<$Res> {
  __$QueryFilterEventCopyWithImpl(this._self, this._then);

  final _QueryFilterEvent _self;
  final $Res Function(_QueryFilterEvent) _then;

/// Create a copy of QueryFilterEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSearch = null,Object? query = freezed,Object? filters = freezed,}) {
  return _then(_QueryFilterEvent(
isSearch: null == isSearch ? _self.isSearch : isSearch // ignore: cast_nullable_to_non_nullable
as bool,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,filters: freezed == filters ? _self._filters : filters // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}


}

/// @nodoc
mixin _$QueryFilterState {

 bool get isSearch; String? get query; List<dynamic>? get filters;
/// Create a copy of QueryFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueryFilterStateCopyWith<QueryFilterState> get copyWith => _$QueryFilterStateCopyWithImpl<QueryFilterState>(this as QueryFilterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueryFilterState&&(identical(other.isSearch, isSearch) || other.isSearch == isSearch)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.filters, filters));
}


@override
int get hashCode => Object.hash(runtimeType,isSearch,query,const DeepCollectionEquality().hash(filters));

@override
String toString() {
  return 'QueryFilterState(isSearch: $isSearch, query: $query, filters: $filters)';
}


}

/// @nodoc
abstract mixin class $QueryFilterStateCopyWith<$Res>  {
  factory $QueryFilterStateCopyWith(QueryFilterState value, $Res Function(QueryFilterState) _then) = _$QueryFilterStateCopyWithImpl;
@useResult
$Res call({
 bool isSearch, String? query, List<dynamic>? filters
});




}
/// @nodoc
class _$QueryFilterStateCopyWithImpl<$Res>
    implements $QueryFilterStateCopyWith<$Res> {
  _$QueryFilterStateCopyWithImpl(this._self, this._then);

  final QueryFilterState _self;
  final $Res Function(QueryFilterState) _then;

/// Create a copy of QueryFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSearch = null,Object? query = freezed,Object? filters = freezed,}) {
  return _then(_self.copyWith(
isSearch: null == isSearch ? _self.isSearch : isSearch // ignore: cast_nullable_to_non_nullable
as bool,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [QueryFilterState].
extension QueryFilterStatePatterns on QueryFilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _QueryFilterState value)?  query,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueryFilterState() when query != null:
return query(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _QueryFilterState value)  query,}){
final _that = this;
switch (_that) {
case _QueryFilterState():
return query(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _QueryFilterState value)?  query,}){
final _that = this;
switch (_that) {
case _QueryFilterState() when query != null:
return query(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isSearch,  String? query,  List<dynamic>? filters)?  query,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueryFilterState() when query != null:
return query(_that.isSearch,_that.query,_that.filters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isSearch,  String? query,  List<dynamic>? filters)  query,}) {final _that = this;
switch (_that) {
case _QueryFilterState():
return query(_that.isSearch,_that.query,_that.filters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isSearch,  String? query,  List<dynamic>? filters)?  query,}) {final _that = this;
switch (_that) {
case _QueryFilterState() when query != null:
return query(_that.isSearch,_that.query,_that.filters);case _:
  return null;

}
}

}

/// @nodoc


class _QueryFilterState implements QueryFilterState {
  const _QueryFilterState({this.isSearch = true, this.query, final  List<dynamic>? filters}): _filters = filters;
  

@override@JsonKey() final  bool isSearch;
@override final  String? query;
 final  List<dynamic>? _filters;
@override List<dynamic>? get filters {
  final value = _filters;
  if (value == null) return null;
  if (_filters is EqualUnmodifiableListView) return _filters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of QueryFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueryFilterStateCopyWith<_QueryFilterState> get copyWith => __$QueryFilterStateCopyWithImpl<_QueryFilterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueryFilterState&&(identical(other.isSearch, isSearch) || other.isSearch == isSearch)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other._filters, _filters));
}


@override
int get hashCode => Object.hash(runtimeType,isSearch,query,const DeepCollectionEquality().hash(_filters));

@override
String toString() {
  return 'QueryFilterState.query(isSearch: $isSearch, query: $query, filters: $filters)';
}


}

/// @nodoc
abstract mixin class _$QueryFilterStateCopyWith<$Res> implements $QueryFilterStateCopyWith<$Res> {
  factory _$QueryFilterStateCopyWith(_QueryFilterState value, $Res Function(_QueryFilterState) _then) = __$QueryFilterStateCopyWithImpl;
@override @useResult
$Res call({
 bool isSearch, String? query, List<dynamic>? filters
});




}
/// @nodoc
class __$QueryFilterStateCopyWithImpl<$Res>
    implements _$QueryFilterStateCopyWith<$Res> {
  __$QueryFilterStateCopyWithImpl(this._self, this._then);

  final _QueryFilterState _self;
  final $Res Function(_QueryFilterState) _then;

/// Create a copy of QueryFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSearch = null,Object? query = freezed,Object? filters = freezed,}) {
  return _then(_QueryFilterState(
isSearch: null == isSearch ? _self.isSearch : isSearch // ignore: cast_nullable_to_non_nullable
as bool,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,filters: freezed == filters ? _self._filters : filters // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}


}

// dart format on
