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