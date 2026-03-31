/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 13/12/2024
 */

import 'field.dart';

mixin FormMixin {
  bool get isValid => fields.every((Field<dynamic> field) => field.isValid);

  bool get isNotValid => !isValid;

  List<Field<dynamic>> get fields;
}
