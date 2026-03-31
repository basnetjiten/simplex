/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 31/03/2026
 */

abstract class PaginatedResponse<T> {
  List<T> get items;
  bool get hasNext;
}
