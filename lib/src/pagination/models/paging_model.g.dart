// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PagingModel _$PagingModelFromJson(Map<String, dynamic> json) => _PagingModel(
  limit: (json['limit'] as num?)?.toDouble() ?? 10.0,
  page: (json['page'] as num?)?.toDouble() ?? 1.0,
  skip: (json['skip'] as num?)?.toDouble() ?? 0.0,
  hasNext: json['hasNext'] as bool? ?? false,
  total: (json['total'] as num?)?.toDouble() ?? 0.0,
  filters: json['filters'] as List<dynamic>? ?? const <dynamic>[],
  searchText: json['searchText'] as String?,
);

Map<String, dynamic> _$PagingModelToJson(_PagingModel instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'skip': instance.skip,
      'hasNext': instance.hasNext,
      'total': instance.total,
      'filters': instance.filters,
      'searchText': instance.searchText,
    };
