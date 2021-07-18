import 'package:app_warehouse/common/item_cart.dart';
import 'package:app_warehouse/provider/item_cart.dart';
import 'package:flutter/cupertino.dart';

class Order {
  final String id;
  final double amount;
  final Map<String, ItemInCart> listitem;
  final DateTime date;
  final int numberOfMonth;
  final double stairFee;
  final double shippingFee;
  final String status;
  final String typeOrder;
  final DateTime expiredDate;
  Order(
      {@required this.id,
      @required this.amount,
      @required this.listitem,
      @required this.date,
      @required this.expiredDate,
      @required this.stairFee,
      @required this.shippingFee,
      @required this.status,
      @required this.numberOfMonth,
      @required this.typeOrder});
}
