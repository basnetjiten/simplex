import 'package:simplex/query_filter/query_filter_bloc.dart';

/// This is an example of how to make [QueryFilterBloc] injectable at the app level.
///
/// Use [@injectable] (Factory) for page-specific search to ensure the state is
/// reset and disposed of when the page is closed.
//@injectable
class AppQueryFilterBloc extends QueryFilterBloc {
  AppQueryFilterBloc()
      : super(debounceDuration: const Duration(milliseconds: 300));
}

/*
### Option 1: Direct Usage (Non-Injectable)
You can use [QueryFilterBloc] directly without extending it. This is best for
simple cases or when you don't need app-level dependency injection.

BlocProvider(
  create: (context) => QueryFilterBloc(
    debounceDuration: const Duration(milliseconds: 300),
  ),
  child: SearchPage(),
)
*/

/*
### Option 2: Injectable Usage
Usage in your UI when using the extended class (Optionally with get_it):

BlocProvider(
  create: (context) => getIt<AppQueryFilterBloc>(),
  child: SearchPage(),
)

In your search field:

onChanged: (value) {
  context.read<AppQueryFilterBloc>().onSearchOrFilterChange(value);
}

With filters:

onFilterPressed: () {
  final filters = ['category_1', 'price_range_100'];
  context.read<AppQueryFilterBloc>().onSearchOrFilterChange(
    currentQuery,
    filters: filters,
    isSearchOnly: false,
  );
}
*/
