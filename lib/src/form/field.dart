/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 13/12/2024
 */

import 'package:freezed_annotation/freezed_annotation.dart';
import '../extensions/string_extension.dart';

part 'field.freezed.dart';
part 'field.g.dart';

/// A generic class representing a form field with its value, error message, and status.
///
/// [T] is the type of the value stored in the field.
@Freezed(
  genericArgumentFactories: true,
  toJson: true,
  fromJson: true,
  copyWith: false,
)
abstract class Field<T> with _$Field<T> {
  const Field._();

  /// Creates a [Field].
  const factory Field({
    required T value,
    String? errorMessage,
    @Default(false) bool isValid,
    @Default(false) bool obscureText,
  }) = _Field<T>;

  /// Returns `true` if the field currently has an error message.
  bool get hasError => errorMessage.isNotNullOrEmpty;

  /// Returns `true` if the field is valid (no error message and explicitly marked as valid).
  bool get isFieldValid => errorMessage.isNullOrEmpty && isValid;

  /// Validates the field using a list of [validators].
  ///
  /// Each validator is a function that takes the current value and returns an error message string
  /// if the validation fails, or `null` if it passes.
  /// The first non-null error message will be set as the [errorMessage].
  Field<T> validate(List<String? Function(T value)> validators) {
    for (final validator in validators) {
      final error = validator(value);
      if (error != null) {
        return update(errorMessage: error, isValid: false);
      }
    }
    return update(errorMessage: null, isValid: true);
  }

  /// Returns a new instance of [Field] with updated properties.
  Field<T> update({
    T? value,
    String? errorMessage,
    bool? obscureText,
    bool? isValid,
  }) {
    final bool hasValidFormValue = isValid ?? errorMessage.isNullOrEmpty;
    return Field<T>(
      value: value ?? this.value,
      errorMessage: errorMessage,
      isValid: hasValidFormValue,
      obscureText: obscureText ?? this.obscureText,
    );
  }

  factory Field.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$FieldFromJson(json, fromJsonT);
}
