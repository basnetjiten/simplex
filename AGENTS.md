# API Call & Authentication Flow Documentation

This document explains how authentication, token refresh, and session management are handled in this project.

## 1. High-Level Architecture

The authentication system is built around a centralized **Token Service**, an **Auth Interceptor**, and a **Startup Cubit**.

- **TokenService**: The single source of truth for managing token storage, expiration checks, and synchronized refresh logic.
- **AuthInterceptor**: Injected into the global `Dio` instance to automatically attach valid tokens to every outgoing request.
- **StartupCubit**: Handles the initial session check on app startup (Splash screen phase).
- **AppAuthErrorCubit**: Listens for global 401/403 events (via `SimplexAuthEventBus`) and manages global logout/redirection.

---

## 2. Authenticated API Call Flow

When a developer makes an API call using the global `Dio` or `Ferry Client`:

1.  **Interceptor Trigger**: The `AuthInterceptor`'s `onRequest` method is fired.
2.  **Token Retrieval**: It calls `tokenService.getValidAccessToken()`.
3.  **Validation & Optional Refresh**:
    -   If no token exists, returns `null`.
    -   If the token is expired, it internally triggers `refreshToken()`.
    -   If a refresh is already in progress, multiple callers **wait** for the same ongoing request (using a `Lock` and `synchronized` package).
4.  **Header Attachment**: If a token is found, it's added to the `Authorization` header.
5.  **Request Execution**: The request is sent to the backend.

### Code Snippet: `AuthInterceptor`
```dart
Future<String?> _getValidToken() async {
  // Centralized call to TokenService
  return _tokenService.getValidAccessToken();
}
```

---

## 3. Token Refresh Logic

The `TokenService` uses the `synchronized` package to prevent "race conditions" where multiple concurrent requests might try to refresh the token simultaneously.

### `TokenService.refreshToken()`
```dart
final Lock _lock = Lock();

Future<void> refreshToken() => _lock.synchronized(() async {
  final String? token = await _storage.refreshToken;
  if (token == null) {
    await LogoutHelper.clearStorage();
    return;
  }

  // Uses a specialized 'RefreshLinkClient' (without the auth interceptor)
  final OperationResponse<GRefreshData, GRefreshVars> res = await _client
      .request(GRefreshReq((GRefreshReqBuilder b) => b..vars.refreshToken = token))
      .first;

  if (res.graphqlErrors?.isNotEmpty ?? false) {
    // Throws a sessionExpiredException which triggers logout
    throw res.toGraphqlApiException(forceLogout: true);
  }

  if (res.data case final GRefreshData data?) {
    await _storage.saveToken(data.refresh.accessToken!, data.refresh.refreshToken);
  }
});
```

---

## 4. Handling Session Expiration (401/403)

If a session expires or is invalidated server-side, the app reacts in two ways:

1.  **During Refresh**: If `refreshToken()` fails with a fatal error (e.g., refresh token also expired), it throws an `ApiException`.
2.  **During Normal Request**: If a request returns a 401 (Unauthorized) or 403 (Forbidden), the `SimplexAuthEventBus` receives a signal.

### `AppAuthErrorCubit` & Global Logout
The `AppAuthErrorCubit` listens to the event bus and updates its state. The `app.dart` listener then handles navigation:

```dart
BlocListener<AppAuthErrorCubit, AppAuthErrorState>(
  listener: (BuildContext blocContext, AppAuthErrorState state) {
    state.maybeWhen(
      error401: (String? message) {
        // Resets global state and moves to onboarding
        BlocReset.resetGlobalBloc(blocContext);
        _appRouter.replaceAll([const OnboardingWrapperRoute()]);
      },
      // ... same for 403
    );
  },
)
```

---

## 5. Startup Session Check

On app startup, the `StartupCubit` ensures the user is in the correct state before removing the native splash screen.

### `StartupCubit.checkSession()`
1.  Calls `_repository.getValidAccessToken()`.
2.  If it returns `null` (no session or refresh failed), it emits `unAuthenticated`.
3.  If valid, it fetches user profile and emits `authenticated`.

---

## 6. GraphQL Error Handling & Exception Mapping

In this project, GraphQL errors returned by the Ferry client (`OperationResponse`) are mapped to standardized `ApiException` models using a dedicated extension.

### `GraphqlApiExceptionXGraphQl` Extension
This extension simplifies error checking by converting standard GraphQL server constraints into `ApiException.serverException` or status-specific exceptions (like `ApiException.unAuthorizedException`).

```dart
// Example usage of mapping a Ferry Response to ApiException
final response = await _client.request(req).first;

if (response.hasErrors) {
  // Automatically extracts message, maps socket exceptions, and handles 401/403
  throw response.toGraphqlApiException(); 
}
```

---

## 7. Pagination Flow Using `PagingCubit`

The application uses a generic `PagingCubit<K, T>` to handle offset or cursor-based pagination. It relies on a `fetchFn` to retrieve data and supports searching, loading, error handling, and local cache manipulation. 

### Core Concepts
- **`PagingCubit<K, T>`**: Tracks pagination state (`K` is the cursor/page key type, `T` is the item type).
- **`PagingFetchFn`**: An injected function that executes the paginated request.
- **`PaginatedResponse<T>`**: Standard response model containing `items` and a `hasNext` boolean flag.

### Example: Setting up a Paginated List
```dart
// 1. Initialize Cubit directly (Recommended for simple lists)
final pagingCubit = PagingCubit<int, MyItemModel>(
  initialKey: 1,
  cacheKey: 'MyUniqueList', // Required for unique caching
  useCache: true,
  fetchFn: (int pageKey, String? searchKeyword) async {
    // 2. Fetch from repository
    final response = await repository.fetchItems(page: pageKey, search: searchKeyword);
    
    // 3. Return a tuple of (List<Items>, NextPageKey?)
    return (response.items, response.hasNext ? pageKey + 1 : null);
  },
);

// 4. Trigger fetching/actions
await pagingCubit.fetchNext();
// Clear and reset to initialKey (can be silent: true for background refresh)
await pagingCubit.refresh(); 
// Re-fetch using a new query criteria
await pagingCubit.changeSearch('new query');
```

The cubit also allows for local state mutation directly without needing network re-fetches:
- `pagingCubit.prependItem(item)`
- `pagingCubit.appendItem(item)`
- `pagingCubit.updateItem(id: '123', updatedItem: item, getId: (i) => i.id)`
- `pagingCubit.deleteItem(id: '123', getId: (i) => i.id)`

> [!TIP]
> Use **Subclassing** only when you need to add custom methods (e.g. `upvote()`). For simple lists, **Direct Instantiation** with a `cacheIdentifier` is preferred to reduce boilerplate.