import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemInCart {
  final String id;
  final dynamic productItem;
  final String typeItem;
  final int quantity;
  bool isCheck;
  ItemInCart(
      {@required this.id,
      @required this.productItem,
      @required this.quantity,
      @required this.typeItem,
      @required this.isCheck});
}
