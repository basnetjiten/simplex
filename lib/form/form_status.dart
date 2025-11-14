import 'package:freezed_annotation/freezed_annotation.dart';

import 'response_data.dart';

part 'form_status.freezed.dart';

@freezed
class FormStatus with _$FormStatus {
  const factory FormStatus.initial() = _Initial;

  const factory FormStatus.invalid({String? message}) = _Invalid;

  const factory FormStatus.submitting() = _Submitting;

  const factory FormStatus.error({String? error}) = _Error;

  const factory FormStatus.successWithData({ResponseData<dynamic>? data}) =
      _SuccessWithData;

  const factory FormStatus.success({String? message}) = _Success;
}
