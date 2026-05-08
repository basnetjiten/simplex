/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 31/03/2026
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'paging_model.freezed.dart';

part 'paging_model.g.dart';

@freezed
abstract class PagingModel with _$PagingModel {
  const PagingModel._();

  const factory PagingModel({
    @Default(10.0) double limit,
    @Default(1.0) double page,
    @Default(0.0) double skip,
    @Default(false) bool hasNext,
    @Default(0.0) double total,
    @Default(<dynamic>[]) List<dynamic> filters,
    String? searchText,
  }) = _PagingModel;

  factory PagingModel.fromJson(Map<String, dynamic> json) =>
      _$PagingModelFromJson(json);

  double get skipFromPage => ((page - 1) * limit);
}
