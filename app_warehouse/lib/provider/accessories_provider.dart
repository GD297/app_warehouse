import 'package:app_warehouse/provider/accessory.dart';
import 'package:flutter/cupertino.dart';

class Accessories with ChangeNotifier {
  List<Accessory> listAccessory = [
    Accessory(
      id: 'AC1',
      name: "Tape",
      price: 22000,
      imagePath: "assets/images/icon_bangkeo.png",
      size: "100yard x 4cm",
      tooltipIcon: "assets/images/question.png",
      tooltipImage: "assets/images/bang-keo.png",
    ),
    Accessory(
      id: 'AC2',
      name: "Premium Locks",
      price: 165000,
      size: "50mm x 75mm",
      imagePath: "assets/images/icon_okhoa.png",
      tooltipIcon: "assets/images/question.png",
      tooltipImage: "assets/images/locks.png",
    ),
    Accessory(
      id: 'AC3',
      name: "Carton Box",
      price: 25000,
      size: "58cm x 38cm x 34cm",
      imagePath: "assets/images/thungcarton.png",
      tooltipIcon: "assets/images/question.png",
      tooltipImage: "assets/images/carton-box.png",
    ),
    Accessory(
      id: 'AC4',
      name: "Air foam, styrofoam",
      price: 20000,
      size: "50cm x 5m x 3mm",
      imagePath: "assets/images/icon_mangpe.png",
      tooltipIcon: "assets/images/question.png",
      tooltipImage: "assets/images/styrofoam.png",
    ),
    Accessory(
      id: 'AC5',
      name: "Paper Thick",
      price: 16500,
      size: "35cm x 35cm",
      imagePath: "assets/images/giaychen.png",
      tooltipIcon: "assets/images/question.png",
      tooltipImage: "assets/images/paper-thick.png",
    ),
    Accessory(
      id: 'AC6',
      name: "Air bubble foam",
      price: 25000,
      size: "70cm x 5m",
      imagePath: "assets/images/bong-bong-khi.png",
      tooltipIcon: "assets/images/question.png",
      tooltipImage: "assets/images/air-bubble.png",
    ),
  ];

  List<Accessory> findAllByName(List<Map<String, dynamic>> listItem) {
    List<Accessory> searchBox = [];
    Accessory services;
    for (int i = 0; i < listItem.length; i++) {
      for (int j = 0; j < listAccessory.length; j++) {
        if (listItem[i].values.first == listAccessory[j].name) {
          services = listAccessory[j];
          searchBox.add(services);
        }
      }
    }
    // print("List Accessories Item: " + searchBox.length.toString());
    return searchBox;
  }
}
