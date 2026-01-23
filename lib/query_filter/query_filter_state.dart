part of 'query_filter_bloc.dart';

@freezed
abstract class QueryFilterState with _$QueryFilterState {
  const factory QueryFilterState.query({
    @Default(true) bool isSearch,
    String? query,
    List<dynamic>? filters,
  }) = _QueryFilterState;
}
