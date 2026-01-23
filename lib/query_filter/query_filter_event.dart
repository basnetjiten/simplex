part of 'query_filter_bloc.dart';

@freezed
abstract class QueryFilterEvent with _$QueryFilterEvent {
  const factory QueryFilterEvent.searchQuery({
    @Default(true) bool isSearch,
    String? query,
    List<dynamic>? filters,
  }) = _QueryFilterEvent;
}
