// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paging_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PagingModel {

 double get limit; double get page; double get skip; bool get hasNext; double get total; List<dynamic> get filters; String? get searchText;
/// Create a copy of PagingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PagingModelCopyWith<PagingModel> get copyWith => _$PagingModelCopyWithImpl<PagingModel>(this as PagingModel, _$identity);

  /// Serializes this PagingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PagingModel&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.skip, skip) || other.skip == skip)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.filters, filters)&&(identical(other.searchText, searchText) || other.searchText == searchText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,page,skip,hasNext,total,const DeepCollectionEquality().hash(filters),searchText);

@override
String toString() {
  return 'PagingModel(limit: $limit, page: $page, skip: $skip, hasNext: $hasNext, total: $total, filters: $filters, searchText: $searchText)';
}


}

/// @nodoc
abstract mixin class $PagingModelCopyWith<$Res>  {
  factory $PagingModelCopyWith(PagingModel value, $Res Function(PagingModel) _then) = _$PagingModelCopyWithImpl;
@useResult
$Res call({
 double limit, double page, double skip, bool hasNext, double total, List<dynamic> filters, String? searchText
});




}
/// @nodoc
class _$PagingModelCopyWithImpl<$Res>
    implements $PagingModelCopyWith<$Res> {
  _$PagingModelCopyWithImpl(this._self, this._then);

  final PagingModel _self;
  final $Res Function(PagingModel) _then;

/// Create a copy of PagingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,Object? page = null,Object? skip = null,Object? hasNext = null,Object? total = null,Object? filters = null,Object? searchText = freezed,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as double,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as double,skip: null == skip ? _self.skip : skip // ignore: cast_nullable_to_non_nullable
as double,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as List<dynamic>,searchText: freezed == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PagingModel].
extension PagingModelPatterns on PagingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PagingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PagingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PagingModel value)  $default,){
final _that = this;
switch (_that) {
case _PagingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PagingModel value)?  $default,){
final _that = this;
switch (_that) {
case _PagingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double limit,  double page,  double skip,  bool hasNext,  double total,  List<dynamic> filters,  String? searchText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PagingModel() when $default != null:
return $default(_that.limit,_that.page,_that.skip,_that.hasNext,_that.total,_that.filters,_that.searchText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double limit,  double page,  double skip,  bool hasNext,  double total,  List<dynamic> filters,  String? searchText)  $default,) {final _that = this;
switch (_that) {
case _PagingModel():
return $default(_that.limit,_that.page,_that.skip,_that.hasNext,_that.total,_that.filters,_that.searchText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double limit,  double page,  double skip,  bool hasNext,  double total,  List<dynamic> filters,  String? searchText)?  $default,) {final _that = this;
switch (_that) {
case _PagingModel() when $default != null:
return $default(_that.limit,_that.page,_that.skip,_that.hasNext,_that.total,_that.filters,_that.searchText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PagingModel extends PagingModel {
  const _PagingModel({this.limit = 10.0, this.page = 1.0, this.skip = 0.0, this.hasNext = false, this.total = 0.0, final  List<dynamic> filters = const <dynamic>[], this.searchText}): _filters = filters,super._();
  factory _PagingModel.fromJson(Map<String, dynamic> json) => _$PagingModelFromJson(json);

@override@JsonKey() final  double limit;
@override@JsonKey() final  double page;
@override@JsonKey() final  double skip;
@override@JsonKey() final  bool hasNext;
@override@JsonKey() final  double total;
 final  List<dynamic> _filters;
@override@JsonKey() List<dynamic> get filters {
  if (_filters is EqualUnmodifiableListView) return _filters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filters);
}

@override final  String? searchText;

/// Create a copy of PagingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PagingModelCopyWith<_PagingModel> get copyWith => __$PagingModelCopyWithImpl<_PagingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PagingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PagingModel&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.skip, skip) || other.skip == skip)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._filters, _filters)&&(identical(other.searchText, searchText) || other.searchText == searchText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,page,skip,hasNext,total,const DeepCollectionEquality().hash(_filters),searchText);

@override
String toString() {
  return 'PagingModel(limit: $limit, page: $page, skip: $skip, hasNext: $hasNext, total: $total, filters: $filters, searchText: $searchText)';
}


}

/// @nodoc
abstract mixin class _$PagingModelCopyWith<$Res> implements $PagingModelCopyWith<$Res> {
  factory _$PagingModelCopyWith(_PagingModel value, $Res Function(_PagingModel) _then) = __$PagingModelCopyWithImpl;
@override @useResult
$Res call({
 double limit, double page, double skip, bool hasNext, double total, List<dynamic> filters, String? searchText
});




}
/// @nodoc
class __$PagingModelCopyWithImpl<$Res>
    implements _$PagingModelCopyWith<$Res> {
  __$PagingModelCopyWithImpl(this._self, this._then);

  final _PagingModel _self;
  final $Res Function(_PagingModel) _then;

/// Create a copy of PagingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? page = null,Object? skip = null,Object? hasNext = null,Object? total = null,Object? filters = null,Object? searchText = freezed,}) {
  return _then(_PagingModel(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as double,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as double,skip: null == skip ? _self.skip : skip // ignore: cast_nullable_to_non_nullable
as double,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,filters: null == filters ? _self._filters : filters // ignore: cast_nullable_to_non_nullable
as List<dynamic>,searchText: freezed == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
