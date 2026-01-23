import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simplex/base/simplex_base_bloc.dart';

part 'query_filter_bloc.freezed.dart';
part 'query_filter_event.dart';
part 'query_filter_state.dart';

class QueryFilterBloc extends SimplexBloc<QueryFilterEvent, QueryFilterState> {
  final Duration debounceDuration;

  QueryFilterBloc({this.debounceDuration = const Duration(milliseconds: 500)})
    : super(const QueryFilterState.query()) {
    on<QueryFilterEvent>(
      _onToggleSearchView,
      transformer:
          (
            Stream<QueryFilterEvent> events,
            Stream<QueryFilterEvent> Function(QueryFilterEvent) mapper,
          ) => events.debounceTime(debounceDuration).switchMap(mapper),
    );
  }

  FutureOr<void> _onToggleSearchView(
    QueryFilterEvent event,
    Emitter<QueryFilterState> emit,
  ) {
    emit(
      state.copyWith(
        query: event.query,
        isSearch: event.isSearch,
        filters: event.filters,
      ),
    );
  }

  void onSearchOrFilterChange(
    String? keyword, {
    List<dynamic>? filters,
    bool isSearchOnly = true,
  }) {
    add(
      QueryFilterEvent.searchQuery(
        query: keyword,
        isSearch: isSearchOnly,
        filters: filters,
      ),
    );
  }
}
