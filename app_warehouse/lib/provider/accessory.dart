import 'package:flutter/cupertino.dart';

class Accessory {
  final String id;
  final String name;
  final double price;
  final String size;
  final String imagePath;
  final String tooltipIcon;
  final String tooltipImage;

  Accessory({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.imagePath,
    @required this.size,
    @required this.tooltipIcon,
    @required this.tooltipImage,
  });
}
