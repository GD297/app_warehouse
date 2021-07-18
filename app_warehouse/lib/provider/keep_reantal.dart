import 'package:flutter/cupertino.dart';

class Box {
  

  final String id;
  final String imagePath;
  final String name;
  final String descreption;
  final double price;
  final List<Map<String, dynamic>> services;
  final List<Map<String, dynamic>> listSize;

  Box({
    @required this.id,
    @required this.imagePath,
    @required this.name,
    @required this.descreption,
    @required this.price,
    @required this.services,
    @required this.listSize,
  });
}
