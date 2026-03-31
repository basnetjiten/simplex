abstract class PaginatedResponse<T> {
  List<T> get items;
  bool get hasNext;
}
