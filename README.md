# Simplex

**Simplex** is a lightweight, standardized Flutter framework designed to accelerate development by providing robust base classes for BLoC/Cubit, advanced form management, and reusable utility modules.

---

## 🚀 Core Features

-   **Standardized BLoC Architecture**: Inherit from `SimplexBloc` or `SimplexCubit` to handle API calls with built-in error mapping.
-   **Data Layer Abstraction**: Base classes for `RemoteSource` (GraphQL/REST) and `Repository` with automatic error conversion.
-   **Advanced Form Handling**: Powerful `TextFormField` wrappers and BLoC-integrated form status management.
-   **Query & Filter Utility**: Ready-to-use module for handling debounced search and complex filtering logic.
-   **Authentication Event Bus**: Centralized stream for handling auth states like session expiry or unauthorized access.
-   **Caching & Logging**: Simple mixins for Cubit state caching and a standardized logging system.

---

## 🏗 Architecture Layers

### 1. Data Layer (`RemoteSource` & `Repository`)
Simplex provides a clean separation between raw API calls and domain logic.

#### **Remote Source**
Use `SimplexBaseRemoteSource` to execute GraphQL (via Ferry) or REST (via Dio) calls. It handles logging and automatically intercepts authentication errors.

```dart
class UserRemoteSource extends SimplexBaseRemoteSource {
  UserRemoteSource(super.graphqlClient, super.dioClient);

  Future<UserData> getUser(String id) {
    return executeGraphqlApiCall(GetUserQuery(variables: vars).request);
  }
}
```

#### **Repository**
Use `SimplexBaseRepository` to wrap remote calls into an `EitherResponse`. It converts `ApiException` (data layer) into `AppError` (domain layer) automatically.

```dart
class UserRepository extends SimplexBaseRepository {
  Future<EitherResponse<User>> getUser(String id) {
    return processApiCall<ApiUser, User>(
      call: remoteSource.getUser(id),
      onSuccess: (data) => User.fromApi(data),
    );
  }
}
```

### 2. State Management (`SimplexBloc` & `SimplexCubit`)
The base BLoC classes provide `handleAPICall`, which bridges the Repository's `Either` response directly to your UI state updates.

```dart
class MyBloc extends SimplexBloc<MyEvent, MyState> {
  Future<void> _onLoad(event, emit) async {
    await handleAPICall<Data>(
      emitter: emit,
      call: repository.getData(),
      onSuccess: (data) => state.copyWith(data: data),
      onFailure: (error) => state.copyWith(error: error),
    );
  }
}
```

### 3. Core Utilities

#### **Authentication Event Bus**
`SimplexAuthEventBus` is a singleton that broadcasts authentication errors (`unAuthenticated`, `sessionExpired`, `forbidden`) application-wide. This is automatically triggered by the `RemoteSource`.

```dart
SimplexAuthEventBus.instance.events.listen((event) {
  if (event.type == AuthErrorType.sessionExpired) {
    // Navigate to Login
  }
});
```

#### **Cubit Cache Mixin**
Easily persist Cubit data in memory using the `CubitCacheMixin`. Perfect for maintaining state during navigation without complex persistence.

```dart
class MyCubit extends SimplexCubit<MyState> with CubitCacheMixin {
  void saveData(data) {
    storeToCache(data);
    emit(state.copyWith(data: data));
  }
}
```

#### **Logging**
Use `SimplexAppLogger` for standardized console output, including info, warnings, and formatted app errors with stack traces.

---

## 📖 Feature Modules

### Query & Filter (Search)
Handle debounced search and filtering effortlessly.

```dart
// Use directly in your page
BlocProvider(
  create: (context) => QueryFilterBloc(
    debounceDuration: const Duration(milliseconds: 300),
  ),
  child: MySearchPage(),
)

// In your UI
onChanged: (value) {
  context.read<QueryFilterBloc>().onSearchOrFilterChange(value, isSearchOnly: true);
}
```

---

## 🛠 Getting Started

### Installation
Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  simplex:
    git: https://github.com/basnetjiten/simplex.git
```

### Code Generation
Simplex relies on `freezed` and `json_serializable`. Run the generator:

```bash
dart run build_runner build -d
```

---

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
