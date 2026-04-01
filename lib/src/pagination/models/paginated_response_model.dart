/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 31/03/2026
 */

class PaginatedResponse<T> {
  final List<T> items;
  final bool hasNext;

  PaginatedResponse({required this.items, required this.hasNext});
}
