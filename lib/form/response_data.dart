class ResponseData<T> {
  ResponseData({this.apiData, this.message});
  final String? message;
  final T? apiData;
}
