// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Field<T> _$FieldFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _Field<T>(
  value: fromJsonT(json['value']),
  errorMessage: json['errorMessage'] as String?,
  isValid: json['isValid'] as bool? ?? false,
  obscureText: json['obscureText'] as bool? ?? false,
);

Map<String, dynamic> _$FieldToJson<T>(
  _Field<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'value': toJsonT(instance.value),
  'errorMessage': instance.errorMessage,
  'isValid': instance.isValid,
  'obscureText': instance.obscureText,
};
