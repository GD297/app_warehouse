import 'package:flutter/cupertino.dart';

class Combo {
  final String id;
  final String imagePath;
  final String name;
  final String decription;
  final double price;
  final double sale;
  final List<Map<String, dynamic>> listItem;
  final List<Map<String, dynamic>> listAccessories;

  Combo(
      {@required this.id,
      @required this.imagePath,
      @required this.name,
      @required this.decription,
      @required this.price,
      @required this.sale,
      @required this.listItem,
      @required this.listAccessories});
}
