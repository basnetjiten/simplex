/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 13/12/2024
 */

extension StringX on String? {
  bool get isNullOrEmpty => (this == null || this == '');

  bool get isNotNullOrEmpty => (this != null && this != '');

  bool get isNotNull => (this != null);

  bool get isNull => (this == null);
}
