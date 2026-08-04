# Simplex

**Simplex** is a lightweight, standardized Flutter framework designed to accelerate development by providing robust base classes for BLoC/Cubit, advanced form management, and reusable utility modules.

---

## 🌟 Why Simplex?

Developing Flutter applications often involves repetitive boilerplate for state management, API integration, and form handling. **Simplex** aims to solve this by:
- **Reducing Boilerplate**: Base classes handle common tasks like loading states and error mapping.
- **Enforcing Consistency**: Provides a structured way to handle API responses and domain errors.
- **Improving DX**: Built-in caching, debounced searching, and simplified UI components.
- **Type Safety**: Leverages `freezed` and generics to ensure robust state transitions.

---

## 🚀 Core Features

-   **Standardized BLoC Architecture**: Inherit from `SimplexBloc` or `SimplexCubit` to handle API calls with built-in error mapping.
-   **Enhanced Pagination**: `PagingCubit` with support for infinite scrolling, debounced search, and **first-page caching**.
-   **Advanced Form Handling**: `Field<T>` with multiple validator support and `SimplexFormField` for consistent UI.
-   **Data Layer Abstraction**: Base classes for `RemoteSource` and `Repository` with automatic error conversion.
-   **Authentication Event Bus**: Centralized stream for handling global auth states (session expiry, etc.).
-   **Caching & Logging**: Simple mixins for Cubit state caching and a standardized logging system.

---

## 🏗 Architecture Layers

### 1. Data Layer (`RemoteSource` & `Repository`)
Simplex provides a clean separation between raw API calls and domain logic.

#### **Remote Source**
Use `SimplexBaseRemoteSource` to execute GraphQL (via Ferry) or REST (via Dio) calls.

#### **Repository**
Use `SimplexBaseRepository` to wrap remote calls into an `EitherResponse`. It converts `ApiException` (data layer) into `AppError` (domain layer) automatically.

### 2. State Management (`SimplexBloc` & `SimplexCubit`)
The base BLoC classes provide `handleAPICall`, which bridges the Repository's `Either` response directly to your UI state updates.

### 3. Pagination with `PagingCubit`
The refactored `PagingCubit` handles infinite scrolling with ease.

```dart
final cubit = PagingCubit<int, User>(
  initialKey: 1,
  useCache: true, // Enables first-page caching
  fetchFn: (page, search) async {
    final (items, nextKey) = await repository.getUsers(page: page, search: search);
    return (items, nextKey);
  },
);
```

### 4. Advanced Forms
`Field<T>` now supports multiple validators and a simplified state management.

```dart
final emailField = Field<String>(value: '').validate([
  (value) => value.isEmpty ? 'Required' : null,
  (value) => !value.contains('@') ? 'Invalid' : null,
]);
```

---

## 🔄 Migration Guide (0.0.7 to 0.0.8)

### Paging Refactor
- **State Change**: `PagingState.pages` (List of Lists) is now `PagingState.items` (Flat List).
- **Key Change**: `PagingState.keys` is replaced by `initialKey` and `nextKey`.
- **Method Change**: `prependItem`, `appendItem`, `deleteItem`, and `updateItem` now operate on the flat `items` list.

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
