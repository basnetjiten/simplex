# Simplex

**Simplex** is a lightweight, standardized Flutter framework designed to accelerate development by providing robust base classes for BLoC/Cubit, advanced form management, and reusable utility modules.

It aims to reduce boilerplate code while maintaining a clean, scalable architecture following software engineering best practices.

---

## 🚀 Core Features

-   **Standardized BLoC Architecture**: Inherit from `SimplexBloc` or `SimplexCubit` to handle API calls with built-in error mapping and state management.
-   **Advanced Form Handling**: Powerful `TextFormField` wrappers and BLoC-integrated form status management.
-   **Query & Filter Utility**: A ready-to-use module for handling debounced search and complex filtering logic.
-   **Enhanced UI Components**: Standardized wrappers for SVG images, Cached Network Images, and Shimmers.
-   **functional Programming Integration**: Powered by `fpdart` and `rxdart` for robust data flow.

---

## 🏗 Architecture & Best Practices

The library is organized into conceptual modules:

-   `lib/base/`: Contains the fundamental building blocks (`SimplexBloc`, `SimplexCubit`, `RemoteSource`).
-   `lib/form/`: Classes for form validation, field management, and BLoC status signals.
-   `lib/query_filter/`: Logic for handling search input with debounce and filter selection.
-   `lib/errors/`: Standardized error types and mapping extensions.

### Standards to Follow:
1.  **Immutability**: Always use `freezed` for Events and States.
2.  **API Handling**: Use `handleAPICall` to automaticallly map `Either<AppError, R>` to your UI state.
3.  **UI Isolation**: Keep your UI clean by using the provided `simplex` widgets which handle loading/error states consistently.

---

## 📖 Usage Guide

### 1. Base BLoC & API Calls
Simplify your data fetching logic by extending `SimplexBloc`.

```dart
class UserBloc extends SimplexBloc<UserEvent, UserState> {
  final UserRepository repository;

  UserBloc(this.repository) : super(const UserState.initial());

  Future<void> _onLoadUser(LoadUserEvent event, Emitter<UserState> emit) async {
    await handleAPICall<User>(
      emitter: emit,
      call: repository.getUser(event.userId),
      onSuccess: (user) => state.copyWith(status: Status.loaded, user: user),
      onFailure: (error) => state.copyWith(status: Status.failure, error: error),
    );
  }
}
```

### 2. Query & Filter (Search)
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
  context.read<QueryFilterBloc>().onSearchOrFilterChange(value);
}
```

### 3. Forms & Validation
Utilize the built-in form state mixins to manage complex form logic without the mess.

```dart
class MyFormBloc extends Bloc<MyFormEvent, MyFormState> with FormMixin {
  // Leverage SimplexFormState to track field changes and validation
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



## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
